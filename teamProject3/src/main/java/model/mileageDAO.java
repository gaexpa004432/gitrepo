package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class mileageDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 싱글톤
	static mileageDAO mil = new mileageDAO();
	public static mileageDAO getInstance() {
		return mil;
	}
	
	private final String mileage_search= "SELECT GROUP_CODE, MILEAGE_NO, MILEAGE_CONTENTS, MILEAGE_DATE,"
			+ " MILEAGE_COST, SUM (CASE WHEN GROUP_CODE = '적립' THEN MILEAGE_COST * 1"
			+ " ELSE MILEAGE_COST * -1 END) OVER (ORDER BY MILEAGE_NO) AS remaining"
			+ " FROM MILEAGE"
			+ " WHERE MEMBER_ID = ?"
			+ " ORDER BY MILEAGE_NO";
	
	 public ArrayList<orderVO> getMileage (orderVO vo) {
		 ArrayList<orderVO> mil_list = new ArrayList<orderVO>();
	        try {
	        	conn = ConnectionManager.getConnnect();
	            psmt = conn.prepareStatement(mileage_search);
	            psmt.setString(1, vo.getMember_id());
	            rs = psmt.executeQuery();
	            while(rs.next()){
	            orderVO ord = new orderVO();
	            ord.setGroup_code(rs.getString("group_code"));
	            ord.setMileage_no(rs.getInt("mileage_no"));
	            ord.setMileage_contents(rs.getString("mileage_contents"));
	            ord.setMileage_date(rs.getString("mileage_date"));
	            ord.setMileage_cost(rs.getString("mileage_cost"));
	            ord.setRemaining(rs.getInt("remaining"));
	            mil_list.add(ord);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	ConnectionManager.close(conn);
	        }
	        return mil_list;
	 }
}
