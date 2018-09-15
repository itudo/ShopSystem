var gift = '<div class="con-parent each-div clearfix fl">' +
    '<a href="javascript:;" class="fl position-parent">' +
    '<input type="radio" checked class="gift_id_class"  name="gift_id" value="${value}">' +
    '<img width="50" height="50" src="${src}"> <span class="icon">赠品</span>' +
    '</a>' +
    '<div class="fl ition">' +
    '<a href="javascript:;">${title}</a>' +
    '</div>' +
    '</div>';


//window.onload = function () {
$(function () {


    InterAddress.getAreaList($('#parent'), AREA_LIST, $('#parent'));
    InterAddress.couponList('userConpon', COUPON);
    InterAddress.run = true;
    InterAddress.couponList('receive', RECEIVE);
    InterAddress.ajaxGetContent('invoiceHTML', INVOICE);

    var goods_id = {'type': 1};
    $('.goods_id').each(function (i) {
        goods_id[i] = this.value;
    })

    $.post(gift_url, goods_id, function (e) {

        $.each(e.data, function (i, f) {
            if (f != null) {
                $('.gift-pid-' + i + ' div a img').attr('src', f.pic_url);
                $('.gift-pid-' + i + ' div div a').html(f.title);
                $('.gift-pid-' + i).show();
            }
        })

    })


    //获取满赠数据
    var totle = {'type': '0', 'totleMoney': $('#total').html()};
    $.post(gift_url, totle, function (t) {



        var addObj = document.createElement('div');

        addObj.classList.add('payment', 'clearfix', 'append-div');

        var data = t.data;
        console.log(data);
        var str;
        var objHTML = document.getElementById('asd');
        for (var i in data) {
            addObj.innerHTML += gift;
        }

        var child = addObj.childNodes;
        for (var index=0; index <child.length; index++) {
            child[index].innerHTML = child[index].innerHTML.replace('${value}', data[index].id);
            child[index].innerHTML = child[index].innerHTML.replace('${src}', data[index].pic_url);
            child[index].innerHTML = child[index].innerHTML.replace('${title}', data[index].title);
        }
        objHTML.appendChild(addObj);

    })

    //$("input[name='gift_id']:eq(0)").attr('checked',true);

})


