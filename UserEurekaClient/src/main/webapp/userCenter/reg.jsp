<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"
	+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<title>注册</title>
<link rel="stylesheet" href="userCenter/reg_files/base.css">
<link rel="stylesheet" href="userCenter/reg_files/style.css">
<link rel="stylesheet" href="userCenter/reg_files/reg.css">
<link rel="stylesheet" href="userCenter/reg_files/skin/layer.css">
<link rel="stylesheet" href="userCenter/reg_files/layer.ext.css">
<script src="userCenter/reg_files/saved_resource"></script><script src="userCenter/reg_files/jquery-1.11.0.min.js"></script>
<script src="userCenter/reg_files/layer.js"></script>
</head>
<body>
<div class="regiup-header w clearfix">
<div class="regiup-headerLeft">
<a href="http://localhost:8762/service-user/index.jsp" class="fl">
<img src="userCenter/reg_files/5b35ac047dc6f.jpg" alt="">
<h2>欢迎光临淘宝贝</h2>
</a>
<h4 class="fl">欢迎注册</h4>
</div>
<div class="regiup-headerRight fr">
<span>已有账号</span>
<a href="http://localhost:8762/service-user/userCenter/login.jsp">请登录</a>
</div>
</div>
<div class="regiup-sectionPt">
<div class="regiup-section w">


<div class="regiup-form-main one w active">
<div class="container">
<div class="one clearfix">
<div class="fl">设置会员名<a class="xsg_relative">*</a></div>
<div class="fr">
<input type="text" class="txt" name="user_name" id="user_name">
<span>请再次输入你会员名</span>
</div>
</div>
<div class="one clearfix">
<div class="fl">设置登录密码<a class="xsg_relative">*</a></div>
<div class="fr">
<input type="password" class="txt" name="user_pwd" id="password">
<span>只能输入6-20个字母、数字、下划线</span>
</div>
</div>
<div class="one clearfix">
<div class="fl">密码确认<a class="xsg_relative">*</a></div>
<div class="fr">
<input type="password" class="txt" name="user_repwd" id="password1">
<span>请再次输入你的密码</span>
</div>
</div>
<div class="one clearfix">
<div class="fl">验证码<a class="xsg_relative">*</a></div>
<div class="fr">
<input type="text" class="txt" id="old_code" name="code">
<img id="checkpic" onclick="changing(this)" src="userCenter/image.jsp">
<input type="hidden" id="check_code" value="0">
<span>请输入验证码</span>
</div>
</div>
<div class="one clearfix">
<div class="fl">性别</div>
<div class="fr">&nbsp;&nbsp;&nbsp;
<input class="sex" type="radio" checked="checked" name="sex" value="男" />&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
<input class="sex" type="radio"  name="sex" value="女"/>&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span>请输入您的性别</span>
</div>
</div>
<div class="one clearfix">
<div class="fl">身份证号</div>
<div class="fr">
<input type="text" class="txt" id="idcard" name="idcard">
<span>请输入身份证号</span>
</div>
</div>
<div class="one clearfix">
<div class="fl">手机号</div>
<div class="fr">
<input type="text" class="txt" id="tel" name="user_tel">
<span>请输入手机号</span>
</div>
</div>
<div class="one clearfix">
<div class="fl code_display">验证<a class="xsg_relative">*</a></div>
<input type="hidden" name="get_code">
<input type="hidden" name="regester_type" value="2">
<div class="fr code_display">
<input type="text" class="txt1" name="rel_code" id="code">
<input type="hidden" id="check_tel_code" value="0">
<a href="javascript:;" type="button" class="btn hover" id="V-btn">获取验证码</a>
<span>请输入验证码</span>
</div>
<div>
<div class="fl" id="xsg_email_change">设置邮箱</div>
<div class="fr">
<input type="text" class="txt" name="email" id="email">
<span>设置你的邮箱</span>
</div>
</div>
<div class="one clearfix">
<div class="three">
<input type="button" value="立即注册" id="user-btn">
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
<span>TaoBaBy</span>
<span class="active">有任何问题请联系我们在线客服 电话：400-800-900</span>
</li>
<li>淘宝贝<a style="padding: 0px" href="http://localhost:8762/service-user/index.jsp">商城系统</a>&nbsp;</li>
</ul>


