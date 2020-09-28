package model;

import lombok.Data;

@Data
public class RecipeMaterialVO {
	private int recipe_number;
	private int product_number;
	private int recipe_material_number;
	
	public RecipeMaterialVO () {
		
	}
	
	@Override
	public String toString() {
		return "RecipeMaterialVO [recipe_number=" + recipe_number + ", product_number=" + product_number
				+ ", recipe_material_number=" + recipe_material_number + "]";
	}
	public RecipeMaterialVO(int recipe_number, int product_number, int recipe_material_number) {
		super();
		this.recipe_number = recipe_number;
		this.product_number = product_number;
		this.recipe_material_number = recipe_material_number;
	}
	public int getRecipe_number() {
		return recipe_number;
	}
	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public int getRecipe_material_number() {
		return recipe_material_number;
	}
	public void setRecipe_material_number(int recipe_material_number) {
		this.recipe_material_number = recipe_material_number;
	}
	
}
