$(function(){
	//商品导航折叠功能
	;(function(){
		$('.productDeta-main .categoryList dt').on('click',function(){
			if($(this).attr('data') == 'false'){
				$(this).parent().addClass('active');
				$(this).attr('data','true');
			}else{
				$(this).parent().removeClass('active');
				$(this).attr('data','false');
			}
		});
	})();
	//内容划入效果
	$('.productList1').on('mouseenter','li',function(){
		$(this).addClass('active');
	}).on('mouseleave','li',function(){
		$('.productList1 li').removeClass('active');
	});
});