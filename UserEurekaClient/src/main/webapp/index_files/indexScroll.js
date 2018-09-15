var flag = true;//请求的标志,false 不请求
var page = 1;//分页,楼层
// var str = '<div class="home-section%F% home-section" >' + '<div class="floor-main-top clearfix">' + '<em class="fl">%F%F</em>' + '<h2 class="fl">' + '<b><a href="%big.url%" style="color:black;">%big.class_name%</a></b>' + '</h2>' + '</div>' + '<div class="floor-main w clearfix">' + '<ul class="saleZone-fl fl">' + '<li class="saleInfo">' + '<a href="%classUrl%"><img class="lazy" data-original="lazyUrl" src="%big.class_pic_url%" height="296" width="196"></a>' + '</li>' + '<li class="saleNav clearfix">' + '<h4 class="fl">推荐</h4>' + '%brandList%' + '</li>' + '</ul>' + '<div class="saleZone-fr fl">' + '<div class="content-main clearfix">' + '<div class="fl">' + '<dl class="clearfix con fl active">' + '<dd class="fl">' + '%goodsLeft%' + '</dd>' + '<dt class="fl">' + '<a href="广告链接"><img class="lazy" data-original="" src=' + IMG + '/load5.jpg alt=""></a>' + '</dt>' + '%goodsList%' + '</dl>' + '</div>' + '</div>' + '</div>' + '</div>' + '</div>';
var str = '<div class="home-section%F% home-section" >' +
    '<div class="floor-main-top clearfix">' +
    '<em class="fl">%F%F</em>' +
    '<h2 class="fl">' +
    '<b><a href="%big.url%" style="color:black;">%big.class_name%</a></b>' +
    '</h2>' +
    '</div>' +
    '<div class="floor-main w clearfix">' +
    '<ul class="saleZone-fl fl">' +
    '<li class="saleInfo">' +
    '<a href="%classUrl%"><img class="lazy" data-original="lazyUrl" src="%big.class_pic_url%" height="296" width="196"></a>' +
    '</li>' +
    '<li class="saleNav clearfix">' +
    '<h4 class="fl">推荐</h4>' +
    '%brandList%' +
    '</li>' +
    '</ul>' +
    '<div class="saleZone-fr fl">' +
    '<div class="content-main clearfix">' +
    '<div class="fl">' +
    '<dl class="clearfix con fl active">' +
    '<dd class="fl">' +
    '%goodsLeft%' +
    '</dd>' +
    '<dt class="fl">' +
    '<a href="%AdBigLink%"><img class="lazy" data-original="" src="%AdBigUrl%" alt=""></a>' +
    '</dt>' +
    '%goodsList%' +
    '</dl>' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</div>';
$(window).scroll(function () {
    var winHeight = $(window).height();//浏览器窗口高度 固定
    var docHeight = $(document).height();//文档高度

    //当滚轴到文档尾部的时候请求
    if (docHeight <= winHeight + $(window).scrollTop() + $('.public-footer').height() + 1200 && flag) {
        flag = false;

        // layer.load();
        $('#goods_class').after('<div id="loading">正在加载...</div>');

        $.post(newGoodsClassUrl, {page: page}, function (res) {

            if (res.status === 1) {


                var num = $('.home-section').length;//楼层
                var classUrl = ProductListUrl.replace('.html', '?cid=' + res.data.id + '.html');//分类链接
                var brandList = '';//品牌列表

                $.each(res.data.brand, function (i, j) {
                    brandList += '<a href=' + BrandListUrl.replace('.html', '?brand=' + j.id + '.html') + ' class="fl">' + j.brand_name + '</a>'
                });//拼接品牌
                goodsLeft = res.data.goods[0];//拼接 左边第一个商品
                goodsLeftList = '<a href=' + goodsDetailsUrl.replace('.html', '/id/' + goodsLeft.id + '.html') + '>' +
                    '<div class="img-parent-warp">' +
                    '<img class="lazy" data-original="" src=' + goodsLeft.pic_url + ' alt="">' +
                    '</div>' +
                    '<p>' + goodsLeft.title + '</p>' +
                    '<span>￥' + goodsLeft.price_member + '</span>' +
                    '</a>';
                var goodsList = '';
                for (var i = 1; i < res.data.goods.length; i++) {
                    goodsList += '<dd class="fl"><a href=' + goodsDetailsUrl.replace('.html', '/id/' + res.data.goods[i].id + '.html') + '>' +
                        '<div class="img-parent-warp">' +
                        '<img class="lazy" data-original="" src=' + res.data.goods[i].pic_url + ' alt="">' +
                        '</div>' +
                        '<p>' + res.data.goods[i].title + '</p>' +
                        '<span>￥' + res.data.goods[i].price_member + '</span>' +
                        '</a></dd>';
                }
                var strAd = '';
                if( res.data.Ad.b.pic_url !== '#'){
                    strAd = '<div class="advertisement1">' +
                        '<a href='+res.data.Ad.b.ad_link+'>' +
                        '<img class="lazy" data-original="" src='+res.data.Ad.b.pic_url+' alt="" height="110">' +
                        '</a>' +
                        '</div>';
                }

                // str2 = str2.sprintf();
                str2 = str.replace(/%F%/g, num);//替换左上角 楼层
                str2 = str2.replace('%big.url%', classUrl);//替换分类 名称 链接
                str2 = str2.replace('%big.class_name%', res.data.class_name);//替换分类 名称 链接
                str2 = str2.replace('%classUrl%', classUrl);//替换分类 图片A标签链接 链接
                str2 = str2.replace('%big.class_pic_url%', res.data.pic_url);//替换分类 图片
                str2 = str2.replace('%brandList%', brandList);//替换品牌A标签
                str2 = str2.replace('%goodsLeft%', goodsLeftList);//左边的商品
                str2 = str2.replace('%goodsList%', goodsList);//其他的商品
                str2 = str2.replace('%AdBigLink%', res.data.Ad.m.ad_link);//中间大图的链接
                str2 = str2.replace('%AdBigUrl%', res.data.Ad.m.pic_url);//中间大图的地址
                if(strAd !== ''){
                    str2 += strAd;
                }
                $('#goods_class').append(str2);
                flag = true;
                page++;

                $('#loading').remove();

            }else{
                $('#loading').remove();
                $('#goods_class').after('<div id="loading">--我是有底线的--</div>');
            }
        }, 'json');


    }

});