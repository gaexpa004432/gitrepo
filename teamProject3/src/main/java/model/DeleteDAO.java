package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class DeleteDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public void delete(String string) {
	       int r = 0;
		   try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "delete from member where member_id= ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, string);
	  pstmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(conn);
	      }
	   }
}
