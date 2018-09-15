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
<a href="http://localhost:8762/service-user/index.jsp" class=" fl">
<img src="userCenter/forget2_files/5b35ac047dc6f.jpg" alt="">
</a>
<h4 class="fl">验证身份</h4>
</div>
</div>
<div class="regiup-sectionPt">
<div class="regiup-section w">

<ul class="regiup-dataColumn clearfix">
<li class="fl clearfix">
<em class="fl">1</em>
<span class="fl">确认密码</span>
<i></i>
</li>
<li class="fl clearfix active">
<em class="fl active">2</em>
<span class="fl">验证身份</span>
<i></i>
</li>
<li class="fl clearfix">
<em class="fl">3</em>
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
<div class="container">
<div class="one clearfix">
<div class="fl">你的用户名：</div>
<div class="fr" id="user_name">
 </div>
</div>
<div class="one clearfix">
<div class="fl">你的邮箱：</div>
<div class="fr" id="user_email">
 </div>
</div>
<div class="one clearfix">
<div class="fl code_display">邮箱验证码<a class="xsg_relative">*</a></div>
<input type="hidden" name="get_code">
<input type="hidden" name="regester_type" value="">
<div class="fr code_display">
<input type="text" class="txt1" name="rel_code" id="code">
<input type="hidden" id="check_tel_code" value="0">
<a href="javascript:;" type="button" class="btn hover" id="V-btn">获取验证码</a>
<span>请输入验证码</span>
</div>
</div>
<div class="three">
<input type="hidden" id="tel" value="13052079525">
<form action="" method="post" class="form">
<input type="hidden" name="id" id="id" value="3">
</form>
<input type="button" value="下一步" id="user-btn">
</div>
</div>
</div>
</div>
</div>
<script>
$(function() {
	var paraString = location.href.substring(location.href.indexOf("?") + 1, location.href.length);
	var param = paraString.split("&");
	var user_name = param[0].split("=")[1];
	var user_email = (param[1].split("=")[1]).split("@")[0];
	$("#user_name").append(user_name);
	$("#user_email").append(user_email+"@qq.com");


	var bFlag = false;
	$('#V-btn').on('click',function(){
		
        if(bFlag == true)return;
        var N = 60;
        var timer = null;
        var _this = $(this);
		if(bFlag == true)return;
		bFlag = true;
		$.getJSON("http://localhost:8762/service-user/sendEmail.action",{'email':user_email},function (data) {
                if(data.code == 1){
                	alert("发送成功")
                    console.log(data.code );
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
        })
	});
    //输入触发
    $("#code").change(function(){
        $.ajax({
            type:"POST",
            url:"http://localhost:8762/service-user/check_email_code.action",
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

	$('#user-btn').on('click',function(){
		if($('#check_tel_code').val()==1) {
			window.location.href = "http://localhost:8762/service-user/userCenter/forget3.jsp";
		}
	});
});
</script>
<%@ include file="bottom.jsp"%>