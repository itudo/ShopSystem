<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"
	+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<title>确认密码</title>
<link rel="stylesheet" href="userCenter/forget1_files/base.css">
<link rel="stylesheet" href="userCenter/forget1_files/style.css">
<script src="userCenter/forget1_files/jquery.min.js"></script>
<script src="userCenter/forget1_files/layer.js"></script><link rel="stylesheet" href="userCenter/forget1_files/layer.css" id="layui_layer_skinlayercss">
<script>
        $(function(){
            $('#code').keyup(function(){
                var code = $('#code').val();
                if(code.length == 4 && $('#check_code').val() == 0){
                    $.get("/index.php/Home/Public/check_code.html", {code:code},function(data){
                        if(data == 1){
                            $('#check_code').val(1);
                            layer.tips('√ 通过验证', '#code',{
                                tips: [1, '#f79f54'],
                                time: 5000
                            });
                        }else{
                            $('#check_code').val(0);
                            layer.tips('× 验证错误', '#code',{
                                tips: [1, '#f79f54'],
                                time: 5000
                            });
                        }
                    });
                }
            });
        })
    </script>
</head>
<body>

<div class="regiup-header w clearfix">
<div class="regiup-headerLeft">
<a href="http://localhost:8762/service-user/index.jsp" class=" fl">
<img src="userCenter/forget1_files/5b35ac047dc6f.jpg" alt="">
</a>
<h4 class="fl">找回密码</h4>
</div>
</div>
<div class="regiup-sectionPt">
<div class="regiup-section w">

<ul class="regiup-dataColumn clearfix">
<li class="fl clearfix active">
<em class="fl active">1</em>
<span class="fl">确认身份</span>
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
<li class="fl clearfix">
<em class="fl">4</em>
<span class="fl">完成</span>
<i></i>
</li>
</ul>

<div class="regiup-form-main one w active">
<div class="container">
<div class="one clearfix">
<div class="fl">登录名：</div>
<form action="forget1.action" method="post" class="form">
<div class="fr">
<input type="hidden" id="check_name" value="1">
<input type="text" name="name" id="name" onblur="Search()" class="txt">
<span>请输入你的登录名,你的登录名可能是你的手机号,邮箱或用户名</span>
</div>
</form>
</div>
<div class="one clearfix">
<div class="fl">验证码：</div>
<div class="fr">
<input type="text" class="txt" id="old_code" name="code">
<img id="checkpic" onclick="changing(this)" src="userCenter/image.jsp">
<input type="hidden" id="code" value="0">
<span>请输入验证码</span>
</div>
</div>
<div class="three">
<input type="hidden" id="check_code" value="1">
<input type="button" value="下一步" id="user-btn">
</div>
</div>
</div>
</div>
</div>
<script src="./forget1_files/password.js"></script>
<script>
    function Search() {
        var name = $('#name').val();
        $.post("http://localhost:8762/service-user/check.action", {name:name},function(data){
            if(data.code == 1){
                $('#check_name').val(1);
                layer.tips('有效账号!', '#name',{
                    tips: [1, '#f79f54'],
                    time: 5000
                });
                return true;
            }else{
                $('#check_name').val(0);
                layer.tips('没有该账号,请核对后从新输入!', '#name',{
                    tips: [1, '#f79f54'],
                    time: 5000
                });
                return false;
            }
        });
    }
    $('#user-btn').on('click',function(){
        var code = $('#check_code').val();
        var name = $('#check_name').val();
        if (code == '1') {
            if (name == '1') {
            	var name1 = $("#name").val();
                $.getJSON("http://localhost:8762/service-user/forget1.action",{name:name1},function(data) {
                	if(data.code==1) {
                		window.location.href="http://localhost:8762/service-user/userCenter/forget2.jsp?user_name="+data.obj.user_name+"&user_email="+data.obj.user_email;
                	} else {
                		layer.tips('没有该账号,请核对后从新输入!', '#name',{
                            tips: [1, '#f79f54'],
                            time: 5000
                        });
                	}
                })
            };
        };
    });

    $('#old_code').bind("input propertychange",function(){
        var code = $(this).val();
        if(code.length==4) {
        	$.getJSON('http://localhost:8762/service-user/checkCode.action',{"code":code},function(data){
                if (data.code ==1) {
                    $('#check_code').val(1);
                    layer.tips('验证码输入正确', '#old_code');
                }else{
                    $('#check_code').val(0);
                    layer.tips('请输入正确的验证码！', '#old_code');
                }
            })	
        } else {
        	 $('#check_code').val(0);
        }
    })
    //点击更换验证码
	function changing(src){
		src.src = "http://localhost:8762/service-user/userCenter/image.jsp?d="+Math.random();
	}
</script>
<%@ include file="bottom.jsp"%>