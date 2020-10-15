package model;

import lombok.Data;

@Data
public class orderVO {
	
	//orderList
	int order_number;
	String order_date;
	String order_total;
	String member_id;
	String seller_code;
	String order_status;
	String order_reason;

	// detail
	int order_detail_number;
	int product_detail;
	int order_detail;
	int order_detail_no;

	// product
	int product_number;
	String product_name;
	Integer product_price;
	String product_unit;
	String product_status;
	String product_img;
	
	//member
	String member_pw;
	String member_name;
	String member_tel;
	String member_email;
	String member_address;
	
	//mileage
	Integer mileage_no;
	String mileage_contents;
	String mileage_date;
	Integer mileage_cost;
	String group_code;
	Integer remaining;
	
	//recipe
	int recipe_number;
	String recipe_name;
	String recipe_date;
	String recipe_content;
	String cooking_time;
	String cooking_level;
	Integer first;
	Integer last; 
	String main_img;
	
	//address 
	String member_postcode;
	String member_roadAddress;
	String member_detailAddress;
	String member_extraAddress;
	
	
	//default 생성자
	public orderVO() {
		
	}
}