//添加收货地址验证 
function address_add(){
    var cho_Province = $('#cho_Province').val();
    var cho_City = $('#cho_City').val();
    var cho_Area = $('#cho_Area').val();
    var address  = $('#address').val();
    var zipcode  = $('#zipcode').val();
    var realname = $('#realname').val();
    var mobile   = $('#mobile').val();

    if(cho_Province == '请选择省份'){
        
        return false;
    }
    if(cho_City == '请选择城市'){
        
        return false;
    }
    if(cho_Area == '请选择地区'){
        
        return false;
    }
    if(address == ''){
        layer.tips('请填写详细地址!', '#address');
        return false;
    }
    //if(zipcode == ''){
    //    layer.tips('请填写邮政编码!', '#zipcode');
    //    return false;
    //}
    if(zipcode!=''){
        if(!/^[1-9][0-9]{5}$/.test(zipcode)) {
            layer.tips('请输入正确的邮编', '#zipcode');
            return false;
        }
    }
    if(realname == ''){
        layer.tips('请填写收货人姓名!', '#realname');
        return false;
    }
    if(mobile == ''){
        layer.tips('请填写收货人电话!', '#mobile');
        return false;
    }
    if(!/^1[345789]\d{9}$/.test(mobile)){
        layer.tips('请输入正确的手机号', '#mobile');
        return false;
    }
    return true;
}
function edit(id){
    parent.layer.open({
        type: 2,
        shadeClose: true,
        shade: 0.5,
        area: ['450px', '460px'],
        title: '编辑账号信息',
        content: 'address_edit?id='+id
    });
}

function edit2(e){
    var modurl = $(e).attr('modurl');
    //console.log(modurl)
    parent.layer.open({
        type: 2,
        shadeClose: true,
        shade: 0.5,
        area: ['450px', '460px'],
        title: '编辑收货地址',
        content: modurl
    });
}

//修改收货地址验证 
//function check(){
//    var prov = $('#prov').val();
//    var city = $('#city').val();
//    var dist = $('#dist').val();
//    var address = $('#address').val();
//    var realname  = $('#realname').val();
//    var mobile   = $('#mobile').val();
//    var zipcode  = $('#zipcode').val();
//    if(prov == ''){
//        layer.tips('请填写所在省份!', '#zipcode');
//        return false;
//    }
//    if(city == ''){
//        layer.tips('请填写所在城市!', '#zipcode');
//        return false;
//    }
//    if(dist == ''){
//        layer.tips('请填写所在地区!', '#zipcode');
//        return false;
//    }
//    if(address == ''){
//        layer.tips('请填写详细地址!', '#address');
//        return false;
//    }
//    if(realname == ''){
//        layer.tips('请填写收货人姓名!', '#realname');
//        return false;
//    }
//    if(mobile == ''){
//        layer.tips('请填写收货人电话!', '#mobile');
//        return false;
//    }
//     if(!/^1[34578]\d{9}$/.test(mobile)){
//        layer.tips('请输入正确的手机号', '#mobile');
//        return false;
//    }
//    if(zipcode == ''){
//        layer.tips('请填写邮政编码!', '#zipcode');
//        return false;
//    }
//    return true;
//}

//删除收货地址
function del(id){
    $("#del"+id+" td").css('background','#CBDFF2');
    parent.layer.confirm('真的要删除吗？', {
        btn: ['确认','取消'], //按钮
        shade: 0.5 //显示遮罩
    }, function(){
        $.post(DEL, { "id": id},function(data){
            if(data.status == 1){
                parent.layer.msg('删除成功,请等待两秒后刷新', { icon: 1, time: 1000 }, function(){
                        $("#del"+id).remove();
                    setTimeout(href_url=function(){
                        window.location.href=data.url;
                    },2000);
                    });
            }else if(data.status == 2){
                parent.layer.msg('已使用过该收获地址，请勿删除', {icon: 2, time: 2000 });
            }else{
                console.log(data);debugger;
                parent.layer.msg('删除失败', {icon: 2, time: 2000 });
            }
        }, "json");
    },function(){
        $("#del"+id+" td").css('border-top','0');
        $("#del"+id+" td").css('border-bottom','1px solid #EFEFEF');
    });
}  


    var aLi = $('.mordrMain .content-data-main dd .oper input[type=button]');
    aLi.on('click',function(){
        var _id = $(this).attr('data-value');
        var _this = $(this);
        if(_this.attr('class') == 'setUp')return;
        $.ajax({
            url : DEFAULT,
            dataType : 'json',
            type : 'get',
            data : {id:_id},
            success:function(data){ 
                if (data = 1) {
                    aLi.attr('class','default').val('设为默认');
                    _this.attr('class','setUp').val('默认地址');
                } else{
                    console.log(data)
                };
            },
            error:function(data){
                console.log(data)
            }
        });

    });

