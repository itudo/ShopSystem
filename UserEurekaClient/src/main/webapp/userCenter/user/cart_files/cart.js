/**
 * 购物车 js
 */

$(document).ready(function(){

    // 初始化全部不选中, 浏览器有记忆选中按钮
    $('input[type="checkbox"]').attr('checked', false);
	
	$("#tab_1").mouseover(function(){//这是什么东西
		$("#tab1").css("display","block");
		$("#tab2").css("display","none");
		$("#tab_1").attr("style","color:#54AA5C; border-bottom:2px solid #54AA5C;");
		$("#tab_2").attr("style","");
	});
	$("#tab_2").mouseover(function(){
		$("#tab1").css("display","none");
		$("#tab2").css("display","block");
		$("#tab_1").attr("style","");
		$("#tab_2").attr("style","color:#54AA5C; border-bottom:2px solid #54AA5C;");
	});
	//单选框操作
	 $('.goods_num').change(function(){
	        var goods_num=  $(this).val();
	        var id = $(this).parent().siblings('.id').val();
	        var price_new =$('#price_new'+id).val();
	        var count = price_new * goods_num;
	        count = count.toFixed(2);
	        $.get("{:U('Cart/update_goods_num')}", { id:id,goods_num:goods_num },function(data){
	            if(data == 1){
	                $('#count'+id).html(count);
	                good_sum();
	            }
	        });

	    })
	//全选框操作
    $('#selectAll').click(function(){
        if($('#selectAll').is(':checked')==true){
           // alert(1);
            $('.goods_select').attr('checked',true);
        }else{
           // alert(2);
            $('.goods_select').attr('checked',false);
        }
        good_sum();
    });
	  //增加数量
    $('.add_goods_num').click(function(){
    	
    	var number = parseInt($(this).siblings('input[type="text"]').val())+1;
    	//重置数量
    	if (number > 99 ) {
    		layer.msg('商品数量不能大于99');
    		return false;
    	} else {
    		$(this).siblings('input[type="text"]').val(number);
    	}
    	
    	var is_success = price_alone($(this).attr('aggId'),number);
    	if (is_success) {
    		//小计金额
        	var small_monery = number * $(this).attr('goods_price');
        	$(this).parent().siblings('.jisuan').text(small_monery);
    	} else {
    		layer.msg('库存不足');
    		return false;
    	}
    	if ($(this).parents('.cart_list').find('input[type="checkbox"]').attr('checked')) {
    		//重新计算总金额
        	var monery = $(this).parents('.Order-form').siblings('.div_jiesuan').find('.klhjkhkhj').text();
        	monery = parseInt(monery.replace('￥', '')) + parseInt($(this).attr('goods_price'));
        	$(this).parents('.Order-form').siblings('.div_jiesuan').find('.good_money_sum').text('￥'+monery);
    	}
    	return true;
    });
    
    //递减数量
    $('.drop_goods_num').click(function(){
    	
    	var number = parseInt($(this).siblings('input[type="text"]').val())-1;
    	//重置数量
    	if (number < 1 ) {
    		layer.msg('商品数量不能小于1');
    		return false;
    	} else {
    		$(this).siblings('input[type="text"]').val(number);
    	}
    	
    	var is_success = price_alone($(this).attr('aggId'),number);
    	if (is_success) {
    		//小计金额
        	var small_monery = number * $(this).attr('goods_price');
        	$(this).parent().siblings('.jisuan').text(small_monery);
    	} else {
    		layer.msg('库存不足');
    		return false;
    	}
    	
    	if ($(this).parents('.cart_list').find('input[type="checkbox"]').attr('checked')) {
    		//重新计算总金额
        	var monery = $(this).parents('.Order-form').siblings('.div_jiesuan').find('.klhjkhkhj').text();
        	monery = parseInt(monery.replace('￥', '')) -parseInt($(this).attr('goods_price'));
        	$(this).parents('.Order-form').siblings('.div_jiesuan').find('.good_money_sum').text('￥'+monery);
    	}
    	return true;
    });
    
  //复选框初始化
    var isChecked = true;
    $('.cart_list').each(function(){
    	alert(1)
    	if(!isChecked) {
    		$(this).find('input[type="hidden"]').each(function(){
    			$(this).attr('disabled','disabled');
    		})
    	}
    	// 商品数量操作
    	$(this).find('.prarent_nub').find('input[type="text"]').attr('disabled','disabled');
    });
    
    /**
     * 复选框操作 （未选中的移除数据）
     */
    $('input[type="checkbox"]').click(function(){
    	if( $(this).attr('checked') ) {
    		$(this).siblings('input[type="hidden"]').each(function(){
    			$(this).removeAttr('disabled');
    			$(this).siblings('.prarent_nub').find('input[type="text"]').removeAttr('disabled');
    		});
    		
    		$(this).parent().siblings('.cart_list').each(function(){
    			if (!$(this).find('input[type="checkbox"]').attr('checked'))
    			{
    				$(this).find('input[type="hidden"]').each(function(){
    					$(this).attr('disabled','disabled');
    				})
    				$(this).siblings('.prarent_nub').find('input[type="text"]').attr('disabled','disabled');
    			}
    			
    		});
    	} else {
    		//disabled
    		$(this).parent().siblings('.cart_list').each(function(){
    			$(this).find('input[type="hidden"]').each(function(){
    				$(this).attr('disabled','disabled');
    			})
    			$(this).siblings('.prarent_nub').find('input[type="text"]').attr('disabled','disabled');
    		});
    	}
    });
});


