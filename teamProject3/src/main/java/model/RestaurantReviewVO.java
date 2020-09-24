package model;

public class RestaurantReviewVO {
	private int res_review_no;
	private String res_review_content;
	private String member_id;
	private int res_no;
	public int getRes_review_no() {
		return res_review_no;
	}
	public void setRes_review_no(int res_review_no) {
		this.res_review_no = res_review_no;
	}
	public String getRes_review_content() {
		return res_review_content;
	}
	public void setRes_review_content(String res_review_content) {
		this.res_review_content = res_review_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public RestaurantReviewVO(int res_review_no, String res_review_content, String member_id, int res_no) {
		super();
		this.res_review_no = res_review_no;
		this.res_review_content = res_review_content;
		this.member_id = member_id;
		this.res_no = res_no;
	}
	
	
}
