package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class inqDAO {
	Connection conn;
	PreparedStatement pstmt;	
	
	
	//싱글톤
	static SellerDAO instance;
	public static SellerDAO getInstance() {
		if(instance == null)
			instance = new SellerDAO();
			return instance;
	}
	
	//문의등록
	public int insert(InqVO inqVO) { 
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql="insert into inq (inq_no, member_id, inq_title, inq_content, inq_regdate) values (inq_no_seq.nextval,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inqVO.getMember_id());
			pstmt.setString(2, inqVO.getInq_title());
			pstmt.setString(3, inqVO.getInq_content());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 처리됨");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
}
