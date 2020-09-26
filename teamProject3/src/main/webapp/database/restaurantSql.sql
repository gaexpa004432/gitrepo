create table res(
res_no number primary key,
res_name varchar2(50),
res_content varchar2(1000),
res_date date,
res_tel varchar2(30),
res_si varchar2(100),
res_gu varchar2(100),
res_time varchar2(200),
res_extra varchar2(800)
);

create sequence res_seq
increment by 1
start with 1;  

create table res_pic(
res_pic_no number primary key,
res_pic_name varchar2(300),
res_no number
);

create sequence res_pic_seq
increment by 1
start with 1;

create res_review(
res_review_no number primary key,
res_review_content varchar2(500),
member_id varchar2(100),
res_no number,
res_review_date date
);

create res_review_img(
res_review_img_no number primary key,
res_review_no varchar2(500),
res_review_image varchar2(300)
);

create sequence res_review_seq
increment by 1
start with 1;

create sequence res_review_pic_seq
increment by 1
start with 1;


create table board (board_no number(15) primary key, member_id varchar2(20),
member_name varchar2(20), board_sub varchar2(100), board_content varchar2(100),
board_date date default sysdate, board_file varchar2(200), board_groupcode varchar2(50));
