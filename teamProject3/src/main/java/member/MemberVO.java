package member;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private	String member_name;
	private String member_tel;
	private String member_address;
	private String member_pass;
	private String member_gender;
	private String member_birth;
	private String member_type;
	private int member_mileage;
	private String seller_code;
	
}
