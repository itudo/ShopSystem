insert into goodstype (type_name) values('家电'); 
insert into goodstype (type_name) values('数码'); 
insert into goodstype (type_name) values('手机');

insert into goodstype (type_name) values('男装'); 
insert into goodstype (type_name) values('女装'); 
insert into goodstype (type_name) values('内衣');

insert into goodstype (type_name) values('鞋靴'); 
insert into goodstype (type_name) values('箱包'); 
insert into goodstype (type_name) values('配件');

insert into goodstype (type_name) values('美妆'); 
insert into goodstype (type_name) values('洗护'); 
insert into goodstype (type_name) values('保健品');

insert into goodstype (type_name) values('家具'); 
insert into goodstype (type_name) values('家饰'); 
insert into goodstype (type_name) values('家纺');
	
insert into goodstype (type_name) values('运动'); 
insert into goodstype (type_name) values('户外'); 
insert into goodstype (type_name) values('乐器');

insert into goodstype (type_name) values('美食'); 
insert into goodstype (type_name) values('生鲜'); 
insert into goodstype (type_name) values('零食');

insert into goodstype (type_name) values('百货'); 
insert into goodstype (type_name) values('餐具'); 
insert into goodstype (type_name) values('家庭保健');

 
select * from goodstype;
select * from category;
insert into category(category_name,pid,type_id) values('家电/数码/手机',0,0);
insert into category(category_name,pid,type_id) values('男装/女装/内衣',0,0);
insert into category(category_name,pid,type_id) values('鞋靴/箱包/配件',0,0);
insert into category(category_name,pid,type_id) values('美妆/洗护/保健品',0,0);
insert into category(category_name,pid,type_id) values('家具/家饰/家纺',0,0);
insert into category(category_name,pid,type_id) values('运动/户外/乐器',0,0);
insert into category(category_name,pid,type_id) values('美食/生鲜/零食',0,0);
insert into category(category_name,pid,type_id) values('百货/餐具/家庭保健',0,0);

insert into category(category_name,pid,type_id) values('吸尘器',1,1);
insert into category(category_name,pid,type_id) values('数码相机',1,2);
insert into category(category_name,pid,type_id) values('小米note3',1,3);
insert into category(category_name,pid,type_id) values('西装',2,4);
insert into category(category_name,pid,type_id) values('连衣裙',2,5);
insert into category(category_name,pid,type_id) values('棉袜',2,6);
insert into category(category_name,pid,type_id) values('小皮鞋',3,7);
insert into category(category_name,pid,type_id) values('单肩包',3,8);
insert into category(category_name,pid,type_id) values('帽子',3,9);
insert into category(category_name,pid,type_id) values('面膜',4,10);
insert into category(category_name,pid,type_id) values('洗发水',4,11);
insert into category(category_name,pid,type_id) values('胶原蛋白',4,12);
insert into category(category_name,pid,type_id) values('沙发',5,13);
insert into category(category_name,pid,type_id) values('窗帘',5,14);
insert into category(category_name,pid,type_id) values('四件套',5,15);
insert into category(category_name,pid,type_id) values('足球',6,16);
insert into category(category_name,pid,type_id) values('山地车',6,17);
insert into category(category_name,pid,type_id) values('尤克里里',6,18);
insert into category(category_name,pid,type_id) values('牛奶',7,19);
insert into category(category_name,pid,type_id) values('荔枝',7,20);
insert into category(category_name,pid,type_id) values('牛肉干',7,21);
insert into category(category_name,pid,type_id) values('棉拖',8,22);
insert into category(category_name,pid,type_id) values('保温杯',8,23);
insert into category(category_name,pid,type_id) values('创可贴',8,24);