create database shopSystem ;
--1.用户表users
create table users(
	user_id  int primary key auto_increment,   
	user_name varchar(100),
	user_pwd varchar(100),
	user_tel varchar(100),
	user_email varchar(100),
	user_addr varchar(100),
	user_idcard varchar(100),
	user_account double,
	user_level varchar(100)
)
select * from users
--2.商品类型表type （2级表）
create table goodstype(
	type_id int primary key auto_increment,
	type_name varchar(100)
 )
 
--3.商品分类表 category（1.3级表）
create table category(
	category_id int primary key auto_increment,
	category_name varchar(100),
	pid int,
	type_id int
 )

--4.商品表goods
drop table goods
create table goods(
	goods_id int primary key auto_increment,
	goods_name varchar(100),
	goods_price double,
	goods_detail varchar(200),
	goods_pubtime date,
	goods_isnew int,
	goods_count int,
	goods_sale int,
	category_id int,
	type_id int
)

--5.图片表image
drop table image
create table image(
	image_id  int primary key auto_increment,
	image_path varchar(100),
	goods_id int
)

--6.评论表review
create table review(
	review_id int primary key auto_increment,
	review_level int,
	review_content varchar(500),
	review_image varchar(100),
	user_id int,
	goods_id int
)


--7.商品属性表attribute
create table attribute(
	attribute_id int primary key auto_increment,
	attribute_name varchar(100),
	type_id int
)
--商品&属性值关系表
create table connectgoodsAndAttr(
   connect_id int primary key auto_increment,
   goods_id int,
   attrvalue_id int
)

--8.商品属性值表attrvalue
create table attrvalue(
	attrvalue_id int primary key auto_increment,
	attrvalue_value varchar(100),
	attribute_id int 
	 
)
--9.购物车表cart
drop table cart
create table cart(
	cart_id int primary key auto_increment,
	user_id int
)
select * from cart
--10.购物车详情表cartdetail
drop table cartdetail
create table cartdetail(
   cartdetail_id int primary key auto_increment,
   goods_count int,
   goods_money double,
   goods_id int,
   cart_id int
)

--11.订单表order  订单号  下单用户  收货人  收货地址  联系电话  创建时间  下单状态
create table orders(
 	order_id varchar(50),
 	to_userName  varchar(100),
 	to_addr varchar(500),
 	to_tel varchar(100),
	order_time date,
	order_state int,
 	order_totalmoney double,
	user_id int
)
--12.订单详情表detail   
create table detail(
	detail_id int primary key auto_increment,
	goods_count int,
	goods_smallmoney double,
	goods_id int,
	Order_id varchar(50)
)


--13.商品收藏表collect
create table collect(
	Collect_id int primary key auto_increment,
	User_id int,
	Goods_id int
)
--14.用户搜索历史history
create table history(
	History_id int primary key auto_increment,
	History_name varchar(500),
	User_id int
)
--15.热卖表hot
create table hot(
	Hot_id int primary key auto_increment,
	Goods_id int
)

create table Address(
   address_id int primary key auto_increment,
   address_name varchar(1000),
   address_code varchar(100),
   address_status int,
   user_id int
)


