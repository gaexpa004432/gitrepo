create table board (board_no number(15) primary key, member_id varchar2(20),
member_name varchar2(20), board_sub varchar2(100), board_content varchar2(100),
board_date date default sysdate, board_file varchar2(200), board_groupcode varchar2(50));
