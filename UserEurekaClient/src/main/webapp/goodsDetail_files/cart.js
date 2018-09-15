/**
 * 购物车js
 */
(function () {
	
	/**
	 * 添加购物车 
	 * @param int goodsId 商品编号
	 * @param int goodsNum 商品数量
	 */
	this.addCart = function(event, goodsNum, url) {
		
		var obj = $('#'+goodsNum);
		
		if ( !obj.length |!(event instanceof Object)) {
			toastr.error("未知错误");
			return false;
		}
		
		
		var json = {
		};
		var flag = 1;
		$(event).siblings().each(function(){
			if(! $(this).val()) {
				flag++;
			}
			json[$(this).attr('name')] = $(this).val();
		});
		
		if(flag !== 1) {
			toastr.error("请选择完整,包括发货地址");
			return false;
		}
		json['goods_num'] = obj.val();
		
		return $.post(url, json, function (res) {
			if (res.status == 1) {
				toastr.success(res.message);
			}  else {
				toastr.error(res.message);
				setInterval(function() {
					window.location.href = res.data.url;
				}, 3000);
			}
			return false;
		});
	}

	/**
	 *购物车局部刷新重新逻辑
	 */
	this.newAddCart = function(event, goodsNum, url) {

		var obj = $('#'+goodsNum);

		if ( !obj.length |!(event instanceof Object)) {
			toastr.error("未知错误");
			return false;
		}


		var json = {
		};
		var flag = 1;
		$(event).siblings().each(function(){
			if(! $(this).val()) {
				flag++;
			}
			json[$(this).attr('name')] = $(this).val();
		});

		if(flag !== 1) {
			toastr.error("请选择完整,包括发货地址");
			return false;
		}
		json['goods_num'] = obj.val();

		return $.post(url, json, function (res) {
			if (res.status == 1) {
				var cartHtml='';
				var packageHtml='';
				$.each(res.data,function(i,n){
					if(n.buy_type==1 && n.title!=null) {
						cartHtml += "<dd class='clearfix active'> <a href='javscript:;' class='fl'> <img src='" + n.pic_url + "' alt=''> </a> <a href='" + n.cart_url + "' class='fl con'>" + n.title + " </a> <strong class='fl'> <span>￥" + n.price_new + "</span>x" + n.goods_num + "<br> <a href='javascript:;' class='dels' data='" + n.id + "'>删除</a> </strong> </dd>"
					}else if(n.buy_type==2 && n.goods_data!=null)
					{
						packageHtml+="<dd class='clearfix active'> <a href='javscript:;' class='fl'> </a> <a href='"+ n.cart_url+"' class='fl con'>套餐 </a> <strong class='fl'> <span>￥"+ n.price_new+"</span><br> <a href='javascript:;' class='dels' data='"+n.id+"'>删除</a> </strong> </dd>"
					}
				})
				$('#new_cart_data').empty();
				$('#new_cart_data').append(cartHtml);
				$('#new_cart_data').append(packageHtml);
				$('#couts').empty();
				//console.log(res.status);
				$('#couts').append(res.data['new_cart_count']);
				toastr.success(res.message);
			} else if (res.status == 0) {
				toastr.error(res.message);
				setInterval(function() {
					window.location.href = res.data.url;
				}, 3000);
			} 
			return false;
		});
	}

	/**
	 * 根据购买类型添加到购物车
	 */
	this.addCart4Package = function(obj, goodsId, url) {

		var data = {
			'goods_id':goodsId,
			'goods_num':1,
			'buy_type':2
		}
		$.post(url, data, function (res) {
			if (res.status == 1) {
				toastr.success(res.message);
				return false;
			}
			toastr.error(res.message);
		});
		return false;
	}
	window.Cart = this;
})(window);