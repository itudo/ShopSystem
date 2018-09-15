$(function(){
	//精简筛选打开关闭
	$('.rangeSearch .search .cndo').on('click',function(){
		$('.rangeSearch .more-part').toggle();
	}); 
	// //下拉菜单
	// $('.mordrMain .rangeSearch .more-part  .type .typeCh').on('click',function(){
	// 	$(this).parent().find('.rc-select-dropdown-menu').addClass('active');
	// }).parent().find('.rc-select-dropdown-menu li').on('click',function(){
	// 	$(this).parents('.type').find('.typeCh').html($(this).html()).parent().removeClass('active').find('.typeCh').attr('data',$(this).attr('data-value'));
	// 	$(this).parent().removeClass('active');
	// });
	
});
// $(function(){
	// $('#search').on('click',function(){
	// 	alert(111)
	// })
// });
function check_order(){
	var name = $('#name').val();
	
	$('.form').submit();
}