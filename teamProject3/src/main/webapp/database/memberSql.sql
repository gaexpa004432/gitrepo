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







select * from tab;
select * from seller;
select * from member;
select * from inq;
select * from favorites;
select * from res;
desc seller;

select * from recipe;

select * from product;

select * from order_detail;

select * from order1;

alter table seller add (seller_postcode varchar2(100));

alter table seller add (seller_detailAddress varchar2(100));

alter table seller add (seller_extraAddress varchar2(100));

alter table seller rename column seller_address to seller_roadAddress;

select * from member m join seller s on( m.seller_code=s.seller_code ) where m.member_id = user5;

desc member;

create table inq (
inq_no number primary key,
member_id varchar2(100),
seller_code number,
inq_title varchar2(200),
inq_content varchar2(2000),
inq_regdate date,
inq_answer varchar2(2000));

create sequence inq_no_seq
increment by 1
start with 1
nocycle
nocache;

drop table inq purge;

select * from inq
where member_id = 'fff'
order by inq_regdate desc;


update inq set seller_code = 558881 where inq_no=4;

commit;

select * from inq i, seller s, member m
where i.seller_code = s.seller_code
and s.seller_code = m.seller_code
and member_id = 'fff';


select * from inq i join seller s
on i.seller_code = s.seller_code
join member m
on s.seller_code = m.seller_code
where member_id = 'fff';


SELECT i.inq_no, i.member_id, i.inq_title, i.inq_content, i.inq_regdate, i.inq_answer, i.seller_code, m.member_id
 FROM inq i, member m
		where i.seller_code=m.seller_code
				and i.member_id = 'fff'
					ORDER BY inq_regdate desc;
          
select * from tab;
select * from favorites;
select * from member;
select * from res;
select * from recipe;
select * from res_pic;

select * from res r, favorites f
where r.res_no = f.favorite_no
and member_id='qqq';

select s.res_no, s.res_name, s.res_content, min(p.res_pic_no) as res_pic_no
from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='qqq'
group by s.res_no, s.res_name, s.res_content;
order by res_no;

select s.res_no, s.res_name, f.favorite_code, s.res_content, p.RES_PIC_NAME, p.res_pic_no
from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='qqq'
and f.favorite_code='fs'
and p.res_pic_no in (
select min(p.res_pic_no)
from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='qqq'
group by s.res_no)
order by s.res_no;

select min(p.res_pic_no)
from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='qqq'
group by s.res_no, s.res_name, s.res_content;

desc res;
desc res_pic;


select * from res r, favorites f, res_pic p
where r.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='qqq';

select p.res_no, min(p.res_pic_no) from favorites f, res_pic p
where f.favorite_no = p.res_no
and member_id='qqq'
group by res_no;

select min(res_pic_no) from res_pic where res_no in (14, 15) group by res_no;

insert into favorites values( 'fr',  12, 'qqq' );
commit;

select * from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and f.member_id='qqq'
and f.favorite_code='fs';

select r.recipe_number, r.recipe_name, r.recipe_content, r.main_img, f.favorite_code 
from recipe r, favorites f
where r.recipe_number = f.favorite_no
and f.member_id='qqq'
and f.favorite_code='fr';--qqq가 즐찾한 레시피

select s.res_no, s.res_name, s.res_content, f.favorite_code, min(p.res_pic_no) as res_pic_no, p.res_pic_name
from res s, favorites f, res_pic p
where s.res_no = f.favorite_no
and f.favorite_no = p.res_no
and member_id='qqq'
and f.favorite_code='fs'
group by s.res_no, s.res_name, s.res_content, f.favorite_code, p.res_pic_name
order by s.res_no;--qqq가 즐찾한 식당



select * 
from recipe r, favorites f, res s
where s.res_no = f.favorite_no
and f.favorite_no = r.recipe_number;

desc recipe;
desc res;

insert into recipe values (12, '짜파게티', sysdate, '오늘은 내가 짜파게티요리사', 'user5', '50분이내', '2중', '우주하마.jpg');
commit;

--qqq가 즐찾한 식당(페이징)
select a.* from( select b.* , rownum rn    from(
				select s.res_no, s.res_name, f.favorite_code, s.res_content, p.RES_PIC_NAME, p.res_pic_no
        from res s, favorites f, res_pic p
        where s.res_no = f.favorite_no
        and f.favorite_no = p.res_no
        and member_id='qqq'
        and f.favorite_code='fs'
        and p.res_pic_no in (
        select min(p.res_pic_no)
        from res s, favorites f, res_pic p
        where s.res_no = f.favorite_no
        and f.favorite_no = p.res_no
        and member_id='qqq'
        group by s.res_no)
        order by s.res_no
				) b )a where rn between 1 and 4;
        
--qqq가 즐찾한 식당, 레시피(카운트)        
select count(*) from (
        select s.res_no, s.res_name, f.favorite_code, s.res_content, p.RES_PIC_NAME, p.res_pic_no
        from res s, favorites f, res_pic p
        where s.res_no = f.favorite_no
        and f.favorite_no = p.res_no
        and member_id='qqq'
        and f.favorite_code='fs'
        and p.res_pic_no in (
        select min(p.res_pic_no)
        from res s, favorites f, res_pic p
        where s.res_no = f.favorite_no
        and f.favorite_no = p.res_no
        and member_id='qqq'
        group by s.res_no)
        order by s.res_no
        );
        
--qqq가 즐찾한 레시피(페이징)
select a.* from( select b.* , rownum rn    from(
select r.recipe_number, r.recipe_name, r.recipe_content, r.main_img, f.favorite_code 
from recipe r, favorites f
where r.recipe_number = f.favorite_no
and f.member_id='qqq'
and f.favorite_code='fr'
order by r.recipe_number
) b )a where rn between 1 and 4;

insert into recipe values (12, '짜파게티', sysdate, '오늘은 내가 짜파게티요리사', 'user5', '50분이내', '2중', '우주하마.jpg');
insert into favorites values( 'fr',  12, 'qqq' );
insert into recipe values (2, '비빔면', sysdate, '오늘은 내가 비빔면요리사', 'user5', '20qns', '하', '우주하마.jpg');
insert into favorites values( 'fr',  2, 'qqq' );
insert into recipe values (5, '파스타', sysdate, '여기봉골레하나', 'user5', '24시간', '상', '우주하마.jpg');
insert into favorites values( 'fr',  5, 'qqq' );
insert into recipe values (17, '떡볶이', sysdate, '떡볶이엔 김밥, 순대, 튀김', 'user5', '10분', '중상마마', '우주하마.jpg');
insert into favorites values( 'fr',  17, 'qqq' );
insert into recipe values (20, '국밥', sysdate, '국밥부장관', 'user5', '30분', '상', '우주하마.jpg');
insert into favorites values( 'fr',  20, 'qqq' );
commit;
commit;

select * from favorites;
select * from recipe;

--qqq가 즐찾한 레시피(카운트) 
