<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<script type="text/javascript">
$(function() {
	$("#userInfo").attr("class","active");
	$.getJSON("http://localhost:8762/service-user/loginUser.action",function(data){
		if(data.code==1) {
			var obj = data.obj;
			if(obj.user_head==null) {
				$("#header").html("暂时没有头像!");
			} else {
				$("#header").html("<img src='http://localhost:8762/service-user/imgHead/"+obj.user_head+"' height='83' widht='83'>");
			}
			$("#user_name").val(obj.user_name);
			$("#user_idcard").val(obj.user_idcard);
			$("#user_tel").val(obj.user_tel);
			$("#user_email").val(obj.user_email);
			if(obj.user_sex=="男") {
				$("#man").attr("checked","checked");
			} else {
				$("#woman").attr("checked","checked");
			}
			
		}
	})
});
</script>
		<!--内容-->
		<div class="mordrMain fr personaM-content-wrap">
			<div class="title clearfix">
				<ul class="clearfix fl nav">
					<li class="fl active hover"><a href="javascript:;">个人质料</a></li>
				</ul>
			</div>
			<form action="http://localhost/index.php/Home/UserData/user_data.html" method="post" onsubmit="return user_data()">
				<dl class="content-main">
					<dt>亲爱的 ，填写真实的资料，有助于好友找到你哦。</dt>
					<dd class="clearfix">
						<span class="fl">当前头像：</span>
						<div class="fl img-parent">
						<a id="header" href="userHead.jsp">
						
						</a>							
						</div>点击头像更换！	
					</dd>
					<dd class="clearfix">
						<span class="fl">用户名：</span>
						<input type="text" value="" class="txt fl" name="user_name" id="user_name">
					</dd>
					<dd class="clearfix">
						<span class="fl">身份证号：</span>
						<input type="text" value="hxh" class="txt fl" name="user_idcard" id="user_idcard">
					</dd>
					<dd class="clearfix">
						<span class="fl">手机号码：</span>
						<input type="text" value="13052079525" class="txt fl" name="user_tel" id="user_tel">
					</dd>
					<dd class="clearfix">
						<span class="fl">邮箱：</span>
						<input type="text" value="2272597637@qq.com" class="txt fl" name="user_email" id="user_email">
					</dd>
					<dd class="clearfix">
						<span class="fl">性别：</span>
						<input class="sex" id="man" type="radio"   name="sex" value="男">男
						<input class="sex" id="woman" type="radio"  name="sex" value="女">女
					</dd>
					<dd class="clearfix">
						<span class="fl"></span>
						<input type="hidden" name="id" value="3">
						<input id="button" type="button" value="保存" class="sub">
					</dd>
				</dl>
			</form>
		</div>
		<!--右侧一键到顶 and 客服-->
		<ul class="home-tab">
	<li>
		<em></em>
		<span>0</span>
		<div class="userTips">
<%@ include file="../tip.jsp" %>			
</div>
	</div>
	<!--尾部-->
<script src="./userInfo_files/user_data.js"></script>
<script type="text/javascript">
	$("#button").click(function() {
		var user_name = $('#user_name').val();
		var user_tel = $('#user_tel').val();
		var user_idcard = $('#user_idcard').val();
		var user_email = $('#user_email').val();
		var user_sex = $(".sex:checked").val();
		$.getJSON("http://localhost:8762/service-user/updateUser.action",{user_name:user_name,user_tel:user_tel,user_idcard:user_idcard,user_email:user_email,user_sex:user_sex},function(data) {
			if(data.code==1) {
				alert("修改信息成功！")
				location.href.reload;
			}
		})
	})
</script>


<%@ include file="../bottom.jsp"%>