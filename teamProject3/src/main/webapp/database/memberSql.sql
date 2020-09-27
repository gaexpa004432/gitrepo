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