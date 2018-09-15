/**
 * 商品详情
 */
(function(){
	
	function Goods() {
		
		this.value = '';
		
		this.connectUrl = '';
		
		this.goodsId = 0;
		
		this.page = 1;
		
		this.getBySpecForPrice = function (obj, idName, url) {
			
			if(!$('#'+idName).length) {
				return false;
			}
			$(obj).siblings('span').removeClass('active');
			$(obj).addClass('active'); 
			var val = '';
			var small= [];
			$(obj).parents('#'+idName).find('.spec').each(function(){
				var span = $(this).find('.active');
				small.push(span.attr('value'));
				small.sort(function(first, next){
					return first-next >0;
				});
				val = small.join("_");
			});
			//val = val.substring(1);

//			val = val.split("_").reverse().join("_");
			var spcData = this.value;

			if (!(spcData instanceof Array ) || this.isEmptyArray(spcData)) {
				return false;
			}
			var i = 0;
			for ( i in spcData) {
				if (spcData[i].key == val) {
					 location.href = url +'/id/'+spcData[i].id+'.html';
					 return true;
				}
			}
		}
		
		this.ajaxGetGuess = function (id, page, url) {
			
			if(!this.isNumer(page)) {
				return false;
			}
			this.dataType = '';
			
			url = typeof url === 'undefined' ? this.connectUrl : url;
			
			return this.post(url, {p : page, id : this.goodsId}, function (res) {
				$('#'+id).html(res);
			})
		}
		
		//猜你喜欢-换一换
		this.changeFor = function (id, pageCount) {
			this.page += 1;
			console.log(this.page);
			return pageCount >= this.page ? this.ajaxGetGuess(id, this.page): false;
		}
		
		/**
		 * 添加咨询 
		 */
		this.Consulation = function(event, url) {
			
			if(cookies.get('flag') != 'undefined') {
				return toastr.error("已经提问过");
			}
			
			var obj = $(event).siblings('input[type="text"]');
			
			var value = obj.val();
			if (!(/^[\u4e00-\u9fa5]+$/i.test(value)) || !value ) {
				toastr.error("请输入中文");
				return false;
			}
			
			var json = {};
			json[obj.attr('name')] = obj.val();
			json['goods_id'] = this.goodsId;
			
			$.post(url, json, function (res) {
				
				if (res.hasOwnProperty('status') && res.status == 1) {
					toastr.success(res.message);
					
					if (!cookies.get('flag')) {
						cookies.set('flag', res.data.flag, 2);
					}
					return true;
				} 
				toastr.error(res.message);
				return true;
			});
		}

		/**
		 * 商品推荐.最佳组合,优惠套餐
		 */
		this.recommend = function(url) {
			var goods_id = this.goodsId;
			var data = {'goods_id': goods_id};
			$.get(url, data, function(ret){
				if (!ret) {
					return false;
				}
				$('#goods_recommend').html(ret);
			});
		}
		
	}
	Goods.prototype = Tool;
	var goodsObj = new Goods();
	window.GoodsObj = goodsObj;
})(window);

window.onload = function () {
	GoodsObj.ajaxGetGuess('guess', 1);
	GoodsObj.ajaxGetGuess('bestSelling', 1, REC_URL);
	GoodsObj.ajaxGetGuess('Consultation', 1, CON_URL);
	GoodsObj.recommend(RECOMMEND_URL);
}

