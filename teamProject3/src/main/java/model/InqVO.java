package model;

import lombok.Data;

@Data
public class InqVO {
	private int inq_no;
	private String member_id;
	private int seller_code;
	private String inq_title;
	private String inq_content;
	private String inq_regdate;
	private String inq_answer;
}
