<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<script type="text/javascript">
$(function() {
	$("#balance").attr("class","active");
});
</script>

<div class="mordrMain fr">
<div class="title clearfix">
<ul class="clearfix fl">
<li class="fl hover active"><a href="javascript:;">所有订单</a></li>
</ul>
</div>

<div class="rangeSearch"></div>

<ol class="clearfix tradingStatus">
<li class="fl one">宝贝</li>
<li class="fl two">单价</li>
<li class="fl three">数量</li>
<li class="fl four">商品操作</li>
<li class="fl four">实付款</li>
<li class="fl five">交易状态</li>
<li class="fl four">交易操作</li>
</ol>


<div class="myderPagePt clearfix">
<button class="fr btn">下一页</button>
<button class="fr active">上一页</button>
</div>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>


<%@ include file="../bottom.jsp"%>