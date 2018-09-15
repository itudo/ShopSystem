(function(){ 
	return $.post(AREA_LIST_CITY,{},function(res){
		return $('#areaList').html(res);
	},'');
})();

$(document).ready(function(){
	//头部右侧效果
	$('.nav-right li').on('mouseenter',function(){
		$('.nav-right li').eq($(this).index()).addClass('up');
	}).on('mouseleave',function(){
		$('.nav-right li').removeClass('up');   
	});
	$('.mobile').on('mouseenter',function(){
		$('.mobile .mobile-phone s').animate({top:0},100);
		$('.mobile .mobile-phone b').animate({top:-22+'px'},100);
		$(this).addClass('active');
	}).on('mouseleave',function(){
		$('.mobile .mobile-phone s').animate({top:22},100);
		$('.mobile .mobile-phone b').animate({top:0+'px'},100);
		$(this).removeClass('active');
	});
	//一件到顶
	$('.hm-go-top-parent').on('mouseenter',function(){
		$('.hm-go-top-parent .hm-tit-top').stop().animate({width:70,left:-70},300);
	}).on('mouseleave',function(){
		$('.hm-go-top-parent .hm-tit-top').stop().animate({width:0,left:0},300);
	}).on('click',function(){
		$('html,body').animate({scrollTop:0},500);
	});
	

	//服务
	$('.home-tab li').on('mouseover',function(){
		$('.home-tab li .userTips').eq($(this).index()).addClass('active');
	}).on('mouseout',function(){
		$('.home-tab li .userTips').removeClass('active');
	});
	$('.home-tab li').eq(5).on('click',function(){
		$('.home-tab').css('display','none');
	});

	//购物车
	$('.home-shopping').on('mouseenter',function(){
		$(this).addClass('active');
	}).on('mouseleave',function(){
		$(this).removeClass('active');
	});
	//懒加载
	//二级菜单
	$('.level .menu').on('mouseenter',function(){
		
		$(this).removeClass('active').eq($(this).index()-1).addClass('active');
	}).on('mouseleave',function(){
		$('.level .menu').removeClass('active');
	});
	
	//左侧下拉菜单
	$('.person-section .ficationFl dl dt').on('click',function(){
		
		$(this).parent().toggleClass('active');
	});

	//导航隐藏层弹出
	$('.public-header1 .center-parent .nav li').on('mouseenter',function(){
		$('.public-header1 .center-parent .nav li').eq($(this).index()).addClass('active');
	}).on('mouseleave',function(){
		$('.public-header1 .center-parent .nav li').removeClass('active');
	});
	
	//优惠券查看
	$('.conConterWrap .exhibition .discount').on('mouseenter',function(){
		$(this).addClass('active');
		$('.conConterWrap .exhibition .discount dt em').css({
			'-ms-transform':'rotateX('+180+'deg)',
			'-moz-transform':'rotateX('+180+'deg)',
			'-webkit-transform':'rotateX('+180+'deg)',
			'-mo-transform':'rotateX('+180+'deg)'
		});
	}).on('mouseleave',function(){
		$(this).removeClass('active');
		$('.conConterWrap .exhibition .discount dt em').css({
			'-ms-transform':'rotateX('+0+'deg)',
			'-moz-transform':'rotateX('+0+'deg)',
			'-webkit-transform':'rotateX('+0+'deg)',
			'-mo-transform':'rotateX('+0+'deg)'
		});
	});
});