$(function(){$('.li_add').click(function(){$(this).find('.li_a').addClass('hover');$(this).siblings('.li_add').find('.li_a').removeClass("hover");var user_address=$(this).find('.addre').html();var realname1=$(this).find('.realname1').val();var mobile1=$(this).find('.mobile1').val();$('#user_address').val(user_address);$('.gray_addr').html(user_address);$('.realname').val(realname1);$('.mobile').val(mobile1);});$('.pay_statue').click(function(){$(this).addClass('hover');$(this).siblings('.pay_statue').removeClass('hover');});$('.order_remarks').blur(function(){if($(this).val().length>45){alert('您的文字超过了规定字数');}});})
var str=$("#pay_sum").text();str=str.replace(/￥/ig,"");str=Number(str);var jf1=Number($('#jf1').val());var jf2=Number($('#jf2').val());function clearJf(){if($("#jfa").val()-0>jf1){$("#jfa").val(jf1);}
if($("#jfb").val()-0>jf2){$("#jfb").val(jf2);}
if($("#jfa").val()-0<0){$("#jfa").val(0);}
if($("#jfb").val()-0<0){$("#jfb").val(0);}
new_price=str-$("#jfa").val()-0-$("#jfb").val();$("#pay_sum").text(new_price);}
function addNum1(){if($("#jfa").val()-0+1<=jf1&&str!=0){$("#jfa").val($("#jfa").val()-0+1);var price_a=$("#jfa").val();var price_b=$("#jfb").val();$("#pay_sum").text(str-0-price_a-price_b);}}
function addNum2()
{if($("#jfb").val()-0+1<=jf2&&str!=0){$("#jfb").val($("#jfb").val()-0+1);var price_a=$("#jfa").val();var price_b=$("#jfb").val();$("#pay_sum").text(str-0-price_a-price_b);}}
function jianNum1()
{if($("#jfa").val()-1>=0){var price_a=$("#jfa").val();var price_b=$("#jfb").val();$("#jfa").val($("#jfa").val()-1);$("#pay_sum").text(str-0-price_a-price_b+1);}}
function jianNum2()
{if($("#jfb").val()-1>=0)
{var price_a=$("#jfa").val();var price_b=$("#jfb").val();$("#jfb").val($("#jfb").val()-1);$("#pay_sum").text(str-0-price_a-price_b+1);}}
function add_addr(){layer.open({type:2,title:"增加收货地址",shadeClose:true,shade:0.2,area:['500px','350px'],content:urlAdd});}
function address_more(){var ad_more=$('#ad_more').val();if(ad_more==1){$('.dis_none').css("display","block")
$('#ad_more').val(2)}else{$('.dis_none').css("display","none")
$('#ad_more').val(1)}}
function addr_edite(id){layer.open({type:2,title:"增加收货地址",shadeClose:true,shade:0.2,area:['400px','400px'],content:urlEdit+"?id="+id});}
function check(){var user_address=$('#user_address').val();$('input[type="hidden"]').each(function(){if($(this).attr('mustAddress')&&!$(this).val())
{alert('请添加收货地址');}})
if(user_address==''){alert('请点击地址选择');return false;}
return true;}
$(function(){$('.pay_statue').click(function(){var zhi=$(this).html();$(this).siblings('.pay_statue').removeClass('hover');$(this).addClass('hover');if(zhi=='支付宝支付'){$('#pay_style').val(1);}else{$('#pay_style').val(2);}});})
function getCity(a){var str=$(a).html();var lastIndex=str.lastIndexOf(' ');var lastStr=str.substring(lastIndex+1);$("#city_inp").val(lastStr);}
function return_goods(){var tuihuo_case=$('#tuihuo_case').val();var price=$('#price').val();var explain=$('#explain').val();if(tuihuo_case==''){layer.tips('请填写退货原因','#tuihuo_case');return false;}
if(price==''){layer.tips('请填写退款金额','#price');return false;}
if(explain==''){layer.tips('请填写退货说明','#explain');return false;}
return true;}
function return_price(){var is_receive=$("input[name='is_receive']:checked").val();var tuihuo_case=$('#a_tuihuo_case').val();var price=parseFloat($('#a_price').val());var h_price=parseFloat($('#hidden_price').val());var explain=$('#a_explain').val();if(is_receive==null){layer.tips('请选择退款时是否收到货','#is_receive');return false;}
if(tuihuo_case==''){layer.tips('请填写退款原因','#a_tuihuo_case');return false;}
if(isNaN(price)){layer.tips('请填写退款金额','#a_price');return false;}
if(price>h_price){layer.tips('退款金额不能大于商品总金额!','#a_price');return false;};if(explain==''){layer.tips('请填写退款说明','#a_explain');return false;}
return true;}
function check_report(){var reason=$('#reason').val();var content=$('#contents').val();if(reason==''){layer.tips('请填写投诉原因!','#reason');return false;}
if(content==''){layer.tips('请填写投诉内容!','#contents');return false;}
return true;}
$('.myderCentent .con .conFr .details ').on('click','.restore',function(){var id=$(this).attr('data-value');var _this=$(this);parent.layer.confirm('真的要还原订单吗？',{btn:['确认','取消'],shade:0.5},function(){$.post("/index.php/Home/Order/restore_order",{"id":id},function(data){if(data==1){parent.layer.msg('还原成功',{icon:1,time:1000},function(){$("#del"+id).remove();});}else{parent.layer.msg('还原失败',{icon:2,time:2000});}},"json");},function(){});});function cancel(id){var html=$('.ui-alert-main');layer.open({type:1,title:'提示',btn:['确认取消','暂不取消'],skin:'layui-layer-rim',area:['583px','440px'],content:html,yes:function(index,layero){var name=$('.ui-alert-main .input-main .input-main input').val();if(name==''){layer.tips('请选择(填写)取消订单理由!','#reason');return false;};$.post("/index.php/Home/Order/cancel_order",{"id":id,"reason":name},function(data){if(data==1){parent.layer.msg('取消成功',{icon:1,time:1000},function(){layer.close(index);$("#del"+id).remove();});}else{parent.layer.msg('取消失败',{icon:2,time:2000});}},"json");},});};$('.myderCentent .ctitle ').on('click','.del',function(){var id=$(this).attr('data-value');var _this=$(this);parent.layer.confirm('真的要删除订单吗？',{btn:['确认','取消'],shade:0.5},function(){$.post("/index.php/Home/Order/order_del",{"id":id},function(data){if(data==1){parent.layer.msg('删除成功',{icon:1,time:1000},function(){$("#del"+id).remove();});}else{parent.layer.msg('删除失败',{icon:2,time:2000});}},"json");},function(){});});