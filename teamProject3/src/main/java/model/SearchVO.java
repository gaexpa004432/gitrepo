package model;

import lombok.Data;

@Data
public class SearchVO {
	private int res_no;
	private String res_name;
	private String res_content;
	private String res_date;
	private int recipe_number;
	private String recipe_name;
	private String recipe_content;
	private String recipe_date;
	private String member_id;
	private String product_name;
	private String res_address;
	private String res_si;
	private String res_gu;
}
