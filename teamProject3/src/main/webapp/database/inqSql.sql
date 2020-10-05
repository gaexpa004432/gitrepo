//테이블생성
create table inq (
inq_no number primary key,
member_id varchar2(100),
seller_code number,
inq_title varchar2(200),
inq_content varchar2(2000),
inq_regdate date,
inq_answer varchar2(2000));

//시퀀스생성
create sequence inq_no_seq
increment by 1
start with 1
nocycle
nocache;