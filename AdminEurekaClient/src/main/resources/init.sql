

select  * from firsttype
select  * from secondtype
select  * from thirdtype




insert into firsttype (firsttype_name) values('家用电器'); 
insert into firsttype (firsttype_name) values('手机数码'); 
insert into firsttype (firsttype_name) values('电脑办公'); 
insert into firsttype (firsttype_name) values('家具厨具'); 
insert into firsttype (firsttype_name) values('女装男装'); 
insert into firsttype (firsttype_name) values('美妆个护'); 
insert into firsttype (firsttype_name) values('女鞋箱包'); 
insert into firsttype (firsttype_name) values('汽车用品'); 
insert into firsttype (firsttype_name) values('母婴玩具'); 
insert into firsttype (firsttype_name) values('食品酒类'); 
insert into firsttype (firsttype_name) values('图书音像'); 
	
insert into secondtype(secondtype_name,firsttype_id)values('电视',1);
insert into secondtype(secondtype_name,firsttype_id)values('空调',1);
insert into secondtype(secondtype_name,firsttype_id)values('洗衣机',1);
insert into secondtype(secondtype_name,firsttype_id)values('冰箱',1);
insert into secondtype(secondtype_name,firsttype_id)values('厨卫大电',1);
insert into secondtype(secondtype_name,firsttype_id)values('厨房小电',1);
insert into secondtype(secondtype_name,firsttype_id)values('生活电器',1);
insert into secondtype(secondtype_name,firsttype_id)values('个护健康',1);

insert into thirdtype(thirdtype_name,secondtype_id)values('超薄电视',1);
insert into thirdtype(thirdtype_name,secondtype_id)values('HDR电视',1);
insert into thirdtype(thirdtype_name,secondtype_id)values('壁挂式空调',2);
insert into thirdtype(thirdtype_name,secondtype_id)values('柜式空调',2);
insert into thirdtype(thirdtype_name,secondtype_id)values('滚筒洗衣机',3);
insert into thirdtype(thirdtype_name,secondtype_id)values('迷你洗衣机',3);
insert into thirdtype(thirdtype_name,secondtype_id)values('多门冰箱',4);
insert into thirdtype(thirdtype_name,secondtype_id)values('对开门冰箱',4);
insert into thirdtype(thirdtype_name,secondtype_id)values('油烟机',5);
insert into thirdtype(thirdtype_name,secondtype_id)values('燃气灶',5);
insert into thirdtype(thirdtype_name,secondtype_id)values('电饭煲',6);
insert into thirdtype(thirdtype_name,secondtype_id)values('微波炉',6);
insert into thirdtype(thirdtype_name,secondtype_id)values('电风扇',7);
insert into thirdtype(thirdtype_name,secondtype_id)values('净化器',7);
insert into thirdtype(thirdtype_name,secondtype_id)values('美容器',8);
insert into thirdtype(thirdtype_name,secondtype_id)values('剃须刀',8);

select * from goods ;

--根据一级表id查找所有所有对应的二级表列表-----
select
		b.firsttype_id,b.firsttype_name,a.secondtype_id,secondtype_name
		from
		firsttype b left join secondType a
		 on a.firsttype_id = b.firsttype_id
		where
		b.firsttype_id = 1

--根据er级表id查找所有所有对应的3级表列表-----
select a.secondtype_id
		,a.secondtype_name,b.thirdtype_id,b.thirdtype_name
		from SecondType a
		left join thirdtype b
		on a.secondtype_id = b.secondtype_id
		where
		a.secondtype_id =7
		
select a.goods_id,a.goods_name,a.goods_desc,
       a.goods_pubtime,a.goods_isnew,a.goods_sale ,
       a.thirdtype_id , b.goodsdetail_id,b.goodsdetail_price,
       b.goods_count from goods a  
       left join goodsdetail b 
       on a.goods_id = b.goods_id 


insert into goods(
		goods_name, goods_desc, goods_pubtime,
		goods_isnew,
		goods_sale,
		thirdtype_id)
		values( 'a', 	'a', 	now(), 1, 0, 	2)

		select * from goods
		
		
select a.goods_id,a.goods_name,a.goods_desc,
a.goods_pubtime,a.goods_isnew ,a.goods_sale,a.thirdtype_id,
b.goodsdetail_price,b.goods_count
from goods a left join goodsdetail b
  on a.goods_id = b.goods_id  
  
  
insert into  goodsdetail(goodsdetail_id,goodsdetail_price,goods_count,goods_id) values(129536,4560.0,100,1);

select * from goodsdetail where goodsdetail_id = 6


-------attribute---------------------------------------------------------
insert into  attribute(attribute_name,pid,secondtype_id) values('颜色',0,1);
insert into  attribute(attribute_name,pid,secondtype_id) values('套餐类型',0,1);