//计算单个商品的数量
function price_alone(id,nmb){
	var cart_data = null;
    $.ajax({
    	url  : cart_update,
    	type : 'get',
    	data : { id:id,goods_num:nmb },
    	dataTYpe : 'json',
    	async: false,
    	success:function(data) {
    		if(data == 1){
            	cart_data = data;
               return true;
            } else {
               return false;
            }
    	},
    	error : function(res) {
    		layer.msg('请求超时');
    		return false ;
    	}
    });
    return cart_data === null ? false : (cart_data == 1 ? true : false);
}

//删除其中一个商品

//计算单个商品时价格
function goods_alone(id){
    //判断是否是全选
    good_sum();
}
//计算多个商品的合集
function good_sum(){
    var str = 0;
    var nub = 0;
    $('.goods_select:checked').each(function(){
         nub += parseInt($(this).siblings('.prarent_nub').find('.goods_num').val());

        str += parseFloat($(this).siblings('.jisuan').text());
    });
    str = str.toFixed(2);
    $('.b_nub').html(nub);
    $('#price_sum').val(str);
    $('.good_money_sum').text(str);
}


//删除选中的商品 Tourism
function del_all(){
    var r=confirm("确定要删除吗？")
    if (r==true){
        var str = '';
        $('.goods_select:checked').each(function(){
            str +=$(this).next('.id').val()+',';
        })
        str = str.substring(0,str.length-1);
        $.post(cart_m,{id:str},function(data){
            if(data.code==1){
                $('.goods_select:checked').each(function(){
                    $(this).parent().remove();
                });
                good_sum();
            }else{
                layer.msg('删除失败');
            }
        },"json");
    }

}


function shoucang(goods_id){
	$.post(shou_cang,{goods_id:goods_id},function(data){		
		if(data == true){
			layer.msg('收藏成功');
			$('#shoucang_'+goods_id).html('已收藏');
		}else{
			layer.msg('已收藏');
		}
	},"json");
}

//检测复选框是否选中
function check()
{
	var i = 0;
	$('input[type="checkbox"]').each(function(){
		if ($(this).is(":checked"))
		{
			i++;
		}
	});
	return i===0 ? false : true;
}
/**
 * 移除多个商品
 * @param  {object} obj 对象
 * @return {boolean}
 */
function delete_many(obj) {

    var goods = $('.cart .cart-main .cart-list dd.active');
    if (typeof(goods) == 'undefined' || goods.length < 1) {
        layer.msg('至少选择一个商品');
        return false;
    }

    var id_str  = '';
    goods.each(function(index, ele) {
        id_str += ','+$(ele).attr('data-id');
    });
    id_str = id_str.substring(1);

    $.ajax({
        type: "GET",
        url: $(obj).attr('href'),
        data: {'cart_id': id_str},
        success: function(ret) {
            if (ret == 1) {
                window.location.href = delete_many_url;
            } else {
                layer.msg('删除失败');
            }
        }
    });

    return false;
}


/**
 * 移动商品到收藏夹
 */
function move_many(obj) {
    var goods = $('.cart .cart-main .cart-list dd.active');
    if (typeof(goods) == 'undefined' || goods.length < 1) {
        layer.msg('至少选择一个商品');
        return false;
    }
    var id_str  = '';
    goods.each(function(index, ele) {
        id_str += ','+$(ele).attr('data-goods-id');
    });
    id_str = id_str.substring(1);

    $.ajax({
        type: "GET",
        url: $(obj).attr('href'),
        data: {'goods_id': id_str},
        success: function(ret) {
            if (ret == 1) {
                window.location.href = "{U('goods')}";
            } else {
                layer.msg('移动失败');
            }
        }
    });

    return false;
}


