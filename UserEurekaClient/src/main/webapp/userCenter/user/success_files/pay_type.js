/**
 * 
 */
	//支付方式选择
$('.balance_money').on(
		'click',
		function() {

			$('.balance_money').removeClass('active').eq($(this).index())
					.addClass('active');

			var value = $(this).attr('value');

			if (value == PAY_ID) {

				$.post(BALANCE, {}, function(res) {
					var money = res.data.money;
					layer.msg('余额：' + money + "元");
					balanceQ = money;
				})
			}

		});