<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"
	+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<title>忘记密码</title>
<link rel="stylesheet" href="userCenter/forget2_files/base.css">
<link rel="stylesheet" href="userCenter/forget2_files/style.css">
<script src="userCenter/forget2_files/jquery.min.js"></script>
<script src="userCenter/forget2_files/layer.js"></script><link rel="stylesheet" href="userCenter/forget2_files/layer.css" id="layui_layer_skinlayercss">
</head>
<body>

<div class="regiup-header w clearfix">
        <div class="regiup-headerLeft">
            <a href="index.jsp" class=" fl">
                <img src="userCenter/forget2_files/5b35ac047dc6f.jpg" alt=""/>
            </a>
            <h4 class="fl">找回密码</h4>
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
				<li class="fl clearfix active">
					<em class="fl active">3</em>
					<span class="fl">设置密码</span>
					<i></i>
				</li>
				<li class="fl clearfix">
					<em class="fl">4</em>
					<span class="fl">完成</span>
					<i></i>
				</li>
			</ul>

<div class="regiup-form-main one w active">
				<form action="" method="post">
					<div class="container">
						<div class="one clearfix">
							<div class="fl">新登录密码：</div>
							<div class="fr">
								<input type="password" name="password" id="password" placeholder="只能输入6-20个字母、数字、下划线" class="txt">
							</div>
						</div>
						<div class="one clearfix">
							<div class="fl">确认新登录密码：</div>
							<div class="fr">
								<input type="password" id="password1" class="txt">
							</div>
						</div>
						<div class="three">
						    <input type="hidden" name="id" id="id" value="{$id}">
							<input type="button" value="下一步" id="user-btn">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	 $('#user-btn').on('click',function(){
		 if(check()!=false) {
			 var password = $('#password').val();
			 $.getJSON("updatepwd.action",{'user_pwd':password},function(data) {
				 if(data.code==1) {
					 window.location.href="forget4.jsp";
				 } else {
					 alert("修改失败！")
				 }
			 })
		 } else {
			 alert("请严格填写信息！")
		 }
	 })
        function check(){
        	var password = $('#password').val();
        	var password1 = $('#password1').val();
        	if (password == '') {
        		layer.tips('请输入新密码!', '#password');
        		return false;
        	};
        	if(!/^(\w){6,20}$/.test(password)){
		        layer.tips('密码格式不对!', '#password');
		        return false;
		    };  
        	if (password1 == '') {
        		layer.tips('请再次输入新密码!', '#password1');
        		return false;
        	};
        	if (password1 != password) {
        		layer.tips('两次密码不一致!', '#password1');
        		return false;
        	};
        }
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
	</script>
<%@ include file="bottom.jsp"%>