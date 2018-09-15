<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<script type="text/javascript">
$(function() {
	$("#userset").attr("class","active");
	$.getJSON("http://localhost:8762/service-user/getSecurity.action",function(data) {
		if(data.code==1) {
			$("#tel").html("手机号码："+data.obj.user_tel);
			$("#loginTime").html("上次登录："+data.obj.user_date+"（<span>不是您登录的？请立即</span><a href='http://localhost:8762/service-user/userCenter/user/password.jsp'>更改密码</a>）")
		}
	})
});
</script>
		<!--内容-->
		<div class="mordrMain fr securityS-content-wrap">
			<div class="title clearfix">
				<ul class="clearfix fl nav">
					<li class="fl active hover"><a href="javascript:;">安全设置</a></li>
				</ul>
			</div>
			<div class="content-wrap">
				<div class="content-info">
					<h2>您的基础信息</h2>
					<ul>
						<li id="tel">手机号码：13052079525</li>
						<li id="loginTime">上次登录：2018年08月20日 11:10:12 </li>
					</ul>
				</div>
				<div class="content-safe">
					<h2>您的安全服务</h2>
					<dl>
					    <dt class="clearfix">
							<span class="fl">安全等级：</span>
							<div class="state fl">
								<div class="state-low"></div>
								<div class="state-in active"></div>
								<div class="state-high"></div>
							</div>
							<span class="fl">弱</span>
							<em class="fl">您的帐号目前还存在一定的安全隐患</em>
						</dt>
												<dd class="clearfix password">
							<div class="clearfix fl left-main">
								<em class="fl">密码修改</em>
								<span class="fl">
									密码请设置大于六位，同时数字、字母、符号等组合方式提高安全级别
								</span>
							</div>
							<div class="fr right-main">
								<a href="password.jsp">修改</a>
							</div>
						</dd>
						<dd class="clearfix password">
							<div class="clearfix fl left-main">
								<em class="fl">手机绑定</em>
								<span class="fl">
									绑定手机号码，可以直接使用手机号登录，方便快捷。
								</span>
							</div>
							<div class="fr right-main">
								<a href="">修改</a>
							</div>
						</dd>
					</dl>
				</div>
			</div>
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

<!-- <script src="js/header.js"></script>
 -->
 

<%@ include file="../bottom.jsp"%>