package model;

public class orderVO {
	
	//order1
	int order_number;
	String order_date;
	int order_total;
	String member_id;
	int seller_code;
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
	Integer product_price;
	String product_unit;
	String product_status;
	String product_img;
	
	//users
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
	
	
	//default 생성자
	public orderVO() {
		
	}


	public orderVO(int order_number, String order_date, int order_total, String member_id, int seller_code,
			String order_status, String order_reason, int order_detail_number, int product_detail, int order_detail,
			int order_detail_no, int product_number, String product_name, Integer product_price, String product_unit,
			String product_status, String product_img, String member_pw, String member_name, String member_tel,
			String member_email, String member_address, Integer mileage_no, String mileage_contents,
			String mileage_date, Integer mileage_cost, String group_code, Integer remaining) {
		super();
		this.order_number = order_number;
		this.order_date = order_date;
		this.order_total = order_total;
		this.member_id = member_id;
		this.seller_code = seller_code;
		this.order_status = order_status;
		this.order_reason = order_reason;
		this.order_detail_number = order_detail_number;
		this.product_detail = product_detail;
		this.order_detail = order_detail;
		this.order_detail_no = order_detail_no;
		this.product_number = product_number;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_unit = product_unit;
		this.product_status = product_status;
		this.product_img = product_img;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_address = member_address;
		this.mileage_no = mileage_no;
		this.mileage_contents = mileage_contents;
		this.mileage_date = mileage_date;
		this.mileage_cost = mileage_cost;
		this.group_code = group_code;
		this.remaining = remaining;
	}


	

	@Override
	public String toString() {
		return "orderVO [order_number=" + order_number + ", order_date=" + order_date + ", order_total=" + order_total
				+ ", member_id=" + member_id + ", seller_code=" + seller_code + ", order_status=" + order_status
				+ ", order_reason=" + order_reason + ", order_detail_number=" + order_detail_number
				+ ", product_detail=" + product_detail + ", order_detail=" + order_detail + ", order_detail_no="
				+ order_detail_no + ", product_number=" + product_number + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", product_unit=" + product_unit + ", product_status="
				+ product_status + ", product_img=" + product_img + ", member_pw=" + member_pw + ", member_name="
				+ member_name + ", member_tel=" + member_tel + ", member_email=" + member_email + ", member_address="
				+ member_address + ", mileage_no=" + mileage_no + ", mileage_contents=" + mileage_contents
				+ ", mileage_date=" + mileage_date + ", mileage_cost=" + mileage_cost + ", group_code=" + group_code
				+ ", remaining=" + remaining + "]";
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


	public int getOrder_total() {
		return order_total;
	}


	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getSeller_code() {
		return seller_code;
	}


	public void setSeller_code(int seller_code) {
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


	public Integer getProduct_price() {
		return product_price;
	}


	public void setProduct_price(Integer product_price) {
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
	
	
	
	
	
}