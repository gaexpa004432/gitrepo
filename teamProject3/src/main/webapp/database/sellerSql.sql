create table seller (
	seller_code number primary key,
	seller_address varchar2(100),
	seller_store varchar2(100),
	seller_tel varchar2(100)
);

alter table seller add (seller_postcode varchar2(100));

alter table seller add (seller_detailAddress varchar2(100));

alter table seller add (seller_extraAddress varchar2(100));

alter table seller rename column seller_address to seller_roadAddress;
