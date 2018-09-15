/**
 * 
 */


(function(w, t) {
	function address() {

		this.isAdd = true;
		
		this.run = false;
		/**
		 * 添加地址
		 */
		this.addUserAddress = function(formId, url) {

			var formObj = $('#' + formId);

			if (!formObj.length) {
				return toastr.error('未知错误');
			}

			var rule = [];
			var name, falg = "";
			var message = {};
			formObj.find('.req').each(function() {
				name = $(this).attr('name');
				flag = $(this).attr('validateRule');

				switch (parseInt(flag)) {
				case 1: // 验证收货人
					rule[name] = {
						required : true,
						checkChinese : true
					};
					message[name] = "请输入收货人姓名必须是中文";
					break;
				case 2: // 电话号码
					rule[name] = {
						required : true,
						checkMobile : true,
					};
					message[name] = "请输入有效的电话号码且不能为空";
					break;
				case 3: // 座机号码
					rule[name] = {
						checkTelphone : true
					};
					break;
				case 4: // 座机号码
					rule[name] = {
						email : true
					};
					break;
				default:
					rule[name] = {
						required : true,
					};
					message[name] = "请输入有效的详细地址";
					break;
				}

			});
			return formObj.validate({
				rules : rule,
				messages : message,
				submitHandler : function() {
					var data = formObj.formToArray();

					return Tool.ajax(url, data, function(res) {
						var data = res.data;
						toastr.success(res.message);
						setInterval(function() {
							  location.reload();
						}, 3000);
					});
				}
			});

		}

		/**
		 * 快递列表
		 */
		/*this.express = function(url, id, goodsNum) {

			var obj = $('#' + id);
			var value = obj.val();
			console.log(value);
			if (!this.isNumer(value)) {
				toastr.error('数据错误');
				return false;
			}

			var json = {};
			json[obj.attr('name')] = value;
			json['goodsNum'] = goodsNum;
			return $.post(url, json, function(res) {
				$('#expressData').html('');
				$('#expressData').html(res);
			}, '');
		}*/

		/**
		 * 修改地址
		 */
		this.editAddress = function(id, url) {

			var json = {
				id : id
			};
			return $.post(url, json, function(res) {
				$('#however').html('');
				$('#however').html(res);
				$('.however').addClass('active');
			}, '');
		}
		/**
		 * 通用 ajax 获取数据页面 
		 */
		this.ajaxGetContent = function (id, url)
		{
			var obj = $('#'+id);
			return $.post(url, {}, function(res) {
				obj.html('');
				obj.html(res);
			}, '');
		}
		/**
		 * 获取列表
		 */
		this.couponList = function(id, url) {
			
			var flag = this.run;
			var self = this;
			return $.post(url, {}, function(res) {
				$('#' + id).html('');
				$('#' + id).html(res);
				 if(!flag){
					 return ;
				 }
				 self.aplyValue('addressId');
				 self.express(SHIPPING, 'addressId', GOODS_NUM);
			}, '');
		}
		
		/**
		 * 选择收货人地址
		 */
		 this.choseAddress = function(ele) {
			 var obj = $(ele);
			 obj.parents('.receipt').find('.consignee-item').each(function(index, obj) {
				var div = $(obj).find('div');
				if (div.hasClass('active')) {
					div.removeClass('active');
					div.addClass('place');
				}
			});
			obj.removeClass('place');
			obj.addClass('active');
			//alert(ele.html)
			/*$("#to_userName").val(touser);
			$("#to_userName").val(touser);
			$("#to_userName").val(touser);*/
			$('#addressId').val(obj.attr('data-id'));
			//this.express(SHIPPING, 'addressId', GOODS_NUM);
			return this.renderTotal(ele);
		}
		
		/**
		 * 渲染订单信息
		 */
		 this.renderTotal = function(consignee) {
			 //alert(consignee)
			consignee    = $(consignee).parent();
			var realname = $(consignee).find('span').eq(0).text();
			var address  = $(consignee).find('span').eq(1).text();
			var mobile   = $(consignee).find('span').eq(2).text();
			$("#to_userName").val(realname);
			$("#to_addr").val(address);
			$("#to_tel").val(mobile);
			var orInfio  = $('.orInfio .total .two');
			//alert(realname)
			orInfio.text('寄送至：'+address+' 收货人：'+realname+'   '+mobile);
		}
		
		/**
		 * 为地址赋值 
		 */
		this.aplyValue = function (id)
		{
			var items = $('.orInfio .receipt .consignee-item');
			var consignee_id = 0;
			items.each(function(index, ele) {
				if ($(ele).find('div').hasClass('active')) {
					consignee_id = $(ele).attr('data-id');
					return true;
				}
			});
			
			return $('#'+id).val(consignee_id);
		}
		/**
		 * 提交订单
		 */
        var checkSubmitFlg = false;
        var checkSubmitFlg2 = false;
		this.submitOrder = function() {

			var obj = $('.payment .active');
			
			var value = $('#to_addr').val();
			if (!value || value == 0) {
				toastr.error('请选择或添加收货地址');
				return false;
			}

            if (!checkSubmitFlg) {
                // 第一次提交
                checkSubmitFlg = true;
                $.ajax({
                	url:"http://localhost:8762/service-user/insertOrder.action",
                	type:"POST",
                	data: $("#formId").serialize(),
                	dataType:"JSON",
                	success:function (res) {
	                    if(res.code == 1){
	                    	toastr.error('恭喜您，订单创建成功，请前往订单中付款');
	                    	window.location.href = "http://localhost:8762/service-user/userCenter/user/myOrder.jsp";
	                    }else{
	                        if (!checkSubmitFlg2) {
	                            toastr.error('正在创建订单中,请勿多次提交');
	                        }
	                        $('#tijiao').attr('disabled', "true");
	                    }
                	}
                })
            } else {
                //重复提交
                if (!checkSubmitFlg) {
                    toastr.error('正在创建订单中');
                    return false;
                }
                $('#tijiao').attr('disabled', 'true');
            }

		}
		
		this.submitOrder2 = function() {

			var obj = $('.payment .active');
			
			var value = $('#to_addr').val();
			if (!value || value == 0) {
				toastr.error('请选择或添加收货地址');
				return false;
			}

            if (!checkSubmitFlg) {
                // 第一次提交
                checkSubmitFlg = true;
                $.ajax({
                	url:"http://localhost:8762/service-user/insertOrderFromCart.action",
                	type:"POST",
                	data: $("#formId").serialize(),
                	dataType:"JSON",
                	success:function (res) {
	                    if(res.code == 1){
	                    	toastr.error('恭喜您，订单创建成功，请前往订单中付款');
	                    	window.location.href = "http://localhost:8762/service-user/userCenter/user/myOrder.jsp";
	                    }else{
	                        if (!checkSubmitFlg2) {
	                            toastr.error('正在创建订单中,请勿多次提交');
	                        }
	                        $('#tijiao').attr('disabled', "true");
	                    }
                	}
                })
            } else {
                //重复提交
                if (!checkSubmitFlg) {
                    toastr.error('正在创建订单中');
                    return false;
                }
                $('#tijiao').attr('disabled', 'true');
            }

		}
		
		this.getAreaListClear = function (event, url, addObj)
		{
			if (!(event instanceof $) || !(addObj instanceof $) ) {
				layer.msg('参数错误');
				return false;
			}
			var initData = this.areaData;
			
			return this.ajax(url, {id: event.val()}, function (res) {
				
				if (!res.hasOwnProperty('data') || Tool.isEmptyArray(res.data)) {
					layer.msg("暂无数据");
					return false;
				}
				
				var str = "<option value='0'>请选择</option>";
				
				var data = res.data;
				
				var i = 0;
				for( i in data) {
					if (initData.hasOwnProperty('prov') && data[i].id == initData.prov) {
						str += '<option = value="'+data[i].id+'" selected="selected">'+data[i].name+'</option>';
					} else if (initData.hasOwnProperty('city') && data[i].id == initData.city) {
						str += '<option = value="'+data[i].id+'" selected="selected">'+data[i].name+'</option>';
					}else {
						str += '<option = value="'+data[i].id+'">'+data[i].name+'</option>';
					}
				}
				addObj.html('<option value="0">-请选择-</option>');
				$('#dist').html('<option value="0">-请选择-</option>');
				return addObj.html(str);
			});
		}
		
		/**
		 * 显示所有的收货人
		 */
		this.showConsigneeAll = function (ele) {

			var close_css = '', open_css='';
			if ($(ele).hasClass('switch-off')) { // 点击了关闭
				close_css = 'switch-off';
				open_css  = 'switch-on';
				var div;
				// 将选中对象移动到第一个位置
				$(ele).siblings('.consignee-item').each(function(index, obj){
					 div = $(obj).find('div');
					if (div.hasClass('active')) {
						return true;
					}
					$(obj).hide();
				});

			} else { // 点击了打开
				close_css = 'switch-on';
				open_css  = 'switch-off';

				$(ele).parents('#receive').find('.consignee-item').each(function(index, obj){
					if ($(obj).css('display') == 'none') {
						$(obj).css('display', 'block');
					}
				})
			}

			$(ele).removeClass(close_css);
			$(ele).addClass(open_css);
		}
	}

	address.prototype = t;

	w.InterAddress = new address();

	return w.InterAddress;
})(window, Tool);


