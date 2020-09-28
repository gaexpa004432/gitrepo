package model;

import lombok.Data;

//@Data
public class RecipeVO {
	private int recipe_number; 
	private String recipe_name;
	private String recipe_date;
	private String recipe_content;
	private String member_id;
	private String product_insert_content;
	private String new_prod;
	
	
	
	public RecipeVO(int recipe_number, String recipe_name, String recipe_date, String recipe_content, String member_id,
			String product_insert_content, String new_prod) {
		super();
		this.recipe_number = recipe_number;
		this.recipe_name = recipe_name;
		this.recipe_date = recipe_date;
		this.recipe_content = recipe_content;
		this.member_id = member_id;
		this.product_insert_content = product_insert_content;
		this.new_prod = new_prod;
	}

	@Override
	public String toString() {
		return "RecipeVO [recipe_number=" + recipe_number + ", recipe_name=" + recipe_name + ", recipe_date="
				+ recipe_date + ", recipe_content=" + recipe_content + ", member_id=" + member_id
				+ ", product_insert_content=" + product_insert_content + ", new_prod=" + new_prod + "]";
	}

	public String getProduct_insert_content() {
		return product_insert_content;
	}

	public void setProduct_insert_content(String product_insert_content) {
		this.product_insert_content = product_insert_content;
	}

	public String getNew_prod() {
		return new_prod;
	}

	public void setNew_prod(String new_prod) {
		this.new_prod = new_prod;
	}

	public RecipeVO () {
		
	}
	
	public int getRecipe_number() {
		return recipe_number;
	}
	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_date() {
		return recipe_date;
	}
	public void setRecipe_date(String recipe_date) {
		this.recipe_date = recipe_date;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
