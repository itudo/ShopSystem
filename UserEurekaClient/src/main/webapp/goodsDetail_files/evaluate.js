$(function(){
    //放大镜
    var count = $("#imageMenu li").length - 5;
    var interval = $("#imageMenu li:first").width();
    var curIndex = 0;

    $('.scrollbutton').click(function() {
        if ($(this).hasClass('disabled')) return false;

        if ($(this).hasClass('smallImgUp')) --curIndex;
        else ++curIndex;

        $('.scrollbutton').removeClass('disabled');
        if (curIndex == 0) $('.smallImgUp').addClass('disabled');
        if (curIndex == count - 1) $('.smallImgDown').addClass('disabled');

        $("#imageMenu ul").stop(false, true).animate({
            "marginLeft": -curIndex * interval + "px"
        }, 600);
    });
    $.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    }
    $.fn.decorateIframe.defaults = {
            iframeId: "decorateIframe1",
            iframeZIndex: -1,
            width: 0,
            height: 0
        }
    $("#bigView").decorateIframe();
    var midChangeHandler = null;

    $("#imageMenu li img").bind("mouseover", function() {
            if ($(this).attr("id") != "onlickImg") {
                midChange($(this).attr("src").replace("small", "mid"));
                $("#imageMenu li").removeAttr("id");
                $(this).parent().attr("id", "onlickImg");
            }
        })
        .bind("mouseover", function() {
            if ($(this).attr("id") != "onlickImg") {
                window.clearTimeout(midChangeHandler);
                midChange($(this).attr("src").replace("small", "mid"));
                $(this).css({
                    "border": "3px solid #FF0000"
                });
            }
        })
        .bind("mouseout", function() {
            if ($(this).attr("id") != "onlickImg") {
                $(this).removeAttr("style");
                midChangeHandler = window.setTimeout(function() {
                    midChange($("#onlickImg img").attr("src").replace("small", "mid"));
                }, 1000);
            }
        });

    function midChange(src) {
        $("#midimg").attr("src", src).load(function() {
            changeViewImg();
        });
    }
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }
        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }

    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }
    $("#midimg").mouseover(mouseover);
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut);

    var $divWidth = $("#winSelector").width();
    var $divHeight = $("#winSelector").height();
    var $imgWidth = $("#midimg").width(); 
    var $imgHeight = $("#midimg").height();
    var $viewImgWidth = $viewImgHeight = $height = null;

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }
    changeViewImg();
    $("#bigView").scrollLeft(0).scrollTop(0);

    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left;
        var $imgTop = $("#midimg").offset().top;
        X = e.pageX - $imgLeft - $divWidth / 2;
        Y = e.pageY - $imgTop - $divHeight / 2;
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }
        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({
            "left": scrollX * -1,
            "top": scrollY * -1
        });

        return {
            left: X,
            top: Y
        };
    }
    //下拉选择
    $('.pr-goodplace').on('mouseenter',function(){
        $('.pr-goodplace .pr-goodplace-up').addClass('active');
    }).on('mouseleave',function(){
        $('.pr-goodplace .pr-goodplace-up').removeClass('active');
    });
    $('.pr-goodplace .pr-goodplace-up span').on('mouseenter',function(){
        $(this).addClass('active');
    }).on('mouseleave',function(){
        $('.pr-goodplace .pr-goodplace-up span').removeClass('active');
    }).on('click',function(){
    	var vector = $('.pr-goodplace .pr-goodplace-default span');
    	
    	//给隐藏域赋值
    	var value = $(this).attr('value');
    	$('.pr-button').find('input[name="ware_id"]').attr('value', value);
    	vector.attr('value', value);
    	return vector.html($(this).html());
    });
    //购买数量输入以加减
    ;(function(){
        var iNow = $('.promotion-fr .choice input').val();
        $('.promotion-fr .choice a').on('click',function(){
            if($(this).html() == '-'){
                iNow --;
                if(iNow <= 1){
                    iNow = 1;
                }
            }else{
                iNow ++;
            }
            $('.promotion-fr .choice input').val(iNow);
            //给隐藏域赋值
            $('.pr-button').find('input[name="goods_num"]').attr('value', parseInt(iNow));
        });
    })();
    //商品介绍 评价 切换
    $('.productDetafr .prod-title li').on('click',function(){
        $('.productDetafr .prod-title li').removeClass('active').eq($(this).index()).addClass('active');
        $('.productDetafr .pro-comment').removeClass('active').eq($(this).index()).addClass('active');
    });
    $('.productDetafr .prod-title li').eq(1).on('click',function(){
        for(var i = 0;i < $('.praiseBar-parent em').length; i++){
            $('.praiseBar-parent i').eq(i).animate({width:$('.praiseBar-parent em').eq(i).html()+'px'},1000);
        }
    });

    //畅销排行划入效果
    $('.proTop10 dd').on('mouseenter',function(){
        $(this).addClass('active');
    }).on('mouseleave',function(){
        $('.proTop10 dd').removeClass('active');
    });
    
    //配件套餐组合选择
    $('.pr-commodity').on('click', '.pr-com-title li', function(event){
        $('.pr-commodity .pr-com-title li').removeClass('active');
        $(this).addClass('active');
        $('.pr-commodity .pr-content').removeClass('active').eq($(this).index()).addClass('active');
    });
});