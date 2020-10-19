package model;

import lombok.Data;

//@Data
public class RecipeVO {
	private int recipe_number;
	private String recipe_name;
	private String recipe_date;
	private String recipe_content;
	private String member_id;
	private String cooking_time;
	private String cooking_level;
	private String main_img;
	private Integer first;
	private Integer last;
	private String seller_code;
	private String member_image;
	
	
	public String getMember_image() {
		return member_image;
	}


	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}


	public String getSeller_code() {
		return seller_code;
	}


	public void setSeller_code(String seller_code) {
		this.seller_code = seller_code;
	}


	public Integer getFirst() {
		return first;
	}


	public void setFirst(Integer first) {
		this.first = first;
	}


	public Integer getLast() {
		return last;
	}


	public void setLast(Integer last) {
		this.last = last;
	}


	public RecipeVO() {

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

	public String getCooking_time() {
		return cooking_time;
	}

	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}

	public String getCooking_level() {
		return cooking_level;
	}

	public void setCooking_level(String cooking_level) {
		this.cooking_level = cooking_level;
	}
	
	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	

	@Override
	public String toString() {
		return "RecipeVO [recipe_number=" + recipe_number + ", recipe_name=" + recipe_name + ", recipe_date="
				+ recipe_date + ", recipe_content=" + recipe_content + ", member_id=" + member_id + ", cooking_time="
				+ cooking_time + ", cooking_level=" + cooking_level + ", main_img=" + main_img + ", first=" + first
				+ ", last=" + last + ", seller_code=" + seller_code + "]";
	}


	public RecipeVO(int recipe_number, String recipe_name, String recipe_date, String recipe_content, String member_id,
			String cooking_time, String cooking_level, String main_img, String seller_code) {
		super();
		this.recipe_number = recipe_number;
		this.recipe_name = recipe_name;
		this.recipe_date = recipe_date;
		this.recipe_content = recipe_content;
		this.member_id = member_id;
		this.cooking_time = cooking_time;
		this.cooking_level = cooking_level;
		this.main_img = main_img;
		this.seller_code = seller_code;
	}

}