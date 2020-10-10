package model;

public class RecipeReviewVO {
	private int recipe_review_no; 
	private String recipe_review_content;
	private String recipe_review_file;
	private String recipe_review_date;
	private String member_id;
	private int recipe_number;
	private Integer first;
	private Integer last;
	
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
	public int getRecipe_review_no() {
		return recipe_review_no;
	}
	public void setRecipe_review_no(int recipe_review_no) {
		this.recipe_review_no = recipe_review_no;
	}
	public String getRecipe_review_content() {
		return recipe_review_content;
	}
	public void setRecipe_review_content(String recipe_review_content) {
		this.recipe_review_content = recipe_review_content;
	}
	public String getRecipe_review_file() {
		return recipe_review_file;
	}
	public void setRecipe_review_file(String recipe_review_file) {
		this.recipe_review_file = recipe_review_file;
	}
	public String getRecipe_review_date() {
		return recipe_review_date;
	}
	public void setRecipe_review_date(String recipe_review_date) {
		this.recipe_review_date = recipe_review_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRecipe_number() {
		return recipe_number;
	}
	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}
	
	
}
