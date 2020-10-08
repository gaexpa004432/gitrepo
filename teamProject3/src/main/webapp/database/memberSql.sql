create table member (
	member_id varchar2(100) primary key,
	member_name varchar2(100),
	member_address varchar2(100),
	member_pass varchar2(100),
	member_gender varchar2(100),
	member_birth varchar2(30),
	member_type varchar2(100),
	member_mileage number,
	seller_code number
);

alter table member add constraint seller_code_fk
foreign key (seller_code) references seller(seller_code);


alter table member rename column member_address to member_roadAddress;

alter table member add (member_email varchar2(50));

alter table member add (member_image varchar2(100));

alter table member add (member_postcode varchar2(100));

alter table member add (member_detailAddress varchar2(100));

alter table member add (member_extraAddress varchar2(100));


//멤버 즐겨찾기한 값 쿼리
select r.res_no, min(p.res_pic_no) as res_pic_no from res r, favorites f, res_pic p
where r.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='user'
group by r.res_no;


//즐찾한 식당
select s.res_no, s.res_name, s.res_content, f.favorite_code, p.RES_PIC_NAME, p.res_pic_no
from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and f.favorite_code='fs'
and member_id='qqq'
and p.res_pic_no in (select min(p.res_pic_no)
					 from res s, favorites f, res_pic p
					 where s.res_no = f.favorite_no
					 and f.favorite_no = p.res_no
					 and member_id='qqq'
					 group by s.res_no);

//즐찾한 레시피
select * from recipe r, favorites f
where r.recipe_number = f.favorite_no
and f.member_id='qqq'
and f.favorite_code='fr';--qqq가 즐찾한 레시피

//더미데이터
insert into favorites values( 'fr',  12, 'qqq' );
insert into recipe values (12, '짜파게티', sysdate, '오늘은 내가 짜파게티요리사', 'user5', '50분이내', '2중', '우주하마.jpg');
commit;
