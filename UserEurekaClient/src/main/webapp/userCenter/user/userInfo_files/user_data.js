//密保问题验证
function user_data(){
    var nick_name = $('#nick_name').val();
    var user_name = $('#user_name').val();
    var mobile = $('#mobile').val();
    var email = $('#email').val();
  
    if(nick_name == ''){
        layer.tips('请填写昵称!', '#nick_name');
        return false;
    }
    if(user_name == ''){
        layer.tips('请填写真实姓名!', '#user_name');
        return false;
    }
    if(mobile == ''){
        layer.tips('请填写手机号!', '#problem2');
        return false;
    }
    if(email == ''){
        layer.tips('请填写邮箱!', '#email');
        return false;
    }
    return true;
} 
