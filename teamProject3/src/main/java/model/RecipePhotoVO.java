package model;

public class RecipePhotoVO {
	private int photo_number;
	private int recipe_number;
	private String cooking_photo_name;
	private String cooking_content;
	
	public RecipePhotoVO() {
		
	}
	
	public int getPhoto_number() {
		return photo_number;
	}
	public void setPhoto_number(int photo_number) {
		this.photo_number = photo_number;
	}
	public int getRecipe_number() {
		return recipe_number;
	}
	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}
	public String getCooking_photo_name() {
		return cooking_photo_name;
	}
	public void setCooking_photo_name(String cooking_photo_name) {
		this.cooking_photo_name = cooking_photo_name;
	}
	public String getCooking_content() {
		return cooking_content;
	}
	public void setCooking_content(String cooking_content) {
		this.cooking_content = cooking_content;
	}
	@Override
	public String toString() {
		return "RecipePhotoVO [photo_number=" + photo_number + ", recipe_number=" + recipe_number
				+ ", cooking_photo_name=" + cooking_photo_name + ", cooking_content=" + cooking_content + "]";
	}
	public RecipePhotoVO(int photo_number, int recipe_number, String cooking_photo_name, String cooking_content) {
		super();
		this.photo_number = photo_number;
		this.recipe_number = recipe_number;
		this.cooking_photo_name = cooking_photo_name;
		this.cooking_content = cooking_content;
	}
}
