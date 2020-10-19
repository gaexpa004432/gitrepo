package model;

import lombok.Data;

@Data
public class MemberFavoriteVO {
	//즐찾 식당
	private int res_no;
	private String res_name;
	private String res_content;
	private int res_pic_no;
	private String member_id;
	private String favorite_code;
	private String res_pic_name;
	
	
	//즐찾 레시피
	private int recipe_number;
	private String recipe_name;
	private String recipe_content;
	private String main_img;
	private String recipe_date;
	
	//paging 처리
	private Integer first;
	private Integer last;
	
}