/**
 * 结算
 */
function comfirm_now() {
    var id_str = '';
    var list   = $('.cart .cart-main .cart-list');
    list.each(function(index, ele){
        $(ele).find('dd.active').each(function(index, obj) {
            var temp = $(obj).attr('data-id');
            if (typeof(temp) != "undefined") {
                id_str += ','+temp;
            }
        });
        $(ele).find('dt.active').each(function (index, obj) {
            var temp = $(obj).attr('data-id');
            if (typeof(temp) != "undefined") {
                id_str += ','+temp;
            }
        })
    });

    if (id_str.length < 1) {
        layer.msg('请选择商品');
        return false;
    }
    id_str   = id_str.substring(1);
    //alert(id_str)
    window.location.href = "success2.jsp?id_str="+id_str;
    //form.submit();
}


/**
 * 重新购买
 */
function again(obj) {
    var url       = $(obj).attr('href');
    var goods_id  = $(obj).attr('data-id');
    var goods_num = $(obj).attr('goods-num');

    var data = {
        'goods_id':goods_id,
        'goods_num':goods_num
    }
    StandardPost(url, data);
    return false;
}



function StandardPost(url,args) {
var form = $("<form method='post'></form>");
form.attr({"action":url});
for (arg in args) {
    var input = $("<input type='hidden'>");
    input.attr("name", arg);
    input.val(args[arg]);
    form.append(input);
}
$(document.body).append(form);
form.submit();
}


// 商品选择
var iNow = 0;
// 头按钮选中所有
$('.cart .cart-main .cart-thead input[type=checkbox]').on('click', function (){

    // 移除普通商品背景
    var dd = $('.cart .cart-main .cart-list dd');
    dd.removeClass('active');

    // 移除优惠套餐背景
    var dt = $('.cart .cart-main .package-list dt');
    dt.removeClass('active');


    // 商品按钮
    var goods_btn = $('.cart .cart-main .cart-list input[type=checkbox]');

    // 尾部按钮
    var footer_btn = $('.ui-ceilinglamp .toolbar-wrap .toolbar-left input[type=checkbox]');

    if ($(this).get(0).checked) { // 选中所有
        iNow = dd.length;
        dd.addClass('active');
        dt.addClass('active');
        goods_btn.attr('checked', true);
        footer_btn.attr('checked', true);

    } else { // 清除所有
        goods_btn.attr('checked',false);
        footer_btn.attr('checked',false);
        iNow = 0;
    }
    $('.ui-ceilinglamp .toolbar-wrap .toolbar-right span em.active').html(iNow);
    sum();
});
// 商品列表选中
$('.cart .cart-main .cart-list input[type=checkbox]').on('click',function(){

    iNow = $('.cart .cart-main .cart-list dd.active').length;
    var current = 1;
    var html = $(this).parent().parent();
    if (html.is('dt')) {
        current = 0;
        data = html.nextAll();
        $.each(data, function (index, obj) {
             if ($(obj).is('dt')) {
                current = index;
                return false;
             }
             current = index+1;
        });
        html = html.nextAll('dd:lt('+current+')');

        var coll = $('.ui-ceilinglamp a.follow-batch');
        if ($(this).get(0).checked) {
            coll.css('display', 'none');
        } else {
            coll.css('display', '');
        }
    }

    if($(this).get(0).checked){
        $(this).parent().parent().addClass('active');
        html.addClass('active');
        iNow += current;
    }else{
        $(this).parent().parent().removeClass('active');
        html.removeClass('active');
        iNow -= current;
    }


    // 头部按钮
    var header_btn = $('.cart .cart-main .cart-thead input[type=checkbox]');
    var footer_btn = $('.ui-ceilinglamp .toolbar-wrap .toolbar-left input[type=checkbox]');
    if (iNow >= $('.cart .cart-main .cart-list dd').length) {
        header_btn.attr('checked', true);
        footer_btn.attr('checked', true);
    } else {
        header_btn.attr('checked', false);
        footer_btn.attr('checked', false);
    }
    $('.ui-ceilinglamp .toolbar-wrap .toolbar-right span em.active').html(iNow);
    sum();
});

// 商品底部选中
$('.ui-ceilinglamp .toolbar-wrap .toolbar-left input[type=checkbox]').on('click',function(){

    // 添加样式
    var dd = $('.cart .cart-main .cart-list dd');
    dd.removeClass('active');
    var dt = $('.cart .cart-main .package-list dt');
    dt.removeClass('active');

    // 商品选中列表
    var goods_btn  = $('.cart .cart-main .cart-list input[type=checkbox]');
    var header_btn = $('.cart .cart-main .cart-thead input[type=checkbox]');
    if ($(this).get(0).checked) {
        iNow = dd.length;
        goods_btn.attr('checked', true);
        header_btn.attr('checked', true);
        dd.addClass('active');

    } else {
        iNow = 0;
        goods_btn.attr('checked', false);
        header_btn.attr('checked', false);
    }

    $('.ui-ceilinglamp .toolbar-wrap .toolbar-right span em.active').html(iNow);
    sum();
});

