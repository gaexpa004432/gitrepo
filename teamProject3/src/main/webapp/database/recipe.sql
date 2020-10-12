create table recipe_review(
recipe_review_no number primary key,
recipe_review_content varchar2(1000),
recipe_review_file varchar2(300),
recipe_review_date date,
member_id varchar2(100),
recipe_number number
);
create sequence recipe_review_seq
INCREMENT by 1
start with 1;
drop sequence recipe_reciew_seq;