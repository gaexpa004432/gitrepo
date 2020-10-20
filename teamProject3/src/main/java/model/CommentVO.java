package model;

public class CommentVO {
	private String member_id;
	private Integer comment_no;
	private String comment_content;
	private String comment_date;
	private Integer post_no;
	private String member_image;
	
	
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Integer getComment_no() {
		return comment_no;
	}
	public void setComment_no(Integer comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public Integer getPost_no() {
		return post_no;
	}
	public void setPost_no(Integer post_no) {
		this.post_no = post_no;
	}
	
	

}
