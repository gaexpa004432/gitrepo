--product table에서

데이터타입 변경
1.테이블 복사
CREATE TABLE TMP_product AS
SELECT * FROM product;

select * from TMP_product;

2.원본테이블 비우기
truncate table product;

3.데이터타입 변경
alter table product modify (product_number number);
alter table product modify (product_price number);
alter table product modify (seller_code number);
alter table product modify (recipe_number number);

4.원본테이블 다시 채우기
insert into product select * from TMP_product;




insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '당근', 200, 30, 'N', 558881, 2);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '양파', 100, 30, 'N', 558881, 2);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '양배추', 500, 30, 'N', 558881, 2);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '상추', 50, 30, 'N', 558881, 12); 
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '깻잎', 70, 30, 'N', 558881, 12);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '마늘', 20, 30, 'N', 558881, 12);                     
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '고추', 1000, 30, 'N', 558881, 5);                     
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '브로콜리', 200, 30, 'N', 558881, 17);                    
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '아보카도', 1200, 30, 'N', 558881, 17);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '오이', 700, 30, 'N', 558881, 20);                     
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '가지', 2000, 30, 'N', 558881, 20);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '마', 5000, 30, 'N', 7777, 1001);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '금', 100000, 600, 'N', 7777, 1001);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '미역', 700, 30, 'N', 1992032, 1000);
insert into product (product_number, product_name,product_price, product_unit, product_status, seller_code, recipe_number) 
                     values(prod_no.NEXTVAL, '국', 60000, 30, 'N', 1992032, 1000);
commit;





--order_detail테이블에서
--주문1
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(1,67, 1, 200, 1);--당근 2
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(2,68, 1, 100, 1);--양파 2
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(3,69, 1, 500, 1);--양배추 2
--주문2
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(8,74, 2, 200, 1);--브로콜리 17
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(9,75, 2, 1200, 1);--아보카도 17
--주문3
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(12,78, 3, 5000, 1);--마 1001
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(13,79, 3, 100000, 1);--금 1001
--주문4
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(14,80, 4, 700, 1);--미역 1000
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(15,81, 4, 60000, 1);--국 1000
--주문 5
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(18,78, 5, 5000, 1);--마
insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
values(19,79, 5, 100000, 1);--금

--order_detail테이블에서 제거함(주문하나에 레시피 하나만 연결 되게 하기 위해)
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(4,70, 1, 50, 1);--상추 12
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(5,71, 1, 70, 1);--깻잎 12
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(6,72, 1, 20, 1);--마늘 12
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(7,73, 2, 1000, 1);--고추 5
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(10,76, 2, 700, 1);--오이 20
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(11,77, 2, 2000, 1);--가지 20
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(16, 80, 1, 700, 1);--미역 1000
--insert into order_detail(order_detail_number, product_number, order_number, product_price, product_quantity)
--values(17, 81, 1, 60000, 1);--국 1000




--order1테이블에서
insert into order1 (order_number, order_date, order_total, member_id, seller_code, order_status)
values (1, sysdate, 800, 'qqq', 558881, '대기');
insert into order1 (order_number, order_date, order_total, member_id, seller_code, order_status)
values (2, sysdate, 1400, 'vvv', 558881, '대기');
insert into order1 (order_number, order_date, order_total, member_id, seller_code, order_status)
values (3, sysdate, 105000, 'user2', 7777, '대기');
insert into order1 (order_number, order_date, order_total, member_id, seller_code, order_status)
values (4, sysdate, 60700, 'ub7913', 1992032, '대기');
--주문 5 (qqq->user6) 
insert into order1 (order_number, order_date, order_total, member_id, seller_code, order_status)
values (5, sysdate, 105000, 'qqq', 7777, '대기');
commit;


--recipe테이블에서
이미 더미 데이터가 있어서 따로 입력 하지 않음
레시피 번호 2,12,5,17,20
--일반 회원 레시피 추가
insert into recipe values (30, '김밤', sysdate, '김밥부장관', 'user2', '30분', '상', '우주하마.jpg');
insert into recipe values (101, '초밥', sysdate, '초밥부장관', 'ub7913', '30분', '상', '우주하마.jpg');
--판매자 회원 레시피 추가
insert into recipe values (1000, '미역국', sysdate, '미역줄기 같은 머리', 'user1', '30분', '상', '우주하마.jpg');
insert into recipe values (1001, '명태국', sysdate, '명태는 뼈가 있으면 먹기 힘들엉엉엉', 'user6', '30분', '상', '우주하마.jpg');
commit;