// 购物条浮动
function float(){
    if($(document).scrollTop() >= 600){
        $('.cart .ui-ceilinglamp').removeClass('active');
    }else{
        $('.cart .ui-ceilinglamp').addClass('active');
    }
}
float();
$(document).on('scroll',float);

// 移入收藏夹
$('.cart .cart-main .cart-list dd .cart-follow').on('click',function(){
    var obj = $(this);
    return showDialog(1, function() {
        $.ajax({
            type: "GET",
            url: obj.attr('href'),
            success: function(ret) {
                if (ret > 0) {
                    obj.parent().parent().remove();
                } else {
                    layer.msg('移动失败');
                }
            }
        });
    }, function(){
        return true;
    });
});


// 商品删除
$('.cart .cart-main .cart-list dd .cart-remove').on('click',function(){
	

    return showDialog(2, function() {
    	var id = $("#delCart").attr("value");
    	delCart(id);
    	/*$.getJSON("http://localhost:8762/service-user/delCartDetail.action",{"cartdetail_id":id},function(data) {
    		if (data.code == 1) {
    			alert(2)
             layer.msg('删除成功');
   			 
   		 }
        });*/
    });
});
function delCart(id){
	alert(id)
	 $.getJSON("http://localhost:8762/service-user/delCartDetail.action",{"cartdetail_id":id},function(data) {
		 if(data.code==1) {
			 window.location.href = "http://localhost:8762/service-user/userCenter/user/cart.jsp";
		 }
	 })
}
// 喜欢 最近浏览切换
$('.guessLike .nav-botm li').on('mouseenter',function(){
    $('.guessLike .goods-list .c-panel-main').removeClass('active').eq($(this).index()).addClass('active');
    $('.guessLike .nav-botm li').removeClass('active').eq($(this).index()).addClass('active');
});


// 手动修改购物车输入框的数量
function update_input_number(url, cart_id, obj, type) {
    var N = $(obj).val();
    var flag = 1;
    if (isNaN(parseInt(N)) || parseInt(N) < 1) {
        layer.msg('请正确输入数量');
        $(obj).val(1);
        N = 1;
        flag = 0;
    }

    var price = $(obj).parent().prev().find('b');
    price = parseFloat(price.text().substring(1));
    price = isNaN(price) ? 0 :price;
    $(obj).parent().next().find('em').text(price * N);

    
    sum();

    if (flag == 0) {
        return false;
    }
    update_number(url, cart_id, N, function(ret) {
        if (ret.code != 1) {
            layer.msg('修改数量失败,数量不足');
        }
    });
}

// 数量减
$('.cart-main .cart-list .p-quantity .decrement').on('click', function () {
    var N = $('.cart-main .cart-list .p-quantity input').eq($(this).parent().parent().index()).val();
    N = isNaN(parseInt(N)) ? 0 : N;
    if(N <= 1){
        $('.cart-main .cart-list .p-quantity .decrement').eq($(this).parent().parent().index()).addClass('active');
    }else{
        N--;
        $('.cart-main .cart-list .p-quantity input').eq($(this).parent().parent().index()).val(N);

        var parent  = $(this).parent().parent();
        var url     = parent.attr('data-url');
        var cart_id = parent.attr('data-id');
        update_number(url, cart_id, N, function(ret) {
            if (ret.code != 1) {
                layer.msg('修改数量失败,数量不足');
            }
        });
    }

    sum_one(this, N);
});

// 数量加
$('.cart-main .cart-list .p-quantity .increment').on('click',function(){
    var N = $('.cart-main .cart-list .p-quantity input').eq($(this).parent().parent().index()).val();
    N = isNaN(parseInt(N)) ? 0 : N;
    N++;
    $('.cart-main .cart-list .p-quantity input').eq($(this).parent().parent().index()).val(N);
    if(N >= 1){
        $('.cart-main .cart-list .p-quantity .decrement').eq($(this).parent().parent().index()).removeClass('active');

    }
    var parent  = $(this).parent().parent();
    var url     = parent.attr('data-url');
    var cart_id = parent.attr('data-id');
    update_number(url, cart_id, N, function(ret) {
        if (ret.code != 1) {
            layer.msg('修改数量失败,数量不足');
        }
    });

    sum_one(this, N);
});