//验证密码
function check_pwd(){
    var reg_pwd = $('#reg_pwd').val();
    var new_pwd = $('#new_pwd').val();
    var new_pwd1 = $('#new_pwd1').val();
    if(reg_pwd == ''){
        layer.tips('请填写当前登录密码!', '#reg_pwd');
        return false;
    }
    if(new_pwd == ''){
        layer.tips('请填写新密码!', '#new_pwd');
        return false;
    }
    if(!/^(\w){6,20}$/.test(new_pwd)){
        layer.tips('密码格式不对!', '#new_pwd');
        return false;
    };
    if(new_pwd1 == ''){
        layer.tips('请再次填写新密码!', '#new_pwd1');
        return false;
    }
    if(new_pwd != new_pwd1){
        layer.tips('两次密码不一致,请重新填写!', '#new_pwd1');
        return false;
    }
    return true;
}

//绑定手机验证
function bound_phone(){
    var tel   = $('#tel').val();
    var code  = $('#code').val();

    if(tel == ''){
        layer.tips('请填写手机号!', '#tel');
        return false;
    }
    if(!/^1[345789]\d{9}$/.test(tel)){
        layer.tips('请输入正确的手机号', '#tel');
        return false;
    }
    if(code == ''){
        layer.tips('请填写验证码!', '#code');
        return false;
    }
    return true;
}

//密保问题验证
function question(){
    var problem1 = $('#problem1').val();
    var answer1 = $('#answer1').val();
    var problem2 = $('#problem2').val();
    var answer2 = $('#answer2').val();
    var problem3 = $('#problem3').val();
    var answer3 = $('#answer3').val();
    if(problem1 == '请选择'){
        layer.tips('请选择问题一!', '#problem1');
        return false;
    }
    if(answer1 == ''){
        layer.tips('请填写问题一的答案!', '#answer1');
        return false;
    }
    if(problem2 == '请选择'){
        layer.tips('请选择问题二!', '#problem2');
        return false;
    }
    if(answer2 == ''){
        layer.tips('请填写问题二的答案!', '#answer2');
        return false;
    }
    if(problem3 == '请选择'){
        layer.tips('请选择问题三!', '#problem3');
        return false;
    }
    if(answer3 == ''){
        layer.tips('请填写问题三的答案!', '#answer3');
        return false;
    }
    return true;
}

ajax_address_data=function()
{
    var prov = $('#prov').val();
    var city = $('#city').val();
    var dist = $('#dist').val();
    var address = $('#address').val();
    var realname  = $('#realname').val();
    var mobile   = $('#mobile').val();
    var zipcode  = $('#zipcode').val();
    if(prov == ''){
        layer.tips('请填写所在省份!', '#zipcode');
        return false;
    }
    if(city == ''){
        layer.tips('请填写所在城市!', '#zipcode');
        return false;
    }
    if(dist == ''){
        layer.tips('请填写所在地区!', '#zipcode');
        return false;
    }
    if(address == ''){
        layer.tips('请填写详细地址!', '#address');
        return false;
    }
    if(realname == ''){
        layer.tips('请填写收货人姓名!', '#realname');
        return false;
    }
    if(mobile == ''){
        layer.tips('请填写收货人电话!', '#mobile');
        return false;
    }
    if(!/^1[345789]\d{9}$/.test(mobile)){
        layer.tips('请输入正确的手机号', '#mobile');
        return false;
    }
    //if(zipcode == ''){
    //    layer.tips('请填写邮政编码!', '#zipcode');
    //    return false;
    //}
    if(zipcode!=''){
       if(!/^[1-9][0-9]{5}$/.test(zipcode)) {
           layer.tips('请输入正确的邮编', '#zipcode');
           return false;
       }
    }
    $.ajax({
        type:"POST",
        data:"fromdata="+$('#from_address_data').serialize(),
        url:"from_address_data",
        success:function(data){
            if(data['status']==1)
            {
                layer.msg('更改成功，正在跳转中...', {
                    icon : 1,
                    time : 2000,
                    shade : 0.5
                }, function() {
                    window.parent.location.reload();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });

            }else{
                layer.msg('修改失败');
            }
        }
    })
}