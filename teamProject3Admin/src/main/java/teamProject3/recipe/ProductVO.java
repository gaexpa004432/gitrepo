package teamProject3.recipe;

import lombok.Data;

//@Data
public class ProductVO {
	private int product_number;
	private String product_name;
	private int product_price;
	private String product_unit;
	private String product_status;
	private int seller_code;
	private String product_img;
	private int recipe_number;
	private String product_code;
	
	
	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public int getRecipe_number() {
		return recipe_number;
	}

	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}

	public ProductVO() {
		
	}
	
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_unit() {
		return product_unit;
	}
	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public int getSeller_code() {
		return seller_code;
	}
	public void setSeller_code(int seller_code) {
		this.seller_code = seller_code;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	@Override
	public String toString() {
		return "ProductVO [product_number=" + product_number + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_unit=" + product_unit + ", product_status=" + product_status
				+ ", seller_code=" + seller_code + ", product_img=" + product_img
				+  ", product_code=" + product_code +"]";
	}
	
	public ProductVO(int product_number, String product_name, int product_price, String product_unit,
			String product_status, int seller_code, String product_img, String product_code) {
		super();
		this.product_number = product_number;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_unit = product_unit;
		this.product_status = product_status;
		this.seller_code = seller_code;
		this.product_img = product_img;
		this.product_code = product_code;
	}
	
}