// 请求评论列表
$(function(){
	var comment_url = COMMENT_URL;
	var data = {goods_id:GoodsObj.goodsId, show:'view'};
	$.get(comment_url, data, function(ret){
		if (ret) {
			$('#comment').html(ret);
			return false;
		}
		$('#comment').text('加载失败,请刷新试试');
	});

	var gid    = GoodsObj.goodsId;
	var action = $('body');
	var url    = COMMENT_URL;

	// 全部
	action.on('click', '#comment-class a', function(event){

		$(this).siblings().removeClass('active');
		$(this).addClass('active');

		var type = $(this).attr('data-type');
		var data = {
			goods_id:gid,
			type:type
		};

		$('.comment-parent').removeClass('active');
		var body = $('.comment-parent').eq(type);

		// 已经加载过内容了,就不需要再次加载
		if ((type != 1 && body.find('.Consultation').length > 0) || 
			(type == 1 && body.find('.thumb-prevCentent ul li').length > 0)) {

			body.addClass('active');
			return false;
		}

		// 渲染页面
		$.get(url, data, function(ret){
			if (ret && type == 1) {
				show_pic(ret);
			} else if(ret) {
				render(ret, type);
			} else {
				toastr.error('未知错误');
			}
		});

		return false;
	});

	// 渲染评论页面
	function render(datas, type) {
		var body = $('.comment-parent').eq(type);
		body.empty();
		if (datas.list.length < 1) {
			var div = $('<div> </div');
			div.css('text-align', 'center');
			div.css('line-height', '100px');
			div.html('暂无评价~');
			body.addClass('active');
			body.append(div);
			return false;
		}
		$.each(datas.list, function(key, data) {

			var div = $('<div> </div');
			div.addClass('Consultation clearfix');

			var div1 = $('<div></div>');
			div1.addClass('fl consuFloat');
			var div1_1 = $('<div></div>');
			div1_1.addClass('top');
			for (var i = 0; i < 5; i++) {
				var span = $('<span></span>');
				if (i < data.score) {
					span.addClass('active');
				}
				div1_1.append(span);
			}
			div1.append(div1_1);

			var div1_2 = $('<div></div>');
			div1_2.addClass('data');
			var time = new Date(parseInt(data.create_time)*1000);
			var time = time.getFullYear()+'-'+(time.getMonth()+1)+'-'+time.getDate()
				+' '+time.getHours()+':'+time.getMinutes();
			div1_2.text(time);
			div1.append(div1_2);

			var div2 = $('<div></div>');
			div2.addClass('fl consuCentent');
			var div2_1 = $('<div></div>')
			div2_1.addClass('top');
			if (typeof(data.feel) != 'undefined' && data.feel != null) {
				$.each(data.feel, function(key, value) {
					var span = $('<span></span>');
					span.text(value.title);
					div2_1.append(span);
				});
			}
			div2.append(div2_1);

			var div2_2 = $('<div></div>');
			div2_2.addClass('center');
			div2_2.text(data.content);
			div2.append(div2_2);
			var div2_3 = $('<div></div>');
			div2_3.addClass('bottom');
			if (typeof(data.images) != 'undefined' && data.images != null) {
				$.each(data.images, function(index, value) {
					 var img = $('<img>');
					 img.attr('src', value.path);
					 div2_3.append(img);
				});
			}
			div2.append(div2_3);

			var div3 = $('<div></div>');
			div3.addClass('fl conRight');
			var p3_1 = $('<p></p>');
			if (typeof(data.spec) != 'undefined' && data.spec != null) {
				$.each(data.spec, function(index, value) {
					var span = $('<span> </span>');
					span.text(value.name+':');
					var em   = $('<em></em>');
					em.text(value.item);
					p3_1.append(span);
					p3_1.append(em);
					p3_1.append('<br/>');
				});
			}
			div3.append(p3_1);

			var p3_2   = $('<p></p>');
			var p3_2_1 = $('<span></span>');
			p3_2_1.text(data.show_name);
			p3_2.append(p3_2_1);
			if (parseInt(data.anonymous) == 1) {
				var p3_2_2 = $('<em></em>');
				p3_2_2.text('（匿名）');
				p3_2.append(p3_2_2);
			}
			div3.append(p3_2);
			div.append(div1);
			div.append(div2);
			div.append(div3);

			body.append(div);
		});

		body.addClass('active');
		var page = $('<div></div>');
		page.addClass('page');
		page.append(datas.page);
		body.append(page);
	}

	// 商品晒图
	function show_pic(data){
		var body = $('.comment-parent').eq(1);
		ul = body.find('.thumb-prevCentent ul');
		ul.empty();
		$.each(data, function(index, obj) {

			var li  = $('<li></li>');
			li.addClass('fl');
			var a   = $('<a></a>');
			a.attr('href', 'javascript:;');
			var img = $('<img>');
			img.attr('src', obj);
			if (index == 0) {
				li.addClass('active');
				a.addClass('active');
			}
			li.append(a);
			a.append(img);
			ul.append(li);
		});
		body.addClass('active');

		// 选中第一个图片
		$li = $('.Consultation .thumb-prevCentent li');
		if ($li.length > 0) {
			$li.eq(0).trigger('click');
		}
		return false;
	}

	// thinkphp的分页,需要拦截,使用ajax打开,晒图不需要分页
	$(document).on('click', '.comment-parent .page a', function() {
		
		var url   = $(this).attr('href');
		var index = url.lastIndexOf('type');
		if (index != -1) {
			var ret   = url.substring(index+5)
			index     = ret.indexOf('/');
			var type  = ret.substring(0, index);
		}

		if (type == null || parseInt(type) == NaN) {
			type = 0;
		}

		$.get(url, {}, function(ret){
			if (ret) {
				render(ret, type);
			} else {
				toastr.error('未知错误');
			}
		});
		return false;
	});

	//评价查看选择
	$('.pro-comment .evaluate-nav a').on('click',function(){
		$('.pro-comment .evaluate-nav a').removeClass('active').eq($(this).index()).addClass('active');
		$('.pro-comment .comment-parentNode .comment-parent').removeClass('active').eq($(this).index()).addClass('active');
	});

	//晒图 图片选择效果
	$(document).on('click', '.Consultation .thumb-prevCentent li', function(){
		var _src = $('.Consultation .thumb-prevCentent li a img').eq($(this).index()).attr('src');
		$('.Consultation .thumb-prevCentent li').removeClass('active').eq($(this).index()).addClass('active');
		$('.Consultation .thumb-prevCentent li a').removeClass('active').eq($(this).index()).addClass('active');
		$('.comment-parent .details-parent img').attr('src', _src)
		return false;
	});
	var N = 0;
	//晒图 右按钮
	$(document).on('click', '.comments-showImgSwitch-thumbnails .thumb-prevFr', function(){
		N++;
		$('.Consultation .thumb-prevCentent ul').stop().animate({left:-N*$('.Consultation .thumb-prevCentent').outerWidth()})
		return false;
	});
	//晒图 左按钮
	$(document).on('click', '.comments-showImgSwitch-thumbnails .thumb-prevFl', function(){
		if(N <= 0)return;
		N--;
		$('.Consultation .thumb-prevCentent ul').stop().animate({left:-N*$('.Consultation .thumb-prevCentent').outerWidth()})
		return false;
	});

	// 收藏
	$('#collection_btn').on('click', function() {
		var url = $(this).attr('href');
		var gid = $(this).attr('data-id');
		$.post(url, {goods_id:gid}, function(res){
			if (res == 0) {
				layer.msg('收藏失败');
				return false;
			}
			if (typeof res == 'string') {
				window.location.href = res;
				return false;
			}
			layer.msg('收藏成功')
		});
	});

});