<script>
	$(document).ready(function(){
		//判断验证状态
		if($('input[name=regester_type]').val()==0)
		{
				$('.code_display').hide();
		}else{
			$('#tel').parent().prev().append("<a class='xsg_relative'>*</a>");
			$('#xsg_email_change').parent().addClass('xsg_one_change');

		}
	})
	$('#password').bind('blur', function(){
		var password = $('#password').val();
		if (password == '') {
			layer.tips('请填写密码!','#password');
			return false;
		};
		if (password.length<6) {
			layer.tips('密码不能小于6位!','#password');
			return false;
		};
		if (password.length>20) {
			layer.tips('密码不能大于20位!','#password');
			return false;
		};
		if (/^(?:\d+|[a-zA-Z]+|[!@#$%^&*]+)$/.test(password)) {
            layer.tips('密码强度弱,有盗号风险!','#password');
		}else if (/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\d!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/.test(password)) {
			layer.tips('密码强度强!','#password');
		}else if (/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/.test(password)) {
			layer.tips('密码强度中!','#password');
		};	
		return true;
	});
	//点击更换验证码
	function changing(src){
		src.src = "http://localhost:8762/service-user/userCenter/image.jsp?d="+Math.random();
	}

    $('#old_code').change(function(){
    	var code = $(this).val();
    	$.ajax({
    		url:"http://localhost:8762/service-user/checkCode.action",
    		method:"post",
    		data:{"code":code},
    		dataType:"JSON",
    		success:function(data) {
                if (data.code ==1) {
                    $('#check_code').val(1);
                	layer.tips('验证码输入正确', '#old_code');
                }else{
                	$('#check_code').val(0);
                	layer.tips('请输入正确的验证码！', '#old_code');
                }
        	}
    	})
    })
		
    var bFlag = false;
	$('#V-btn').click(function(){
		
        var N = 60;
        var timer = null;
        var _this = $(this);
        if(bFlag == true)return;
//		var mobile_val=$("input[name=mobile]").val();
		var tel = $('#tel').val();
		if(!/^1[34578]\d{9}$/.test(tel)){
			layer.tips('请输入正确的手机号', '#tel');
			return false;
		}else {
			$.post("http://localhost:8762/service-user/checkTel.action", {'user_tel':tel}, function (data) {
                if (data.code == 0) {
                    $.ajax({
                        type:"POST",
                        url:"http://localhost:8762/service-user/sendTelCode.action",
                        data:{'user_tel':tel},
                        success: function (data) {
                            if(data.status == 1){
                                console.log(data.status );
                                bFlag = true;
                                _this.removeClass('hover');
                                timer = setInterval(function(){
                                    N--;
                                    if(N <= 0){
                                        N = 60;
                                        clearInterval(timer);
                                        _this.html('重新获取验证');
                                        _this.addClass('hover');
                                        bFlag = false;
                                    }else{
                                        _this.html(N+'秒后重试');
                                    }
                                },1000);
                            }else {
                                layer.tips('获取失败');
                                return false;
                            }
                        }
                    })
                }else{
                    layer.tips('该手机号已注册!', '#tel');
                    return false;
                }
            })
        }
    })
	//输入触发
	$("#code").change(function(){
		$.ajax({
			type:"POST",
			url:"http://localhost:8762/service-user/check_tel_code.action",
			data:'code='+$(this).val(),
			success:function(data){
				if(data.code==1)
				{
					$('#check_tel_code').val(1);
					layer.tips('验证码输入正确','#V-btn');

				}else{
					$('#check_tel_code').val(0);
					layer.tips('验证码不正确,请重试', '#V-btn');
				}
			}
		})
	});

	//验证用户名是否存在
	$('input[name=user_name]').bind("input propertychange",function(){
		$.ajax({
			type:"POST",
			url:"http://localhost:8762/service-user/checkName.action",
			data:"user_name="+$(this).val(),
			success:function(data){
				if(data.code==0)
				{
					layer.tips('用户名格式正确','#user_name');
				}else{
					layer.tips('用户名已存在','#user_name');
				}
			}
		})
	})

	$('input[name=email]').bind("input propertychange",function(){
		var email=$(this).val();
		if(!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email)){
			layer.tips('请填写正确邮箱', 'input[name=email]');
			return false;
		}else{
			layer.tips('邮箱格式正确', 'input[name=email]');
		}
	})
	
	$('input[name=idcard]').bind("input propertychange",function(){
		var idcard=$(this).val();
		if(!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(idcard)){
			layer.tips('请填写正确身份证号', 'input[name=idcard]');
			return false;
		}else{
			layer.tips('身份证格式正确', 'input[name=idcard]');
		}
	})

	$('#password1').change(function(){
		if($('#password').val() != $(this).val())
		{
			layer.tips('两次输的密码不一致', $(this));
			return false;
		}else {
			if($(this).val()!=''){
				layer.tips('输入正确', $(this));
			}
		}
	})
	$('#user-btn').on('click',function(){
		//alert(2)
		//$('#check_code').val(1);
		var user_name = $('#user_name').val();
		var password = $('#password').val();
		var password1 = $('#password1').val();
		var mobile = $('#tel').val();
		var idcard = $('#idcard').val();
		var code = $('#old_code').val();
		var check_code = $('#check_code').val();
		var mobile_code = $('#check_tel_code').val();
		var email = $('#email').val();
		var sex = $(".sex:checked").val();
		if(user_name == ''){
			layer.msg('请填写会员名');
			return false;
		}
		if(password==''){
			layer.msg('请填设置密码');
			return false;
		}
		if(password1==''){
			layer.msg('请确认密码');
			return false;
		}
		if(password!=password1){
			layer.msg('两次密码不一致');
			return false;
		}
		if(code==''){
			layer.msg('请填写验证码');
			return false;
		}
		if(check_code==0){
			layer.msg('验证码不正确');
			return false;
		}
		if(mobile==''){
			layer.msg('请填写手机号');
			return false;
		}
		if(!/^1[345789]\d{9}$/.test(mobile)){
			layer.msg('请输入正确的手机号');
			return false;
		}
		if(mobile_code==''){
			layer.msg('请填写手机验证码');
			return false;
		}
		if(mobile_code==0){
			layer.msg('手机验证码不正确');
			return false;
		} if(idcard==0){
			layer.msg('请输入正确的身份证号');
			return false;
		}
		$.post('http://localhost:8762/service-user/userReg.action',{'user_name':user_name,'user_pwd':password,'user_tel':mobile,'user_email':email,'user_idcard':idcard,'user_sex':sex},function(data){
			if(data==1){
				layer.msg('手机号已存在');

			}else if(data==2){
				layer.msg('邮箱已存在');

			}else if(data==3){
				layer.msg('注册失败');

			}else{
				alert('注册成功');
				window.location.href="http://localhost:8762/service-user/userCenter/login.jsp";

			}

		})

	})
</script>
</div></body></html>