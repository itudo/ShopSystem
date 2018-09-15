<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<script type="text/javascript">
$(function() {
	$("#userInfo").attr("class","active");
});
</script>
<link rel="stylesheet" href="./userHead_files/base.css">
<link rel="stylesheet" href="./userHead_files/style.css">
<link rel="stylesheet" href="./userHead_files/payment.css">
<link rel="stylesheet" href="./userHead_files/page.css">
<script src="./userHead_files/jquery.min.js"></script>
<div class="mordrMain fr editad-content-wrap">
<div class="title clearfix">
<ul class="clearfix fl nav">
<li class="fl active hover"><a href="javascript:;">编辑头像</a></li>
</ul>
</div>
<div class="con-wrap clearfix">
<form id="tf">
<div class="file-main clearfix">
<div class="file-amin"><input type="file" name="file" id="file_upload">选择您要上传的头像</div>
<div class="prompt">仅支持JGP、GFI、PNG图片文件，且文件小于5M</div>
</div>
</form>
<div class="content-main">
<div class="left-main fl">
<div class="images-parent">
<div class="img-b image_container">
<img src="./userHead_files/w39.jpg" height="150" width="150" class="preview">
</div>
</div>
<input type="submit" value="保存" class="btn" id="submit">
</div>

<div class="right-main fr">
<p class="data-title">你上传的头像会自动生成2种尺寸，请注意中小尺寸是否清晰</p>
<div class="smc">
<div class="img-m-cont">
<div class="img-s image_container">
<img src="./userHead_files/w39.jpg" height="100" width="100" class="preview">
</div>
100*100像素
<div class="img-m image_container">
<img src="./userHead_files/w39.jpg" height="50" width="50" class="preview">
</div>
50*50像素
</div>
</div>
</div>
</div>

</div>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<div class="userTips">
<%@ include file="../tip.jsp"%>
</div>
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>


<script>
$("#submit").click(function(){
    var form = new FormData(document.getElementById("tf"));
    $.ajax({
        url:"http://localhost:8762/service-user/uploadHead.action",
        type:"post",
        data:form,
        processData:false,
        contentType:false,
        success:function(data){
        	if(data.code==1) {
        		alert("恭喜您，头像上传完场！")
        		window.location.href = "http://localhost:8762/service-user/userCenter/user/userInfo.jsp";
        	} else{
        		alert("抱歉，头像上传失败！")
        	}
        },
    });        
})
	//图案选择
	$("#file_upload").change(function() {
		var _file = $(this);
		var fileObj = _file[0];
		var windowURL = window.URL || window.webkitURL;
		var dataURL;
		var _img = $(".editad-content-wrap .con-wrap .preview");
		 
		if(fileObj && fileObj.files && fileObj.files[0]){
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
			_img.attr('src',dataURL);
		}else{
			dataURL = _file.val();
			var imgObj = $(".editad-content-wrap .con-wrap .preview");
			imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
		}
	});
</script>
<%@ include file="../bottom.jsp"%>