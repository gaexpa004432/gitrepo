--한 판매자에게 걸려있는 주문보기
select o.order_number, o.order_date, o.order_total, o.member_id,
p.seller_code, o.order_status, o.order_reason, p.product_name,
d.product_price , d.product_quantity, r.recipe_number, r.recipe_name from order1 o, order_detail d, product p, recipe r
where o.order_number=d.order_number
and d.product_number=p.product_number
and p.recipe_number=r.recipe_number
and p.seller_code = 558881;



--한 회원의 한 주문 보기
select * from order1 o, order_detail d, product p, recipe r
where o.order_number=d.order_number
and d.product_number=p.product_number
and p.recipe_number=r.recipe_number
and o.member_id = 'qqq';


--판매자가 판매하고 있는 레시피에 대한 정보(가격의 합을 가지고 group by했더니 레시피별로 값을 가져 옴 )
select r.recipe_name, o.member_id, o.order_date, sum(d.product_price),  
o.order_status, o.order_reason, r.recipe_number, p.seller_code
from order1 o, order_detail d, product p, recipe r
where o.order_number=d.order_number
and d.product_number=p.product_number
and p.recipe_number=r.recipe_number
and p.seller_code = 558881
group by o.order_date, o.member_id,
p.seller_code, o.order_status, o.order_reason, r.recipe_number, r.recipe_name
order by order_date desc;
--잠깐 뺌 d.product_quantity, o.order_number, o.order_total, p.product_name

--sellList.jsp 페이징
select a.* from( select b.* , rownum rn    from(
												select r.recipe_name, o.member_id, o.order_date, sum(d.product_price), 
												o.order_status, o.order_reason, r.recipe_number, p.seller_code  
												from order1 o, order_detail d, product p, recipe r 
												where o.order_number=d.order_number  
												and d.product_number=p.product_number 
												and p.recipe_number=r.recipe_number  
												and p.seller_code = 558881 
												group by  r.recipe_name, o.member_id, o.order_date, o.order_number, 
												o.order_status, o.order_reason, r.recipe_number, p.seller_code
												order by order_date desc
) b )a where rn between 1 and 10;


--한 판매자에게 주문 들어온 모든 건수
select count(*) from( 
					select r.recipe_name, o.member_id, o.order_date, sum(d.product_price), 
					o.order_status, o.order_reason, r.recipe_number, p.seller_code 
					from order1 o, order_detail d, product p, recipe r 
					where o.order_number=d.order_number   
					and d.product_number=p.product_number 
					and p.recipe_number=r.recipe_number   
					and p.seller_code = 558881 
					group by  r.recipe_name, o.member_id, o.order_date, o.order_number, 
					o.order_status, o.order_reason, r.recipe_number, p.seller_code 
					order by order_date desc)
where order_status = '대기';
