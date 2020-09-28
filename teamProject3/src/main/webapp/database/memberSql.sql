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
