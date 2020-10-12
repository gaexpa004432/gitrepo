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
	
	//페이징처리를 위한
	private Integer first;
	private Integer last;
}
