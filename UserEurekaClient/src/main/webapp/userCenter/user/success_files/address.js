/**
 * 收货地址js
 */

$(document).ready(function (){
	//新增收货地址and编辑地址
	$('.receiptCh .sd').on('click',function(){
		$('.ui-dialog').addClass('active');
	});
	$('.consignee-item a').on('click',function(){
		$('.ui-dialog').addClass('active');
	});
	$('.ui-dialog .consignee .ui-dialog-title a').on('click',function(){
		$('.ui-dialog').removeClass('active');
	});
});