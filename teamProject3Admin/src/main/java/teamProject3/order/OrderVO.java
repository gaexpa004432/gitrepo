package teamProject3.order;

import lombok.Data;

@Data
public class OrderVO {
	
	//orderList
	int order_number;
	String order_date;
	String order_total;
	String member_id;
	String seller_code;
	String order_status;
	String order_reason;

	// detail
	int order_detail_number;
	int product_detail;
	int order_detail;
	int order_detail_no;

	// product
	int product_number;
	String product_name;
	String product_price;
	String product_unit;
	String product_status;
	String product_img;
	
	//member
	String member_pw;
	String member_name;
	String member_tel;
	String member_email;
	String member_address;
	
	//mileage
	Integer mileage_no;
	String mileage_contents;
	String mileage_date;
	Integer mileage_cost;
	String group_code;
	Integer remaining;
	
	//recipe
	int recipe_number;
	String recipe_name;
	String recipe_date;
	String recipe_content;
	String cooking_time;
	String cooking_level;
	Integer first;
	Integer last; 
	String main_img;
	
	//address 
	String member_postcode;
	String member_roadAddress;
	String member_detailAddress;
	String member_extraAddress;
	
	//Detail
	String PRODUCT_NUMBER;
	String PRODUCT_PRICE;
	String PRODUCT_QUANTITY;
	
	//default 생성자
	public OrderVO() {
		
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_total() {
		return order_total;
	}

	public void setOrder_total(String order_total) {
		this.order_total = order_total;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSeller_code() {
		return seller_code;
	}

	public void setSeller_code(String seller_code) {
		this.seller_code = seller_code;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_reason() {
		return order_reason;
	}

	public void setOrder_reason(String order_reason) {
		this.order_reason = order_reason;
	}

	public int getOrder_detail_number() {
		return order_detail_number;
	}

	public void setOrder_detail_number(int order_detail_number) {
		this.order_detail_number = order_detail_number;
	}

	public int getProduct_detail() {
		return product_detail;
	}

	public void setProduct_detail(int product_detail) {
		this.product_detail = product_detail;
	}

	public int getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(int order_detail) {
		this.order_detail = order_detail;
	}

	public int getOrder_detail_no() {
		return order_detail_no;
	}

	public void setOrder_detail_no(int order_detail_no) {
		this.order_detail_no = order_detail_no;
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

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
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

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public Integer getMileage_no() {
		return mileage_no;
	}

	public void setMileage_no(Integer mileage_no) {
		this.mileage_no = mileage_no;
	}

	public String getMileage_contents() {
		return mileage_contents;
	}

	public void setMileage_contents(String mileage_contents) {
		this.mileage_contents = mileage_contents;
	}

	public String getMileage_date() {
		return mileage_date;
	}

	public void setMileage_date(String mileage_date) {
		this.mileage_date = mileage_date;
	}

	public Integer getMileage_cost() {
		return mileage_cost;
	}

	public void setMileage_cost(Integer mileage_cost) {
		this.mileage_cost = mileage_cost;
	}

	public String getGroup_code() {
		return group_code;
	}

	public void setGroup_code(String group_code) {
		this.group_code = group_code;
	}

	public Integer getRemaining() {
		return remaining;
	}

	public void setRemaining(Integer remaining) {
		this.remaining = remaining;
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

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getMember_postcode() {
		return member_postcode;
	}

	public void setMember_postcode(String member_postcode) {
		this.member_postcode = member_postcode;
	}

	public String getMember_roadAddress() {
		return member_roadAddress;
	}

	public void setMember_roadAddress(String member_roadAddress) {
		this.member_roadAddress = member_roadAddress;
	}

	public String getMember_detailAddress() {
		return member_detailAddress;
	}

	public void setMember_detailAddress(String member_detailAddress) {
		this.member_detailAddress = member_detailAddress;
	}

	public String getMember_extraAddress() {
		return member_extraAddress;
	}

	public void setMember_extraAddress(String member_extraAddress) {
		this.member_extraAddress = member_extraAddress;
	}

	public String getPRODUCT_NUMBER() {
		return PRODUCT_NUMBER;
	}

	public void setPRODUCT_NUMBER(String pRODUCT_NUMBER) {
		PRODUCT_NUMBER = pRODUCT_NUMBER;
	}

	public String getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}

	public void setPRODUCT_PRICE(String pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}

	public String getPRODUCT_QUANTITY() {
		return PRODUCT_QUANTITY;
	}

	public void setPRODUCT_QUANTITY(String pRODUCT_QUANTITY) {
		PRODUCT_QUANTITY = pRODUCT_QUANTITY;
	}
	
}