insert into  attribute(attribute_name,pid,secondtype_id) values('黑色',1,1);
insert into  attribute(attribute_name,pid,secondtype_id) values('深空灰',1,1);
insert into  attribute(attribute_name,pid,secondtype_id) values('官方标配',2,1);
insert into  attribute(attribute_name,pid,secondtype_id) values('银色',1,1);
-- 空调
insert into  attribute(attribute_name,pid,secondtype_id) values('面板颜色',0,0);
insert into  attribute(attribute_name,pid,secondtype_id) values('琉璃金',13,2);

insert into  attribute(attribute_name,pid,secondtype_id) values('空调版本',0,0);
insert into  attribute(attribute_name,pid,secondtype_id) values('阿里小智，	冷暖电铺，大一匹',15,2);
insert into  attribute(attribute_name,pid,secondtype_id) values('阿里小智，	冷暖电铺，大一匹 二级',15,2);
insert into  attribute(attribute_name,pid,secondtype_id) values('阿里小智，	冷暖电铺， 一匹，三级',15,2);
insert into  attribute(attribute_name,pid,secondtype_id) values('阿里小智，	冷暖电铺，大一匹，二级',15,2);
select  * from attribute where secondtype_id =2

delete from attribute where secondtype_id =2

---------商品属性关系表------------------------------------------------------

insert into contact(attribute_id,goodsdetail_id)  values(3,2);
insert into contact(attribute_id,goodsdetail_id)  values(4,2);
insert into contact(attribute_id,goodsdetail_id)  values(6,2);
insert into contact(attribute_id,goodsdetail_id)  values(5,2);
select * from contact

update contact set attribute_id = 3 where goodsdetail_id
		=7 and contact_id = 13

delete from contact


 select a.attribute_id,a.attribute_name,b.attribute_id as
		attrvalue_id,b.attribute_name as
		attrvalue_value from attribute a
		join
		attribute b
		on a.attribute_id =
		b.pid
		where b.pid = 1

select a.attribute_id,a.attribute_name,b.attribute_id as
		attrvalue_id,
		b.attribute_name as
		attrvalue_value from attribute a join
		attribute b
		on a.attribute_id =
		b.pid where a.secondtype_id
		=#{secondtype_id}
		
		select  attribute_id as
		attrvalue_id, attribute_name as
		attrvalue_value from attribute where  pid = 1




select * from goods   left join goodsDetail   on goods.goods_id=goodsdetail.goods_id   
left join contact   on contact.goodsdetail_id=goodsDetail.goodsdetail_id  
left join attribute   on attribute.attribute_id=contact.attribute_id       
WHERE  goods_id = 2                order by goods_sale         
desc                        limit 0 , 2


 select * from goods
		left join goodsDetail 
		on goods.goods_id=goodsdetail.goods_id  
		left join contact
		on contact.goodsdetail_id=goodsDetail.goodsdetail_id
		left join attribute
		on attribute.attribute_id=contact.attribute_id    where goods.goods_id =1

		
		select * ,group_concat(attribute.attribute_name) as attribute_name ,
		group_concat(contact.contact_id) as contactStr from  goodsDetail
		left join contact
		on contact.goodsdetail_id=goodsDetail.goodsdetail_id
		left join attribute
		on attribute.attribute_id=contact.attribute_id 
		left join image 
		on image.goodsdetail_id =goodsDetail.goodsdetail_id
		where goodsDetail.goods_id =1 
		group by goodsDetail.goodsdetail_id
		
		select * from image
		
		
		select *  from goodsdetail where goodsdetail_id = 6
		
		select * from image where image_id = 
 update image set
		image_path='1.png' where goodsdetail_id
		=17


select * from image where goodsdetail_id =17


insert into users(user_name,user_pwd,user_sex,user_tel,user_email,
	user_idcard,user_level,user_head)
	values ('a','a','男','123456','234@qq.com','1114225','1',null);
insert into goods(goods_name,goods_desc,goods_pubtime,goods_isnew,goods_sale,thirdtype_id)
		values('海信平板电视','高清超薄',now(),1,1,1)
insert into goodsdetail (goodsdetail_price,goods_count,goods_id)
		values(2998,99,1)
insert into orders(order_id,to_userName,to_addr,to_tel,order_time,order_status,order_totalmoney,
	user_id)
	values('222','zs','湖工','12345',now(),1,2998,1);
insert into orderdetail(goods_count,goods_buyprice,goodsdetail_id,Order_id)
	values(1,2998,21,222)
insert into cartdetail(goods_count,goods_money,cartdetail_status,goodsdetail_id,cart_id) 
		values(1,2998,0 ,21,1)
insert into cartdetail(goods_count,goods_money,cartdetail_status,goodsdetail_id,cart_id) 
		values(1,2998,0,1,1)
 
		insert into review(review_level,review_content,review_image,review_date,orderdetail_id,user_id)
	 values (5,'还行','1.jpeg',now(),1,1);


delete from goods ;



