<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"
	+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<title>登录</title>
<link rel="stylesheet" href="userCenter/login_files/base.css">
<link rel="stylesheet" href="userCenter/login_files/style.css">
<link rel="stylesheet" href="userCenter/login_files/reg.css">
<link rel="stylesheet" href="userCenter/reg_files/layer.css">
<script src="userCenter/login_files/jquery.min.js"></script>
<script src="userCenter/login_files/login.js"></script>
<script src="userCenter/login_files/layer.js"></script><link rel="stylesheet" href="userCenter/login_files/layer.css" id="layui_layer_skinlayercss">
</head>
<body>

<div class="regiup-header w clearfix">
<div class="regiup-headerLeft fl">
<a href="http://localhost:8762/service-user/index.jsp" class=" fl">
<img src="userCenter/login_files/5b35ac047dc6f.jpg" alt="">
<h2>欢迎光临淘宝贝 - 登录</h2>
</a>
<h4 class="fl">欢迎登录</h4>
</div>
<div class="fr" style="padding-top:60px;padding-right:200px;"><a href="http://demo.shopsn.net/index.php/Home/Index/index.html">网站首页</a></div>
</div>
<div class="sini-section">
<div class="sini-main w">

<div class="login-box-warp active">

<div class="signMode" id="signMode">
<div class="code"></div>
</div>

<div class="loginOptions clearfix">
<span class="fl active">账号密码登录</span>
<span class="fl" id="display_status">手机验证码登录</span>
<em></em>
</div>

<div class="signInParent">

<ul class="passwordS one hover">
<li class="clearfix userName">
<label class="fl"></label>
<input type="text" class="fl" name="name" id="name" placeholder="邮箱/用户名/已验证手机">
<i></i>
</li>
<li class="clearfix passWord">
<label class="fl"></label>
<input type="password" class="fl" name="user_pwd" id="pwd" placeholder="密码">
</li>
<li class="clearfix">
<label class="fl">
<input type="checkbox" class="checked" name="logon" value="1">
自动登录
</label>
<a href="http://localhost:8762/service-user/userCenter/forget1.jsp" class="fr">忘记密码？</a>
</li>
<li>
<input type="button" value="登  录" onclick="check_name();" class="btn">
</li>
</ul>


<input type="hidden" name="is_start" value="1">
<ul class="passwordS active" id="form_status">
<li class="clearfix userName">
<label class="fl"></label>
<input type="text" class="fl" id="tel" name="tel" placeholder="请输入手机号">
<i><a href="javascript:;" id="V-btn">获取验证码</a></i>
</li>
<li class="clearfix passWord" id="is_check">
<label class="fl"></label>
<input type="text" class="fl" name="code" id="code" placeholder="请输入短信验证码">
</li>
<li>

<input type="button" value="登  录" onclick="check_tel()" class="btn">
</li>
</ul>

<div class="juion clearfix">
<a href="http://localhost:8762/service-user/userCenter/reg.jsp" class="fr">免费注册</a>
</div>

<div class="external clearfix">
<a href="http://demo.shopsn.net/index.php/Home/Public/login/type/2.html" class="fl"><img src="userCenter/login_files/q25.jpg">QQ登录</a>
<a href="http://demo.shopsn.net/index.php/Home/Public/login/type/3.html" class="fl"><img src="userCenter/login_files/q26.jpg">微信登录</a>
<a href="http://demo.shopsn.net/index.php/Home/Public/login/type/1.html" class="fl active"><img src="userCenter/login_files/q27.jpg">微博登录</a>
</div>
</div>
</div>

<div class="login-box-warp scanCode">

<div class="signMode" id="signMode1">
<div class="code"></div>
</div>
<div class="title">手机扫码，安全登录</div>
<div class="ysCodePast">
<div class="code">
<img src="userCenter/login_files/q31.jpg">
</div>
<div class="stat"></div>
<div class="titlet">打开<b>亿速网络APP</b> 扫一扫登录</div>
</div>
<div class="signInParent">
<div class="juion clearfix">
<a href="http://localhost:8762/service-user/userCenter/reg.jsp" class="fr">免费注册</a>
</div>

<div class="external clearfix">
<a href="http://demo.shopsn.net/index.php/Home/Public/login/type/2.html" class="fl"><img src="userCenter/login_files/q25.jpg">QQ登录</a>
<a href="http://demo.shopsn.net/index.php/Home/Public/login/type/3.html" class="fl"><img src="userCenter/login_files/q26.jpg">微信登录</a>
<a href="http://demo.shopsn.net/index.php/Home/Public/login/type/1.html" class="fl active"><img src="userCenter/login_files/q27.jpg">微博登录</a>
</div>
</div>
</div>
</div>
</div>

<ul class="regi-footer">
<li>
<a href="javascript:;">关于我们</a>
<a href="javascript:;">联系我们</a>
<a href="javascript:;">加盟我们</a>
<a href="javascript:;">商城APP</a>
<a href="javascript:;" class="active">友情链接</a>
</li>
<li>
<span class="active">Powed by TaoBaBy © 版权所有 保留一切权利400-800-900</span>
</li>
</ul>

