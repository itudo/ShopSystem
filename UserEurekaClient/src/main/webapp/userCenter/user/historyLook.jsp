<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<script>
        $('.dels').click(function(){
            var _url="/index.php/Home/Goods/dels.html";
            var _id=$(this).attr('data');
            $.post(_url,{id:_id},function(data){
                if(data.status==0){
                    layer.msg(data.message);
                }
            })
            var _count=parseInt($('#couts').html());
            $(this).parent().parent().remove('dd');
            $('#couts').html(_count-1);
        })
    </script>


<script>
        function addAd(ele){
            var _id=$(ele).attr('g');
            var _reurl=$(ele).attr('data');
            var _locatUrl="/index.php/Home/Ad/addhit.html";
            $.post(_locatUrl, {id:_id},function(data){
                console.log(data.msg);
            },'JSON')
            window.location.href=_reurl;
        }
    </script>
<script>
		$("#formsarch").submit(function(){
			$("#ser-id").remove();
		});

	</script>

<div class="myTck-content-wrap w">
<div class="nav-wrap clearfix">
 <ul class="nav clearfix fl">
<li class="fl btn1">
<span>全部类目</span>
<div class="dorpmenu">
<ul>
<a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/1.html"><li class="option">家用电器</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/3.html"><li class="option">家居厨具</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/4.html"><li class="option">美妆个护</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/9.html"><li class="option">手机数码</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/14.html"><li class="option">女鞋箱包</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/15.html"><li class="option">食品酒类</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/29.html"><li class="option">电脑办公</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/31.html"><li class="option">汽车用品</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/33.html"><li class="option">图书音像</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/34.html"><li class="option">母婴玩具</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/37.html"><li class="option">礼品鲜花</li></a><a href="http://demo.shopsn.net/index.php/Home/Assets/myTracks_class/class_id/697.html"><li class="option">女装男装</li></a> </ul>
</div>
</li>
</ul>
<a href="javascript:;" class="fr btn">批量删除</a>
</div>
<ul class="con-main clearfix">
</ul>
<div class="page"><div>共&nbsp;<b>7</b>&nbsp;条&nbsp;&nbsp;&nbsp;<b>1</b>/<b>1</b> 页&nbsp;&nbsp; </div></div>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>

<script src="./historyLook_files/assets.js"></script>

<script>
	$('.myTck-content-wrap .con-main li:nth-child(5n)').addClass('active');
	//下拉菜单
	var oSpan = $('.myTck-content-wrap .nav-wrap .nav .btn1 span');
	$('.myTck-content-wrap .nav-wrap .nav .btn1').on('mouseenter',function(){
		$(this).addClass('active');
	}).on('mouseleave',function(){
		$(this).removeClass('active');
	});
	$('.myTck-content-wrap .nav-wrap .nav li .dorpmenu li').on('mouseenter',function(){
		$(this).addClass('hover');
	}).on('mouseleave',function(){
		$(this).removeClass('hover');
	}).on('click',function(){
		oSpan.html($(this).html());
	});
	//内容划入
	$('.myTck-content-wrap .con-main li').on('mouseenter',function(){
		$(this).addClass('hover');
	}).on('mouseleave',function(){
		$(this).removeClass('hover');
	});
</script>
<%@ include file="../bottom.jsp"%>