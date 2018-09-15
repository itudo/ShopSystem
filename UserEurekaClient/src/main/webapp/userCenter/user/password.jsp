<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<script type="text/javascript">
$(function() {
	$("#userset").attr("class","active");
});
</script>

<div class="mordrMain fr modpaw-content-wrap">
<div class="title clearfix">
<ul class="clearfix fl nav">
<li class="fl active hover"><a href="javascript:;">修改密码</a></li>
</ul>
</div>
<form action="http://demo.shopsn.net/index.php/Home/UserSet/password_edit.html" method="post" onsubmit="return check_pwd();">
<ul class="content-main">
<li class="clearfix">
<span class="fl">当前登录密码：</span>
<input type="password" name="reg_pwd" id="reg_pwd" class="txt fl" placeholder="请输入当前登录密码">
</li>
<li class="clearfix">
<span class="fl">新的登录密码：</span>
<input type="password" name="new_pwd" id="new_pwd" class="txt fl" placeholder="只能输入6-20个字母、数字、下划线">
</li>
<li class="clearfix">
<span class="fl">确认新的登录密码：</span>
<input type="password" id="new_pwd1" class="txt fl" placeholder="请再次输入新密码">
</li>
<li class="clearfix">
<span class="fl"></span>
<input id="btn" type="button" class="btn fl" value="确认修改"/>
</li>
</ul>
</form>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>

<script src="./password_files/address.js"></script>
<script>
	$("#btn").click(function() {
		var regpwd = $("#reg_pwd").val();
		var newpwd = $("#new_pwd").val();
		var newpwd1 = $("#new_pwd1").val();
		if(newpwd!=newpwd1) {
			layer.tips('两次密码输入不一致!','#new_pwd1');
			return false;
		} else {
			$.getJSON("http://localhost:8762/service-user/changePwd.action",{regpwd:regpwd,newpwd:newpwd},function(data){
				if(data.code==1) {
					alert("密码修改成功！")
					window.location.href="http://localhost:8762/service-user/userCenter/user/userInfo.jsp";
				} else {
					alert("原密码错误，请重试")
				}
			})
		}
	});
	$('#new_pwd').bind('blur', function(){
		var password = $('#new_pwd').val();
		if (password == '') {
			layer.tips('请填写密码!','#new_pwd');
			return false;
		};
		if (password.length<6) {
			layer.tips('密码不能小于6位!','#new_pwd');
			return false;
		};
		if (password.length>20) {
			layer.tips('密码不能大于20位!','#new_pwd');
			return false;
		};
		if (/^(?:\d+|[a-zA-Z]+|[!@#$%^&*]+)$/.test(password)) {
            layer.tips('密码强度弱,有盗号风险!','#new_pwd');
		}else if (/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\d!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/.test(password)) {
			layer.tips('密码强度强!','#new_pwd');
		}else if (/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/.test(password)) {
			layer.tips('密码强度中!','#new_pwd');
		};		
		return true;
	}); 
</script>
<%@ include file="../bottom.jsp"%>