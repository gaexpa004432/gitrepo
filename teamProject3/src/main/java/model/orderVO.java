package model;

import java.util.List;

import lombok.Data;

@Data
public class orderVO {
	
	//orderList
	String order_number;
	String order_date;
	String order_total;
	String member_id;
	String seller_code;
	String order_status;
	String order_reason;

	// product
	String product_number;
	String product_name;
	String product_price;
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
	String recipe_number;
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
	
	//Detail
	String PRODUCT_NUMBER;
	String PRODUCT_PRICE;
	String product_quantity;
		
	//default 생성자
	public orderVO() {
		
	}
}