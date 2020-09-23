package model;

import lombok.Data;

@Data
public class RecipeVO {
	private int recipe_number; 
	private String recipe_name;
	private String recipe_date;
	private String recipe_content;
	private String member_id;
}
