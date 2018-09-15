//账号密码登录
function check_name(){
    var is_start=$('input[name=is_start]').val();
    var name = $('#name').val();
    var pwd = $('#pwd').val();
    var referer = $('#referer').val();
    var logon = $('input[name=logon]:checked').val();
    if (logon != '1') {
        logon = '0';
    };
    if(name == ''){
        layer.tips('请填写邮箱/用户名/手机号', '#name',{
        	 tips:[4,'#f29202']
        });
        return false;
    }
    if(pwd == ''){
        layer.tips('请填写密码', '#pwd',{
        	 tips:[4,'#f29202'] 
        });
        return false;
    } 
    $.post( "login",{"name":name,"pwd":pwd,'logon':logon,'referer':referer},function(data){
        if(data.code == 1){
            layer.msg('登录成功，正在跳转中...',{icon: 1,time: 2000,shade: [0.8, '#393D49']},function(){
                location.href=data.mes;
            });
        }else if(data.code == 2){
            if(is_start==1){
            layer.tips('账号不存在!', '#name',{
                tips:[4,'#f29202']
            });
            return false;
            }else{
                layer.tips('账号不存在,请使用用户名登录!', '#name', {
                    tips: [4, '#f29202']
                });
                return false;
            }
        }else if(data.code == 3){
            layer.tips('密码错误!', '#pwd',{
                tips:[4,'#f29202'] 
            });
            return false;
        }else{
            layer.msg('登录失败，请重新输入!',{icon: 2,time: 2000},function(){
                window.location.reload();
            });
        }
    }, "json");
}
//手机验证码登录 

function check_tel(){
    var tel = $('#tel').val();
    var code = $('#code').val();
    var referer = $('#referer').val();
    if(tel == ''){
        layer.tips('请填写手机号', '#tel',{
            tips:[4,'#f29202']
        });
        return false;
    }
    if(!/^1[345789]\d{9}$/.test(tel)){
        layer.tips('请输入正确的手机号', '#tel',{
            tips:[4,'#f29202']
        });
       return false;
    }
    if(code == ''){
        layer.tips('请填写验证码', '#code',{
            tips:[4,'#f29202']
        });
        return false;
    }
    //if(code!=$('input[name=get_code]').val()) {
    //    layer.tips('验证码不正确,请重试', '#is_check');
    //    return false;
    //} else {
    //    if(code!=''){
    //        layer.tips('验证码输入正确','#is_check');
    //    }
    //}

    var code=$('#code').val();
    $.post("check_tel_codestatus",{"code":code,"tel":tel,"referer":referer},function(){
        if(data.code == 1){
            layer.msg('登录成功，正在跳转中...',{icon: 1,time: 2000,shade: [0.8, '#393D49']},function(){
                location.href=data.mes;
            });
            //}else if(data.code == 2){
            //    layer.tips('手机号输入错误!', '#tel',{
            //    tips:[4,'#f29202']
            //    });
            //    return false;
        }else if(data.code == 4){
            layer.tips('手机号未注册!', '#tel',{
                tips:[4,'#f29202']
            });
            return false;
        }else if(data.code == 5){
            layer.tips('验证码不正确,请重试', '#is_check');
            return false;
        }
        else{
            layer.msg('登录失败!',{icon: 2,time: 2000},function(){
                window.location.reload();
            });
        }

    },'json');

}