<script>
	window.onload=function()
	{
		if($('input[name=is_start]').val()==0)
		{
			$('#form_status').css('display','none');
			$('#display_status').css('display','none');
		}
	}
	//输入框提示文字输入关闭
	$('.sini-section .login-box-warp .passwordS.one input').on('focus',function(){
		$('.sini-section .login-box-warp .passwordS.one span').eq($(this).parent().index()).css('display','none');
	}).on('blur',function(){
		if($(this).val() == ''){
			$('.sini-section .login-box-warp .passwordS.one span').eq($(this).parent().index()).css('display','block');
		}else{
			$('.sini-section .login-box-warp .passwordS.one span').eq($(this).parent().index()).css('display','none');
		}
	});
	$('.sini-section .login-box-warp .passwordS.one input').eq(0).on('input',function(){
		if($(this).val().length >= 1){
			$('.sini-section .login-box-warp .passwordS.one i').css('display','block');
		}else{
			$('.sini-section .login-box-warp .passwordS.one i').css('display','none');
		}
	});
	$('.sini-section .login-box-warp .passwordS.one i').on('click',function(){
		$('.sini-section .login-box-warp .passwordS.one input').eq($(this).parent().index()).val('');
		$(this).css('display','none');
		$('.sini-section .login-box-warp .passwordS.one span').eq($(this).parent().index()).css('display','block');
	});
	$('.sini-section .login-box-warp .passwordS.one span').on('click',function(){
		$('.sini-section .login-box-warp .passwordS.one input').eq($(this).parent().index()).focus();
	});
	$('.sini-section .login-box-warp .passwordS.active span').on('click',function(){
		$('.sini-section .login-box-warp .passwordS.active input').eq($(this).parent().index()).focus();
	});
	$('.sini-section .login-box-warp .passwordS.active input').on('focus',function(){
		$('.sini-section .login-box-warp .passwordS.active span').eq($(this).parent().index()).css('display','none');
	}).on('blur',function(){
		if($(this).val() == ''){
			$('.sini-section .login-box-warp .passwordS.active span').eq($(this).parent().index()).css('display','block');
		}else{
			$('.sini-section .login-box-warp .passwordS.active span').eq($(this).parent().index()).css('display','none');
		}
	});
	//登录方式切换
	$('.sini-section .login-box-warp .loginOptions span').on('click',function(){
		$('.sini-section .login-box-warp .signInParent .passwordS').removeClass('hover').eq($(this).index()).addClass('hover');
		$('.sini-section .login-box-warp .loginOptions span').removeClass('active').eq($(this).index()).addClass('active');
		$('.sini-section .login-box-warp .loginOptions em').animate({left:$(this).index()*$('.sini-section .login-box-warp .loginOptions em').outerWidth()},300)
	});
	//扫码登录切换
	$('#signMode').on('click',function(){
		$('.login-box-warp.active').css('display','none');
		$('.login-box-warp.scanCode').css('display','block');
	});
	$('#signMode1').on('click',function(){
		$('.login-box-warp.active').css('display','block');
		$('.login-box-warp.scanCode').css('display','none');
	});


	$('.sini-section .login-box-warp .signInParent input[type=password]').on('keydown',function(ev){
	    if(ev.keyCode === 13){
	    	check_name();
	    }
	})
	$('#code').on('keydown',function(ev){
	    if(ev.keyCode === 13){
	    	check_tel();
	    }
	})
	$("#code").bind("input propertychange",function(){
//		if($(this).val()!=$('input[name=get_code]').val()) {
//			layer.tips('验证码不正确,请重试', '#is_check');
//			return false;
//		} else {
//			if($(this).val()!=''){
//				layer.tips('验证码输入正确','#is_check');
//			}
//		}

		$.ajax({
			type:"POST",
			url:"check_tel_codestatus",
			data:'code='+$(this).val()+'&print_code='+$('input[name=get_code]').val(),
			
			success:function(data){
				if(data['status']==1)
				{
					layer.tips('验证码正确','#is_check');
				}else{
					layer.tips('验证码不正确','#is_check');
				}
			}
		})
	});
</script>
<script>

var bFlag = false;

$('#V-btn').on('click',function(){
    if(bFlag == true)return;
    var tel = $('#tel').val();
    var _this = $(this);
    var N = 60;
    var timer = null;
    if (tel == "") {
        layer.tips('请输入手机号', '#tel');
        bFlag = false;
        return false;
    }
    if(!/^1[345789]\d{9}$/.test(tel)){
        layer.tips('请输入正确的手机号', '#tel');
        bFlag = false;
        return false;
    }
	$.post("/index.php/Home/Public/mobile_check", {'tel':tel}, function (a) {
		if (a == 1) {
			$.ajax({
                type: "POST",
                url: "check_code_ajax",
                data: {tel: tel},
                success: function (data) {
                    if (data.status == 1) {
                        console.log(data.status);
                        bFlag = true;
                        _this.addClass('hover');
                        timer = setInterval(function () {
                            if (N <= 0) {
                                N = 60;
                                clearInterval(timer);
                                _this.html('重新获取验证');
                                _this.removeClass('hover');
                                bFlag = false;
                            } else {
                                _this.html(N + '秒后重试');
                            }
                        }, 1000);
                    } else {
                        layer.tips('获取失败');
                        return false;
                    }
                }
            })
		}else{
			layer.tips('该手机号未注册!', '#tel');
				return false;
		}
	})

});	
</body></html>