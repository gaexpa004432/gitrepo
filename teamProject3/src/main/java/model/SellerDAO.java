package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class SellerDAO {
	Connection conn;
	PreparedStatement pstmt;	
	
	
	//싱글톤
	static SellerDAO instance;
	public static SellerDAO getInstance() {
		if(instance == null)
			instance = new SellerDAO();
			return instance;
	}
	
	//등록
	public int insert(SellerVO sellerVO) { 
		int r = 0;
		try {
			
			conn = ConnectionManager.getConnnect();
			
			String sql="insert into seller (seller_code, seller_address, seller_store, seller_tel) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sellerVO.getSeller_code());
			pstmt.setString(2, sellerVO.getSeller_address());
			pstmt.setString(3, sellerVO.getSeller_store());
			pstmt.setString(4, sellerVO.getSeller_tel());
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
