$(function(){
	//验证码
	var N = 2;
	var timer = null;
	var bFlag = false;
	$('#V-btn').on('click',function(){
		if(bFlag == true)return;
		bFlag = true;
		$(this).addClass('hover');
		var _this = $(this);
		timer = setInterval(function(){
			N--;
			if(N <= 0){
				N = 20;
				clearInterval(timer);
				_this.html('重新获取验证码');
				_this.removeClass('hover');
				bFlag = false;
			}else{
				_this.html(N+'秒后重试');
			}		
	    },1000);
    });
});

