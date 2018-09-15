<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"
	+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<title>完成找回</title>
<link rel="stylesheet" href="userCenter/forget2_files/base.css">
<link rel="stylesheet" href="userCenter/forget2_files/style.css">
<script src="userCenter/forget2_files/jquery.min.js"></script>
<script src="userCenter/forget2_files/layer.js"></script><link rel="stylesheet" href="userCenter/forget2_files/layer.css" id="layui_layer_skinlayercss">
</head>
<body>
	<!--头部-->
	<div class="regiup-header w clearfix">
        <div class="regiup-headerLeft">
            <a href="http://localhost:8762/service-user/index.jsp" class=" fl">
                <img src="userCenter/forget2_files/5b35ac047dc6f.jpg" alt=""/>
            </a>
            <h4 class="fl">找回密码</h4>
        </div>
		<div class="regiup-headerRight fr">
			<a href="http://localhost:8762/service-user/userCenter/login.jsp">返回登录页面</a>
		</div>
	</div>
	<div class="regiup-sectionPt">
		<div class="regiup-section w">
			<!--栏目状态-->
			<ul class="regiup-dataColumn clearfix">
				<li class="fl clearfix">
					<em class="fl">1</em>
					<span class="fl">确认密码</span>
					<i></i>
				</li>
				<li class="fl clearfix">
					<em class="fl">2</em>
					<span class="fl">验证身份</span>
					<i></i>
				</li>
				<li class="fl clearfix">
					<em class="fl">3</em>
					<span class="fl">设置密码</span>
					<i></i>
				</li>
				<li class="fl clearfix active">
					<em class="fl active">4</em>
					<span class="fl">完成</span>
					<i></i>
				</li>
			</ul>
			<!--设置用户名-->
			<div class="chenggong">
				<div class="chenggong_auto">
					<img src="userCenter/forget2_files/lvsegou.png" alt="" class="chenggong_auto_left">
					<div class="chenggong_auto_right">
						<div class="chenggong_auto_right_bt">您的新登录密码已设置成功.</div>
						<div class="chenggong_auto_right_nr">请记住您的新密码!</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<style>
	 .chenggong{
	 	width: 100%;
	 	height: 350px;
	 	overflow: hidden;
	 }
	 .chenggong_auto{
	 	width: 290px;
	 	overflow: hidden;
	 	margin: auto;
	 	margin-top: 140px;
	 }
	 .chenggong_auto_left{
	 	display: block;
	 	width: 67px;
	 	height: 67px;
	 	float: left;
	 	border-radius: 50%;
	 }
	 .chenggong_auto_right{
	 	width: 215px;
		overflow: hidden;
		float: right;
		font-size: 16px;
		margin-left: 5px;
		color:#0b73bb;
		font-weight: 600;
	 }
	 .chenggong_auto_right_bt{
	 	margin-top: 8px;
	 }
	 .chenggong_auto_right_nr{
	 	width: 100%;
	 	margin-top: 5px;
	 	font-size: 14px;
	 }
	</style>

<%@ include file="bottom.jsp"%>