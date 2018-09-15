/**
 * 中文验证规则
 */
jQuery.validator.addMethod('checkChinese', function(value, element, params) {
	if (!/^[\u4e00-\u9fa5]+$/i.test(value)) {
		return false;
	}
	return true;
}, "请输入中文");

jQuery.validator.addMethod("checkMobile", function(value, element) {

	if (!value) {
		return true;
	}
	var reg0 = /(^1[3|4|5|7|8][0-9]{9}$)/;

	/*
	 * var reg0 = /^13\d{5,9}$/;
	 * 
	 * var reg1 = /^15\d{5,9}$/;
	 * 
	 * var reg2 = /^189\d{4,8}$/;
	 * 
	 * var reg3 = /^0\d{10,11}$/;
	 */

	var my = false;
	if (reg0.test(value)) {
		my = true;
	}
	/*
	 * if (reg0.test(value) || reg1.test(value) || reg2.test(value) ||
	 * reg3.test(value) ) { my=true; }
	 */

	if (!my) {
		return false;
	}

	return true;
}, "请输入有效的手机号码");

// 验证座机
jQuery.validator.addMethod('checkTelphone', function(value, element) {
	if (!value) {
		return true;
	}
	var telephoneRule = /^\d{3,4}-?\d{7,9}$/;

	if (telephoneRule.test(value)) {
		return true;
	}
	return false;
}, "请输入有效的座机号码");
// 验证密码是否一致
jQuery.validator.addMethod('pwdIsTrue', function(value, element) {

	var obj = $('#pwdS');
	return obj.val() === value && obj.val() && obj.val().length >= 6;

}, '两次密码不一致长度必须大于等于6位');
// 验证是否存在特殊字符
jQuery.validator.addMethod("specialCharFilter", function(value, element) {
	var pattern = new RegExp(
			"[`~!@#$^&()=|{}';,<>?~！@#￥……&（）——|【】‘；：”“'。，、？% 　\"\\\\]");
	var specialStr = "";
	for (var i = 0; i < value.length; i++) {
		specialStr += value.substr(i, 1).replace(pattern, '');
	}
	if (specialStr == value) {
		return true;
	}

	return false;
});
/**
 * @desc 验证是否是英文
 * @return Boolean
 */
jQuery.validator.addMethod("checkIsEmglish", function(value, element) {
	var pattern = /^[A-Za-z]+$/;
	if (pattern.test(value)) {
		return true;
	}
	return false;
});
/**
 * 验证数字和英文的组合
 */
jQuery.validator.addMethod("NumberAndEnglish", function(value, element) {
	var pattern = /^[A-Za-z0-9]+$/;

	if (pattern.test(value)) {
		return true;
	}
	return false;
}, '数据只能是数字和英文的组合');

/**
 * 验证长度是否符合
 */
jQuery.validator.addMethod("lengthPass", function(value, element) {
	var l = value.length;
	var blen = 0;
	for (i = 0; i < l; i++) {
		if ((value.charCodeAt(i) & 0xff00) != 0) {
			blen++;
		}
		blen++;
	}
	return (blen != 32) ? false : true; 
}, '长度必须是32位');