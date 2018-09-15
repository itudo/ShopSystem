window.onload = function() {
    $('html,body').animate({scrollTop:0},500);
    $("img.lazy").lazyload({
	    threshold : 200,
	    effect : "fadeIn"
	});
	(function(){
		$('.floor-main .saleZone-fr .content-main .con dt img').mouseenter(function(){
			var wValue=1.1 * $(this).width();
			var hValue=1.1 * $(this).height();
			$(this).stop().animate({
				width: wValue,
				height: hValue,
				left:("-"+(0.1 * $(this).width())/2),
				top:("-"+(0.1 * $(this).height())/2)
			}, 1000);
		}).mouseleave(function(){
			$(this).stop().animate({
				width: "599",
				height: "247",
				left:"0px",
				top:"0px"
			}, 1000 );
		});
		$('.floor-main .saleZone-fr .content-main .con .img-parent-warp').parent().hover(function(){
			$(this).find('img').stop().animate({'left':60+'%'},700)
		},function(){
			$(this).find('img').stop().animate({'left':50+'%'},700)
		});
		$('.hm-go-top-parent').on('mouseenter',function(){
			$('.hm-go-top-parent .hm-tit-top').stop().animate({width:70,left:-70},300);
		}).on('mouseleave',function(){
			$('.hm-go-top-parent .hm-tit-top').stop().animate({width:0,left:0},300);
		}).on('click',function(){
			$('html,body').animate({scrollTop:0},500);
		});
		$('.floor-main .saleZone-fl .saleInfo').hover(function(){
			$(this).find('img').stop().animate({'top':-10+'px'},700);
		},function(){
			$(this).find('img').stop().animate({'top':0},700);
		});
		$('.home-today .home-today-fr ul li').hover(function(){
			$(this).parent().find('li').stop().animate({'opacity':0.5},500);
			$(this).stop().animate({'opacity':1},500);
		},function(){
			$(this).parent().find('li').stop().animate({'opacity':1},500);
		});
		var url_banner = $("#banner_url").val();
		$.ajax({
			url:url_banner,
			type:'get',
			success:function(json){

				for(var i = 0; i < json.length; i++){
					var img_url = json[i].pic_url;
					var ad_link = json[i].ad_link;
					var _id     = json[i].id;
					var B = i + 1;
					var oLi = $('<li class="fl"><a data="'+ad_link+'" gg="'+_id+'" onclick="addAd(this)" href="javascript:;"><img src="'+img_url+'"></a></li>');
					$('.hpTopBanner .slides li').eq(0).after(oLi);
					$('.hpTopBanner .page').append('<a href="javascript:;"></a>');
				}
				$('.hpTopBanner .page a').eq(0).addClass('active');
				//轮播
				var iNow = 1;
				var bFlag = false;
				var timer5 = null;
				var Width = $('.hpTopNews .slides li').eq(0).outerWidth();
				var Length = $('.hpTopNews .slides li').length-2;
				var Length1 = $('.hpTopNews .slides li').length-1;

				$('.hpTopNews .slides li:eq(0) a').attr('href',json[0].ad_link);
				$('.hpTopNews .slides li:eq(0) a img').attr('src',json[0].pic_url);
				$('.hpTopNews .slides li:eq('+Length1+') a').attr('href',json[json.length-1].ad_link);
				$('.hpTopNews .slides li:eq('+Length1+') a img').attr('src',json[json.length-1].pic_url);

				$('.hpTopNews .slides').css({
					'width':$('.hpTopNews .slides li').length*Width,
					'left':-Width
				});
				function tab(){
					$('.hpTopBanner .page a').removeClass('active').eq((iNow-1)%Length).addClass('active');
				}
				$('.hpTopBanner .page a').on('mouseenter',function(){
					var index = $(this).index();
					iNow = index;
					tab();
					$('.hpTopBanner .slides').stop().animate({left:-iNow*Width},500,function(){
						bFlag = false;
					});
				});
				//左按钮
				$('.hpTopNews .left').on('click',function(){
					if(bFlag == true)return;
					bFlag = true;
					iNow--;
					$('.hpTopBanner .slides').animate({left:-iNow*Width},500,function(){
						if(iNow <= 0){
							iNow = $('.hpTopBanner .page a').length;
							$('.hpTopNews .slides').css({
								'left':-Width*$('.hpTopBanner .page a').length
							});
						}
						bFlag = false;
					});
					tab();
				});
				//右按钮
				function next(){
					if(bFlag == true)return;
					bFlag = true;
					iNow++;
					$('.hpTopBanner .slides').animate({left:-iNow*Width},500,function(){
						if(iNow >= $('.hpTopBanner .page a').length+1){
							iNow = 1;
							$('.hpTopNews .slides').css({
								'left':-Width
							});
						}
						bFlag = false;
					});
					tab();
				}
				$('.hpTopNews .right').on('click',next);
				//自动轮播
				timer5 = setInterval(next,5000);
				$('.hpTopBanner').on('mouseenter',function(){
					clearInterval(timer5);
					$('.hpTopNews .left').addClass('active');
					$('.hpTopNews .right').addClass('active');
				}).on('mouseleave',function(){
					timer5 = setInterval(next,5000);
					$('.hpTopNews .left').removeClass('active');
					$('.hpTopNews .right').removeClass('active');
				});
			},
			error:function(){
				console.log('接收参数失败！')
			}
		});

	})();
	
	(function () {
		
	})();
	
}

