package model;

import lombok.Data;

@Data
public class MemberVO {
	
	//member basic info
	private String member_id;
	private	String member_name;
	private String member_tel;
	private String member_roadAddress;
	private String member_pass;
	private String member_gender;
	private String member_birth;
	private String member_type;
	private int member_mileage;
	private int seller_code;
	private String member_postcode;
	private String member_detailAddress;
	private String member_extraAddress;
	private String member_email;
	private String member_image;
	
	//member add info
	private String seller_roadAddress;
	private String seller_store;
	private String seller_tel;
	private String seller_postcode;
	private String seller_detailAddress;
	private String seller_extraAddress;
	
	
	
}
