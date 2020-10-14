package model;

import lombok.Data;

@Data
public class SellVO {
	private int order_number;
	private String order_date;
	private int order_total;
	private String member_id;
	private int seller_code;
	private String order_status;
	private String order_reason;
	private int product_price;
	private int product_quantity;
	private String product_name;
	private int recipe_number;
	private String recipe_name;
	private int order_detail_number;
	private int product_number;
	private String product_unit;
	private String member_postcode;
	private String member_roadAddress;
	private String member_detailAddress;
	private String member_extraAddress;
	
	
	//페이징처리를 위한
	private Integer first;
	private Integer last;
}
