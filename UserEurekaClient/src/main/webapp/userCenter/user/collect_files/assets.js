$('.mcole-section-wrap .content-main').on('click',
		'.products-operation input[name=del]', function() {
			var id = $(this).attr('data-value');
			var _this = $(this);
			parent.layer.confirm('真的要删除吗？', {
				btn : [ '确认', '取消' ],
				shade : 0.5
			}, function() {
				$.post("http://localhost:8762/service-user/delCollect.action", {
					"goodsdetail_id" : id
				}, function(data) {
					if (data.code == 1) {
						parent.layer.msg('删除成功', {
							icon : 1,
							time : 1000
						}, function() {
							$("#del" + id).remove();
						});
					} else {
						parent.layer.msg('删除失败', {
							icon : 2,
							time : 2000
						});
					}
				}, "json");
			}, function() {
			});
		});
$('.myTck-content-wrap .con-main li').on('click', '.products-operation .del',
		function() {
			var id = $(this).attr('data-value');
			parent.layer.confirm('真的要删除吗？', {
				btn : [ '确认', '取消' ],
				shade : 0.5
			}, function() {
				$.post("/index.php/Home/Assets/myTracks_del", {
					"id" : id
				}, function(data) {
					if (data == 1) {
						parent.layer.msg('删除成功', {
							icon : 1,
							time : 1000
						}, function() {
							$("#del" + id).remove();
						});
					} else {
						parent.layer.msg('删除失败', {
							icon : 2,
							time : 2000
						});
					}
				}, "json");
			}, function() {
			});
		})
var aLi = $('.myTck-content-wrap .nav-wrap .btn');
aLi.on('click', function() {
	parent.layer.confirm('真的要删除吗？', {
		btn : [ '确认', '取消' ],
		shade : 0.5
	}, function() {
		$.post("myTracks_del_all", {
			"id" : 5
		}, function(data) {
			if (data == 1) {
				parent.layer.msg('删除成功', {
					icon : 1,
					time : 1000
				}, function() {
					$('.myTck-content-wrap .con-main li').remove();
				});
			} else {
				parent.layer.msg('删除失败', {
					icon : 2,
					time : 2000
				});
			}
		}, "json");
	}, function() {
	});
});