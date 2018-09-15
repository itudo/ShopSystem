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
		<!--内容-->
		<div class="mordrMain fr userSer-content-wrap">
			<div class="title clearfix">
				<ul class="clearfix fl nav">
					<li class="fl active hover"><a href="javascript:;">收货地址</a></li>
				</ul>
			</div>
			<ul class="content-form-main">
				<li class="con-title">
					<span>新增收货地址</span>
					电话号码、手机号选填一项,其余均为必填项
				</li>
				<form action="" method="post">
					<li class="form-main clearfix">
					    <span class="fl">所在地区<em>*</em></span>
					    <select name="prov" id="prov" style="width:100px; height:30px;">
			                <option value="0">请选择省份</option>
			                <option value="1">北京市</option><option value="3">河北省</option><option value="4">山西省</option><option value="5">内蒙古</option><option value="6">辽宁省</option><option value="7">吉林省</option><option value="8">黑龙江省</option><option value="9">上海市</option><option value="10">江苏省</option><option value="11">浙江省</option><option value="12">安徽省</option><option value="13">福建省</option><option value="14">江西省</option><option value="15">山东省</option><option value="16">河南省</option><option value="17">湖北省</option><option value="18">湖南省</option><option value="19">广东省</option><option value="91139">广西壮族自治区</option><option value="21">海南省</option><option value="22">重庆市</option><option value="23">四川省</option><option value="24">贵州省</option><option value="25">云南省</option><option value="26">西藏</option><option value="27">陕西省</option><option value="28">甘肃省</option><option value="29">青海省</option><option value="30">宁夏</option><option value="31">新疆</option><option value="32">台湾省</option><option value="33">香港</option><option value="34">澳门</option><option value="35">海外</option><option value="36">其他</option><option value="2">天津市</option>			            </select>
			            <select name="city" id="city" style="width:100px; height:30px;"><option value="">请选择城市</option><option value="37">东城区</option><option value="38">西城区</option><option value="39">崇文区</option><option value="40">宣武区</option><option value="41">朝阳区</option><option value="42">丰台区</option><option value="43">石景山区</option><option value="44">海淀区</option><option value="45">门头沟区</option><option value="46">房山区</option><option value="47">通州区</option><option value="48">顺义区</option><option value="49">昌平区</option><option value="50">大兴区</option><option value="51">怀柔区</option><option value="52">平谷区</option><option value="53">密云县</option><option value="54">延庆县</option></select>
			            <select name="dist" id="dist" style="width:100px; height:30px;"><option value="">请选择地区</option><option value="567">东华门街道</option><option value="568">东四街道</option><option value="569">东直门街道</option><option value="570">交道口街道</option><option value="571">北新桥街道</option><option value="572">和平里街道</option><option value="573">安定门街道</option><option value="574">建国门街道</option><option value="575">景山街道</option><option value="576">朝阳门街道</option></select>
					</li>
					<li class="form-main clearfix">
						<span class="fl">详细地址<em>*</em></span>
						<textarea class="fl" name="address" id="address" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea>
					</li>
					<li class="form-main clearfix">
						<span class="fl">邮政编码<em>*</em></span>
						<select id="select_change" style="width:100px; height:30px;">
							<option value="0">无</option>
							<option value="1">填写</option>
						</select>
						<input type="number" name="zipcode" id="zipcode" class="txt" style="display:none;">
					</li>
					<li class="form-main clearfix">
						<span class="fl">收货人姓名<em>*</em></span>
						<input type="text" name="realname" id="realname" class="txt">
					</li>
					<li class="form-main clearfix">
						<span class="fl">手机号码<em>*</em></span>
						<input type="number" name="mobile" id="mobile" class="txt">
					</li>
					<li class="form-main clearfix">
						<span class="fl"></span>
						<label><input type="checkbox" name="status" id="status" value="1" class="check">设置为默认收货地址</label>
					</li>
					<li class="form-main clearfix">
						<span class="fl"></span>
						<input type="button" value="保存" class="submit">
					</li>
				</form>
			</ul>			
			<dl class="content-data-main">
			</dl>
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
<script type="text/javascript" src="./adress_files/address.js"></script>

<script>
$(".submit").click(function() {
	var prov = $("#prov option:selected").text();
	var city = $("#city option:selected").text();
	var dist = $("#dist option:selected").text();
	var detail = $("#address").text();
	var address = prov+city+dist+detail;
	var zipcode = $("#zipcode").val();
	var realname = $("#realname").val();
	var mobile = $("#mobile").val();
	var status = 0;
	if($("input[type='checkbox']").is(':checked')) {
		status = 1;
	}
	$.getJSON("http://localhost:8762/service-user/addAddress.action",{address_name:address,address_code:zipcode,address_status:status,address_tel:mobile,address_user:realname},function(data) {
		if(data.code==1) {
			show();
		}
	})
})
$(function(){
	show();

	$('#select_change').change(function(){
		if($(this).val()==1)
		{
			$(this).css('display','none');
			$('#zipcode').css('display','block');
		}
	});
})
function show() {
	$.getJSON("http://localhost:8762/service-user/getAddress.action",function(data) {
		if(data.code==1){
			var obj = data.obj;
			var str = "<dt class='clearfix'><span class='fl consignee'>收货人</span><span class='fl address'>地址信息</span><span class='fl z-code'>邮编</span><span class='fl mobile-p'>手机</span><span class='fl oper'>操作</span></dt>";
			for(var i=0;i<obj.length;i++) {
				str+="<dd class='clearfix' ><span class='fl consignee'>"+obj[i].address_user+"</span>";
				str+="<span class='fl address'>"+obj[i].address_name+"</span>";
				str+="<span class='fl z-code'>"+obj[i].address_code+"</span>";
				str+="<span class='fl mobile-p'>"+obj[i].address_tel+"</span>";
				str+="<span class='fl oper clearfix'><a href='javascript:;' onclick='edit2("+obj[i].address_id+")' modurl=''>修改</a> |<a href='javascript:;' onclick='del("+obj[i].address_id+")'>删除</a>";
				if(obj[i].address_status==1) {
					str+="<input type='button' value='默认地址' class='setUp'></span></dd>";
				} else {
					str+="<input type='button' onclick='setDefault("+obj[i].address_id+")' value='设为默认' class='default' data-value='3'></span></dd>";
				}
			}
			$(".content-data-main").html(str);
		}
	});
}
function setDefault(id) {
		$.getJSON("http://localhost:8762/service-user/setDefaultAddress.action",{"address_id":id},function(data) {
			if(data.code==1){
				show();
			}
		})
	}

</script>
<!-- <script src="http://localhost/Public/Home/js/header.js"></script>
 -->


<%@ include file="../bottom.jsp"%>