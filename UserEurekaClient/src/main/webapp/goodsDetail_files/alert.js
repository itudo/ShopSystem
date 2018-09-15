/**
 * 弹出层js
 */
(function () {

    function newAlert() {
    }

    newAlert.prototype = {
        // 弹窗高度
        height: 0,
        // 弹窗宽度
        width: 0,

        type: 'post',

        dataType: 'json',

        dataJson: [],

        noticeHTML: true,

        areaData: {},//选中的数据集合

        area: '',// 下拉选项卡相关

        successF: '',

        errorF: '',

        pageNumber: 0,
        myObj: '',

        curret: '',
        class_url: '',//获取分类的URL
        classValue: 0, //默认分类编号

        format: "YYYY-MM-DD HH:mm:ss", //日期格式

        singleDatePicker: true,

        setFormat: function (format) {

            Tool.format = format;
        },

        setSingleDataPicker: function (boolS) {

            Tool.singleDatePicker = boolS;
        },

        setIsCoupon: function (isCoupon) {
            this.isCoupon = isCoupon;
        },

        setClassValue: function (classValue) {
            Tool.classValue = classValue;
        },

        /**
         * ajax 获取数据
         * @param  string id  form id
         * @param  int page   页数
         */
        ajaxGetList: function (id, page, receiveId) {
            this.pageNumber = page;
            if (!$('#' + id).length || !this.isNumer(page)) {
                layer.msg('参数错误');
                return false;
            }
            var data = $('#' + id).serialize();
            var url = document.getElementById(id).getAttribute('url') + '?p=' + page;

            if (!url) {
                layer.msg('参数错误');
                return false;
            }

            this.dataType = '';
            return this.post(url, data, function (res) {
                $("#" + receiveId).html('');
                $("#" + receiveId).append(res);
            })

        },
        /**
         * 排序
         */
        sort: function (id, field, received) {
            var receive = typeof received === 'undefined' ? 'ajaxGetReturn' : received;
            $("input[name='order_by']").val(field);
            var v = $("input[name='sort']").val() == 'desc' ? 'asc' : 'desc';
            $("input[name='sort']").val(v);
            this.ajaxGetList(id, this.pageNumber, receive);
        },
        isShow: function (event, url) {
            var json = {};
            var value = 0;
            $(event).siblings('input[type="hidden"]')
                .each(
                    function () {
                        value = parseInt($(this).val());
                        json[$(this).attr('name')] = $(this).attr(
                            'falg') === '1' ? (value === 0 ? 1 : 0)
                            : value;
                    });
            return this.ajax(url, json);
        },

        /**
         * 是否是数字
         *
         * @param number
         *            要检测的值
         */
        isNumer: function (number) {
            return isNaN(number) ? false : true;
        },

        sleep: function (numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        },

        // 在线编辑器
        ueditor: function (options, id) {
            if (!$('#' + id).length) {
                return false;
            }
            editor = new UE.ui.Editor(options);
            return editor.render(id);
        },

        /**
         * 弹窗页面
         */
        alertEdit: function (url, title, width, height) {
            width = typeof width === 'undefined' ? 500 : width;

            height = typeof height === 'undefined' ? 400 : height;


            if (!url) {
                layer.msg('来自网页的消息,未知错误');
                return false;
            }
            title = title ? title : '添加关键词';
            parent.layer.open({
                type: 2,
                shadeClose: true,
                shade: 0.5,
                area: [width + 'px', height + 'px'],
                title: title,
                content: url,
            });
        },

        submit: function (event, url) {
            var data = this.getForm(event);
            if (!data) {
                alert('数据有误');
                return false;
            }

            this.ajax(url, data);
        },

        // 获取form数据
        getForm: function (event) {
            var formData = {};

            $('select').each(
                function () {
                    if (typeof $(this).attr('name') != 'undefined'
                        && !$(this).attr('disabled')) {

                        formData[$(this).attr('name')] = $(this).find(
                            'option:selected').val();
                    }
                });

            $('input').each(function () {
                formData[$(this).attr('name')] = $(this).val();
            });
            var flag = 0;
            for (var i in formData) {
                if (!formData[i]) {
                    flag++;
                }
            }
            return flag === 0 ? formData : false;
        },

        getDataJson: function () {
            console.log(this.dataJson);
            return this.dataJson;
        },

        /**
         * @param string
         *            url
         */
        ajax: function (url, data, callBack) {
            var type = this.type;
            $.ajax({
                url: url,
                type: type,
                data: data,
                dataType: 'json',
                success: function (res) {
                    layer.msg(res.message);
                    if (res.hasOwnProperty('status') && res.status) {
                        return typeof callBack === 'undefined' ? Tool
                            .closeWindow() : callBack(res);
                    } else if (Tool.noticeHTML) {

                        return false;
                    }
                }
            })
        },
        ajaxToFormArray: function (formId, url, callBack) {

            var array = $('#' + formId).formToArray();

            if (this.isEmptyArray(array)) {
                layer.msg('参数错误');
                return false;
            }
            return this.ajax(url, array, callBack);
        },


        /**
         * 跳转回调函数
         */
        redirect: function (res) {
            layer.msg(res.message);
            if (res.hasOwnProperty('status') && res.status == 0) {
                return false;
            }
            setInterval(function () {
                location.href = res.data.url;
            }, 2000);
        },

        /**
         * @param string
         *            url
         */
        ajaxOther: function (url, data, callBack) {
            var type = this.type;
            $.ajax({
                url: url,
                type: type,
                data: data,
                dataType: 'json',
                success: function (res) {
                    return typeof callBack === 'undefined' ? Tool.closeWindow()
                        : callBack(res);
                }
            })
        },

        /**
         * 关闭窗口
         */
        closeWindow: function () {
            var index = parent.layer.getFrameIndex(window.name);//获取窗口索引

            var id = setInterval(function () {
                window.parent.iframe.location.reload();
                index ? parent.layer.close(index) : false;
            },2000)

            //var ifream = window.parent.document.getElementsByTagName('iframe');
            //var perfix = 'layui-layer-iframe';
            //
            //var length = ifream.length;
            //var name;
            //var i = 0;
            //
            //for (i; i < length; i++) {
            //	if (ifream[i].name.indexOf(perfix) === -1) {
            //		continue;
            //	}
            //	name = ifream[i].name;
            //}
            //
            //if (typeof name === 'undefined') {
            //	layer.msg('弹出层太多');
            //
            //	return ;
            //}
            //setInterval(function () {
            //	window.parent.iframe.location.reload();
            //	parent.layer.close(name.replace(perfix, ''));
            //
            //}, 2000);
        },

        /**
         * 编辑
         *
         * @param int
         *            id 属性编号
         * @param string
         *            url 网址连接
         * @param string
         *            title 页面标题
         */
        editData: function (id, url, title) {
            if (!this.isNumer(id) || !title) {
                layer.msg("参数错误");
                return false;
            }
            return this.alertEdit(url, title);
        },

        /**
         * 删除属性
         */
        deleteData: function (id, url) {
            if (!this.isNumer(id)) {
                layer.msg("参数错误");
                return false;
            }
            return this.ajax(url, {
                id: id
            });
        },
        /**
         * 属性赋值
         */
        inputValue: function (id, value) {
            return document.getElementById(id).value = value;
        },

        uploadify: function (url, width) {
            var width = typeof width === 'undefined' ? 600 : width;
            var iframe_str = '<iframe frameborder="0" name="uploadframe" ';
            iframe_str = iframe_str + 'id=uploadify ';
            iframe_str = iframe_str + ' src=' + url;
            iframe_str = iframe_str
                + ' allowtransparency="true" class="uploadframe" scrolling="no"> ';
            iframe_str = iframe_str + '</iframe>';
            $("body").append(iframe_str);
            $("iframe.uploadframe").css("height", $(document).height()).css(
                "width", width + "px").css("position", "absolute").css(
                "left", "200px").css("top", "0px").css("z-index", "999999")
                .show();
            $(window).resize(
                function () {
                    $("iframe.uploadframe").css("height",
                        $(document).height()).show();
                });
        },
        /**
         * 检测url的合法性
         */
        checkURL: function (URL) {
            var str = URL;
            // 判断URL地址的正则表达式为:http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?
            // 下面的代码中应用了转义字符"\"输出一个字符"/"
            var Expression = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
            var objExp = new RegExp(Expression);

            return (objExp.test(str) == true) ? true : false;
        },

        post: function (url, data, callBack) {

            var fun = typeof callBack === 'undefined' ? this.parseResponse
                : callBack;
            if (/* !this.checkURL(url)|| */!data) {
                layer.msg('数据为空');
                return false;
            }
            return $.post(url, data, fun, this.dataType);
        },

        /**
         * 通知
         */
        notice: function (res) {

            if (res.hasOwnProperty('status') && res.status == '1') {
                layer.msg(res.message);

                setInterval(function () {
                    return Tool.closeWindow();
                }, 2000);
            }

            return layer.msg(res.message);
        },

        /**
         * 解析商品分类
         */
        parseResponse: function (res) {
            if (!res.hasOwnProperty('data') && res.data == null) {
                return false;
            }
            var arr = res.data;
            var optionBuild = "<option value=\"0\">请选择商品分类</option>";
            for (var i in arr) {

                if (arr[i].id == Tool.classValue) {
                    optionBuild += '<option value="' + arr[i].id + '" selected="selected">'
                        + arr[i].class_name + '</option>';
                } else {
                    optionBuild += '<option value="' + arr[i].id + '" >'
                        + arr[i].class_name + '</option>';
                }


            }

            return $('#parent_id_2').empty().html(optionBuild);
        },

        /**
         * 分类选择
         */
        change: function (event, url) {
            var req = {};
            var selectId = event.value;
            req[event.getAttribute('name')] = selectId;
            console.log(req);
            if (!this.isNumer(selectId)) {
                layer.msg('参数错误');
                return false;
            }
            return this.post(url, req);
        },

        /**
         * 选择分类级别
         */
        chanfeLevel: function (element) {
            console.log(element.options[element.selectedIndex]);

            var selectedIndex = element.selectedIndex;
            var option = element.options;
            var length = element.length;
            var i = 0;
            for (i; i < length; i++) {
                element.options[i].removeAttribute('selected');
            }
            this.classValue = element.value;
            var obj = $(element).parents('.combo-select').next('.combo-select').find('select').get(0);
            ;

            if (typeof obj === 'undefined') {
                return false;
            }

            this.getClassById(this.class_url, obj);

            //需要的话 请求 三级分类

            if (!(element.options[selectedIndex])) {
                return false;
            }

            element.options[selectedIndex].setAttribute('selected', 'selected');

            var notice = '请选择分类';

            var three = '';

            $(obj).parents('td').find('select').each (function () {
                three = $(this).attr('id');
            })

            return this.deleteClass(three, notice);


        },

        getClassById: function (url, obj) {
            var classValue = this.classValue === 0 ? obj.value : this.classValue;
            var self = this;
            self.ajaxOther(url, {class_name: classValue}, function (res) {

                if (res.hasOwnProperty('status') == 0) {

                    return false;
                }
                var classData = self.areaData;
                var data = res.data;
                var str = '<option value="">请选择分类</option>';
                var i;
                for (i in data) {
                    if (classData != null && classData.hasOwnProperty(i)) {
                        str += '<option value="' + i + '" selected="selected">' + data[i] + '</option>';
                    } else {
                        str += '<option value="' + i + '">' + data[i] + '</option>';
                    }
                }
                var notice = '请选择分类';

                EventAddListener.listen('comboSelect', [str, obj], EventAddListener.parseParamArray);
            });
        },

        deleteClass: function (id, notice) {
            var obj = $('#' + id);
            obj.find('option').each(function () {
                $(this).remove();
            });
            obj.siblings('ul').find('li').each(function () {
                $(this).remove();
            });

            obj.siblings('input[type="text"]').val('');

            obj.html(notice);
        },

        /**
         * 替换
         */
        replaceNumber: function (event) {

            if (!event instanceof Object) {
                return false;
            }
            switch (event.localName) {
                case 'input':
                case 'select':
                    return event.value = event.value.replace(/[^\d.]/g, '');
                    break;
            }
        },

        /**
         * 复选框操作 【父级选中，子集全部选择】
         */
        checkBoxAll: function (id, childrenId) {
            var length = $('.' + childrenId).length;

            if (!length) {
                return false;
            }
            var obj = $('.' + childrenId);
            obj.prop('checked', $('#' + id).prop('checked'));

            var js = [];

            var name = (obj.attr('name'));

            for (var i = 0; i < length; i++) {

                js[i] = {
                    name: obj.eq(i).attr('name'),
                    value: obj.eq(i).val()
                };
            }
            Tool.dataJson = js;
            return js;
        },

        /**
         * 单选框
         */
        childrenBox: function (event, parentId) {
            var classProp = event.getAttribute('class');
            var length = $('.' + classProp).length;
            if (!length) {
                return false;
            }
            var obj = $(event);
            var flag = 0;
            var url = [];
            $('.' + classProp).each(function () {
                if ($(this).prop('checked')) {
                    $('#' + parentId).prop('checked', false);
                    flag++;
                    url.push({
                        name: $(this).attr('name'),
                        value: $(this).val()
                    });
                }
            });

            Tool.dataJson = url;

            if (flag === length) {
                $('#' + parentId).prop('checked', true);
                return true;
            } else {
                $('#' + parentId).prop('checked', false);
                return false;
            }
        },

        removeByValue: function (array, val) {

            if (!array.length || !(array instanceof Array)) {
                return array;
            }
            for (var i = 0; i < array.length; i++) {
                if (array[i].name == val) {
                    array.splice(i, 1);
                    break;
                }
            }

            return array;
        },

        /**
         * 删除空的json
         */
        deleteEmptyArrayValue: function (object) {
            for (var i in object) {
                var value = object[i];
                if (typeof value === 'object') {
                    if (Array.isArray(value)) {
                        if (value.length == 0) {
                            delete object[i];
                            console.log('delete Array', i);
                            continue;
                        }
                    }
                    this.deleteEmptyArrayValue(value);
                    if (this.isEmpty(value)) {
                        console.log('isEmpty true', i, value);
                        delete object[i];
                        console.log('delete a empty object');
                    }
                } else {
                    if (value === '' || value === null || value === undefined) {
                        delete object[i];
                        console.log('delete ', i);
                    } else {
                        console.log('check ', i, value);
                    }
                }
            }
            return object;
        },

        /**
         * 删掉空的值
         */
        deleteEmptyValue: function (data, key) {
            if (this.isEmptyArray(data)) {
                return false;
            }

            for (var i in data) {
                if (data[i].name === key && !data[i].value) {
                    delete data[i];
                }
            }
            return data;
        },

        isEmpty: function (object) {
            for (var name in object) {
                return false;
            }
            return true;
        },

        /**
         * 是否为空数组
         */
        isEmptyArray: function (value) {
            return (Array.isArray(value) && value.length === 0)
                || (Object.prototype.isPrototypeOf(value) && Object
                    .keys(value).length === 0);
        },

        /**
         * 删除数据
         * @param 回调函数
         */
        deleteDbData: function (callBack) {
            var self = this;
            return layer.confirm('您确定删除吗？', {
                btn: ['提交', '取消'], //按钮
                shade: false //不显示遮罩
            }, callBack);
        },

        /**
         * @desc 时间插件
         */
        dataPick: function (id) {
            var myDate = new Date();

            var obj = id instanceof HTMLElement ? $(id) : $('#' + id);

            var split = this.singleDatePicker === false ? '/' : '^';
            var config = obj.daterangepicker({
                format: Tool.format,
                singleDatePicker: Tool.singleDatePicker,
                showDropdowns: true,
                minDate: myDate.getFullYear() + split + myDate.getMonth() + split
                + myDate.getDate(),
                maxDate: '2030' + split + '01' + split + '01',
                timePicker: true, // 是否显示小时和分钟
                timePickerIncrement: 1,// time选择递增数
                timePicker12Hour: false, // 是否使用12小时制来显示时间
                locale: {
                    applyLabel: '确定',
                    cancelLabel: '取消',
                    fromLabel: '起始时间',
                    toLabel: '结束时间',
                    customRangeLabel: '自定义',
                    daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月',
                        '八月', '九月', '十月', '十一月', '十二月'],
                    firstDay: 1
                }
            });
            console.log(config);

            return config;
        },

        /**
         * 下拉列表
         */
        cin: function (obj, url) {

            if (!obj.value) {
                return false;
            }

            var json = {};

            json[obj.name] = obj.value;
            var jdk = $(obj).parents('.drop-main').find('input[type="hidden"]');
            if (jdk.length) {
                jdk.each(function () {
                    json[$(this).attr('name')] = $(this).attr('value');
                });
            }
            Tool.noticeHTML = false;

            return this
                .ajaxOther(
                    url,
                    json,
                    function (res) {
                        var data = res.data;
                        if (Tool.isEmptyArray(data)) {
                            $(obj).siblings('input[type="hidden"]')
                                .remove();
                            return false;
                        }
                        var i = null;
                        var str = '';
                        for (i in data) {
                            str += '<li><input type="hidden" disabled="disabled" value="'
                                + data[i].id + '" name="fid"/>'
                                + data[i].class_name + '</li>';
                        }
                        var superObj = $(obj).parents('.drop')
                            .siblings('.menu');
                        superObj.html('');
                        return superObj.html(str);
                    });
        },

        submitFynction: function (obj, url, json) {
            var self = this;
            console.log(obj);
            return this.ajaxOther(url, json, function (res) {
                var data = res.data;
                var superObj = $(obj).parents('.drop').siblings('.menu');
                superObj.html('');
//				console.log($(obj).text);
                Tool.area = obj.getAttribute('db_name');
                console.log(Tool.area);

                if (obj.getAttribute('id') === 'second') {
                    $('#second').val('');
                }

                if (obj.getAttribute('id') === 'five') {
                    $('#five').val('');
                }

                var what = $(obj).parents('.drop-main').next('.drop-main');
                /*console.log(*/
                what.find('input[type="text"]').val('')/*)*/;

                what.find('li').each(function () {
                    $(this).remove();
                });

                $(obj).parents('.drop-main').next().find('input[type="text"]').val('');
                Tool.myObj = obj;
                if (Tool.isEmptyArray(data)) {
                    $(obj).siblings('input[type="hidden"]').remove();
                    return false;
                }
                var i = null;
                var str = EventAddListener.listen('parseSelect', data);


                return superObj.html(str);
            });
        },
        /**
         * 下拉选择框 回调方法
         */
        selectList: function (data) {

            if (Tool.isEmptyArray(data)) {
                return null;
            }

            var i = null;
            var str = '';
            for (i in data) {
                str += '<li><input type="hidden" value="' + data[i].id
                    + '" name="' + Tool.area + '"/>' + data[i].name
                    + '</li>';
            }
            return str;
        },
        /**
         * 一维数组下拉选择框
         */
        selectOneArray: function (data) {
            if (Tool.isEmptyArray(data)) {
                return null;
            }
            var i = 0;
            var str = '';
            var obj = Tool.myObj;
            var falg = Tool.areaData;
            for (i in data) {
                if (falg.hasOwnProperty(i)) {
                    obj.value = falg[i];
                }
                str += '<li><input type="hidden" value="' + i + '" name="'
                    + Tool.area + '" disabled="disabled"/>' + data[i] + '</li>';
            }
            return str;
        },

        /**
         * 添加数据
         */
        addPromation: function (formId, url) {
            var obj = $('#' + formId);

            if (!obj.length) {
                layer.msg('参数错误');
                return false;
            }
            var data = obj.formToArray();
            //console.log(data);debugger;
            for (var i in data) {
                if (!data[i].value) {
                    layer.msg('请补全数据');
                    return false;
                }
            }

            this.ajax(url, data, function (res) {
                //console.log(res);debugger;
                layer.msg(res.message);
                if (res.hasOwnProperty('status') && res.status == 1) {
                    return setInterval(function () {
                        location.href = res.data.url;
                    }, 3000);
                }
                return false;
            });
        },

        /**
         * 添加赠品数据
         */
        add_gift_data: function (formId, url) {
            var obj = $('#' + formId);

            if (!obj.length) {
                layer.msg('参数错误');
                return false;
            }
            var data = obj.formToArray();
            /*	console.log(data);debugger;
             for ( var i in data) {
             if (!data[i].value) {
             layer.msg('请补全数据');
             return false;
             }
             }*/
            this.ajax(url, data, function (res) {
                layer.msg(res.message);
                if (res.hasOwnProperty('status') && res.status == 1) {
                    return setInterval(function () {
                        location.href = res.data.url;
                    }, 3000);
                }
                return false;
            });
        },

        /**
         * 删除数据
         */
        deleteData: function (url, id) {
            if (!this.isNumer(id)) {
                return false;
            }
            layer.open({
                content: '您确认删除吗？',
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function () {
                    Tool.ajax(url, {
                        id: id
                    }, function (res) {
                        layer.msg(res.message);
                        if (res.hasOwnProperty('status') && res.status == 1) {
                            return setInterval(function () {
                                location.href = res.data.url;
                            }, 3000);
                        }
                        return false;
                    });
                },
                no: function () {

                }
            });

        },
        /**
         * 删除数据
         */
        deleteUserApproval: function (e, url, id) {
            if (!this.isNumer(id)) {
                return false;
            }
            layer.open({
                content: '您确认删除吗？',
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function () {
                    Tool.ajax(url, {
                        id: id
                    }, function (res) {
                        layer.msg(res.message);
                        if (res.hasOwnProperty('status') && res.status == 1) {
                            $(e).parents('.del-data').remove();
                        }
                        return false;
                    });
                },
                no: function () {

                }
            });

        },

        /**
         * 删除数据关闭窗口
         */
        deleteDataClose: function (url, id) {
            if (!this.isNumer(id)) {
                return false;
            }
            var self = this;
            layer.open({
                content: '您确认删除吗？',
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function () {
                    Tool.ajax(url, {
                        id: id
                    }, function (res) {
                        layer.msg(res.message);
                        if (res.hasOwnProperty('status') && res.status == 1) {
                            self.closeWindow();
                        }
                        return false;
                    });
                },
                no: function () {

                }
            });

        },

        getAreaList: function (event, url, addObj) {
            if (!(event instanceof $) || !(addObj instanceof $)) {
                layer.msg('参数错误');
                return false;
            }
            var initData = this.areaData;

            return this.ajax(url, {
                    id: event.val()
                },
                function (res) {

                    if (!res.hasOwnProperty('data')
                        || Tool.isEmptyArray(res.data)) {
                        layer.msg("暂无数据");
                        return false;
                    }

                    var str = "<option value='0'>请选择</option>";

                    var data = res.data;
                    var i = 0;
                    for (i in data) {
                        if (initData.hasOwnProperty('prov')
                            && data[i].id == initData.prov) {
                            str += '<option = value="' + data[i].id
                                + '" selected="selected">'
                                + data[i].name + '</option>';
                        } else if (initData.hasOwnProperty('city')
                            && data[i].id == initData.city) {
                            str += '<option = value="' + data[i].id
                                + '" selected="selected">'
                                + data[i].name + '</option>';
                        } else if (initData.hasOwnProperty('dist')
                            && data[i].id == initData.dist) {
                            str += '<option = value="' + data[i].id
                                + '" selected="selected">'
                                + data[i].name + '</option>';
                        } else {
                            str += '<option = value="' + data[i].id + '">'
                                + data[i].name + '</option>';
                        }

                    }
                    addObj.html('');
                    return addObj.html(str);
                });
        },
        /**
         * 提交数据
         */
        doSubmit: function (formId, url) {
            /**
             * 添加发货地区
             */
            this.noticeHTML = true;
            var obj = $('#' + formId);

            var rule = {};
            var addRule = {};
            var message = {};

            obj.find('.req').each(function () {

                if ($(this).attr('isNumber') == 1) {
                    addRule = {
                        required: true,
                        number: true
                    };
                    rule[$(this).attr('name')] = addRule;
                    message[$(this).attr('name')] = "请输入信息且必须是数字";
                } else {
                    addRule = {
                        required: true
                    };
                    rule[$(this).attr('name')] = addRule;
                    message[$(this).attr('name')] = "请输入信息";
                }
            });
            return obj.validate({
                rules: rule,

                errorPlacement: function (error, element) {

                    var obj = $(element);
                    var span = $(element).siblings('span');
                    obj.val() == false ? span.removeClass('rxd').addClass(
                        'error') : span.removeClass('error')
                        .addClass('rxd');

                },
                success: function (label) {
                    $(label).siblings('span').removeClass('error').addClass(
                        'rxd');
                },
                submitHandler: function () {
                    var data = obj.formToArray();
                    return Tool.ajax(url, data, function (res) {
                        var data = res.data;
                        layer.msg(res.message);
                        if (data.hasOwnProperty('url')) {
                            setInterval(function () {
                                location.href = data.url;
                            }, 3000);
                        }
                    });
                }
            })
        },

        submitHandle: function (obj, message, rule, url) {

            if (!(obj instanceof $)) {
                return false;
            }
            var self = this;
            this.successF = !this.successF ? function (label) {
            } : this.successF;

            this.errorF = !this.errorF ? function (error, element) {
            } : this.errorF;

            return obj.validate({
                rules: rule,
                messages: message,
//				errorPlacement : this.errorF,
//				success : this.successF,
                submitHandler: function () {
                    var data = obj.formToArray();
                    return self.ajax(url, data, function (res) {
                        var data = res.data;
                        layer.msg(res.message);
                        if (data.hasOwnProperty('url')) {
                            setInterval(function () {
                                location.href = data.url;
                            }, 3000);
                        } else {
                            self.closeWindow();
                        }
                    });
                }
            })

        },


        /**
         * 保存
         */
        savePost: function (id, url) {
            var obj = $('#' + id);

            if (!obj.length) {
                layer.msg('数据错误');
                return false;
            }

            var form = obj.formToArray();


            if (this.isEmptyArray(form)) {
                layer.msg('参数错误');
                return false;
            }

            return this.ajax(url, form, function (res) {
                if (res.hasOwnProperty('status') && res.status == 1) {
                    layer.msg(res.message);
                    setInterval(function () {
                        location.href = res.data.url
                    }, 2000);
                }
            });
        },

        /**
         * 向父页面传值
         */
        requstFather: function (paths) {

            var last_div = $(".goods_xc:last").prop("outerHTML");

            for (var j in paths) {
                if (typeof paths[j] === 'undefined') {
                    paths.splice(j, 1)
                }
            }
            var temp = null;
            for (i = 0; i < paths.length; i++) {
                temp = paths[i];
                $(".goods_xc:eq(0)").before(last_div);	// 插入一个 新图片
                $(".goods_xc:eq(0)").find('a:eq(0)').attr('href', paths[i]).attr('onclick', '').attr('target', "_blank");// 修改他的链接地址
                $(".goods_xc:eq(0)").find('img').attr('src', paths[i]);// 修改他的图片路径
                $(".goods_xc:eq(0)").find('a:eq(1)').attr('onclick', "GoodsOption.ClearPicArr2(this,'" + paths[i] + "')").text('删除');
                $(".goods_xc:eq(0)").find('input').val(paths[i]); // 设置隐藏域 要提交的值
            }

            EventAddListener.listen('listenPic', temp);
        },

        /**
         * 选择促销
         */
        selectGoods: function (url) {
            var goodsId = [];
            // 过滤选择重复商品
            $('input[name*="mail_area"]').each(function (i, o) {
                goodsId.push($(o).val());
            });
            return window.open(url, '请选择商品',
                "width=900, height=650, top=100, left=100");
        },
        /**
         * 计算字符串的相似度
         */
        compare: function (x, y) {
            var z = 0;
            var s = x.length + y.length;
            ;

            x.sort();
            y.sort();
            var a = x.shift();
            var b = y.shift();

            while (a !== undefined && b !== undefined) {
                if (a === b) {
                    z++;
                    a = x.shift();
                    b = y.shift();
                } else if (a < b) {
                    a = x.shift();
                } else if (a > b) {
                    b = y.shift();
                }
            }
            return z / s * 200;
        }
    }
    window.Tool = new newAlert();
    return window.Tool;
})(window);