/**
 * 修改商品数量
 * @param  {int} cart_id   购物车记录ID
 * @param  {int} goods_num 商品数量
 * @return {Boolean}
 */
function update_number(url, cart_id, goods_num, done) {
	//alert(url)
    $.ajax({
        type: "POST",
        url: url,
        data: {'cartdetail_id':cart_id, 'goods_count':goods_num},
        success: function(ret) {
        	//alert(ret.code)
            if (done) {
                done(ret);
            }
        }
    });
    return false;
}


/**
 * 显示对话框
 * @param  {int} type 类型:1.移入收藏夹 2.删除
 * @param  {function} 回调函数,当选择确定的时候修改
 * @return {Boolean}
 */
function showDialog(type, done, cancel) {

    // 数据
    var data1 = {
        title:'移入收藏夹',
        content:'移入收藏夹',
        sub:'移动后选中商品将不在购物车中显示。',
        done:'移到我的收藏夹',
        cancel:'取消'
    };
    var data2 = {
        title:'删除',
        content:'删除商品',
        sub:'删除后选中商品将不在购物车中显示。',
        done:'确定',
        cancel:'取消'
    };

    // 隐藏页面
    var close = function(dialog) {
        dialog.removeClass('active');
    };

    // 注册事件
    var dialog  = $('.ui-dia-parent-t');
    var handler = function(dialog, done, cancel) {
        var btn = dialog.find('.ui-dialog-content .op-btns a');
        btn.unbind();
        btn.eq(0).on('click', function() {
            if (done !== undefined) {
                var act = done();
                if (act !== false) {
                    close(dialog);
                }
            }
        });
        btn.eq(1).on('click', function() {
            if (cancel !== undefined) {
                var act = cancel();
                if (act !== false) {
                    close(dialog);
                }
            } else {
                close(dialog);
            }
        });
    };
    handler(dialog, done, cancel);


    // 渲染页面
    var render = function(data) {
        var dialog = $('.ui-dia-parent-t');
        dialog.find('.ui-dialog-title .fl').html(data.title);
        dialog.find('.ui-dialog-content .item-fore h3').html(data.content);
        dialog.find('.ui-dialog-content .item-fore p').html(data.sub);
        dialog.find('.ui-dialog-content .op-btns a').eq(0).html(data.done);
        dialog.find('.ui-dialog-content .op-btns a').eq(1).html(data.cancel);
        dialog.addClass('active');
    };
    render((type==1)?data1:data2);

    return false;
}

// 计算
function sum() {
    var total = 0;
    var goods = $('.cart .cart-main .cart-list dd.active');
    goods.each(function(index, ele) {
        var number = $(ele).find('.p-quantity input').val();
        if (isNaN(parseFloat(number))) {
            number = $(ele).find('.p-quantity').text();
            number = parseFloat(number);
            number = isNaN(number) ? 0 : number;
        }
        var price  = $(ele).find('.p-price b').html();
        var sum_p  = parseFloat(price.substring(1)) * number;
        sum_p = isNaN(sum_p) ? 0 : sum_p;
        $(ele).find('.p-sum em').val(sum_p);
        total     += sum_p;
    });

    $('.cart .cart-filter-bar .cart-store span b').html('￥'+total.toFixed(2));
    $('.ui-ceilinglamp .toolbar-right span').eq(1).find('b').html(total.toFixed(2));
    $('.cart-main .p-single span em').html('￥'+total.toFixed(2));
}

// 计算单个商品价格
function sum_one(obj, num) {
    var price = $(obj).parent().prev().find('b').html();
    price = parseFloat(price.substring(1));
    price = isNaN(price) ? 0 :price;
    $(obj).parent().next().find('em').html((price * num).toFixed(2));
    sum();
}

// 显示删除的商品
function showDelete(data) {
    var ele = $('.cart-main .cart-removed');
    ele.find('.r-item .r-name a').html(data.title);
    ele.find('.r-item .r-price').html(data.price);
    ele.find('.r-item .r-quantity').html(data.goods_num);
    
    var href = ele.find('.r-item .r-ops a').eq(0).attr('href');
    href = href + '/goods_id/' + data.goods_id + '/goods_num/' + data.goods_num;
    ele.find('.r-item .r-ops a').eq(0).attr('href', href);

    href = ele.find('.r-item .r-ops a').eq(1).attr('href');
    href = href + '/goods_id/' + data.goods_id;
    ele.find('.r-item .r-ops a').eq(1).attr('href', href);
    ele.css('display', 'block')
}

