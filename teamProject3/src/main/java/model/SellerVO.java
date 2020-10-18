package model;

import lombok.Data;

@Data
public class SellerVO {
	private int seller_code;
	private String seller_roadAddress;
	private String seller_store;
	private String seller_tel;
	private String seller_postcode;
	private String seller_detailAddress;
	private String seller_extraAddress;
	public int getSeller_code() {
		return seller_code;
	}
	public void setSeller_code(int seller_code) {
		this.seller_code = seller_code;
	}
	public String getSeller_roadAddress() {
		return seller_roadAddress;
	}
	public void setSeller_roadAddress(String seller_roadAddress) {
		this.seller_roadAddress = seller_roadAddress;
	}
	public String getSeller_store() {
		return seller_store;
	}
	public void setSeller_store(String seller_store) {
		this.seller_store = seller_store;
	}
	public String getSeller_tel() {
		return seller_tel;
	}
	public void setSeller_tel(String seller_tel) {
		this.seller_tel = seller_tel;
	}
	public String getSeller_postcode() {
		return seller_postcode;
	}
	public void setSeller_postcode(String seller_postcode) {
		this.seller_postcode = seller_postcode;
	}
	public String getSeller_detailAddress() {
		return seller_detailAddress;
	}
	public void setSeller_detailAddress(String seller_detailAddress) {
		this.seller_detailAddress = seller_detailAddress;
	}
	public String getSeller_extraAddress() {
		return seller_extraAddress;
	}
	public void setSeller_extraAddress(String seller_extraAddress) {
		this.seller_extraAddress = seller_extraAddress;
	}
	
}
