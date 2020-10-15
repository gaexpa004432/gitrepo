package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;


public class BuyMileageDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	static BuyMileageDAO buyDAO = new BuyMileageDAO();
	public static BuyMileageDAO getInstance() {
		return buyDAO;
	}
	
	public orderVO selectOne(orderVO vo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select member_id,"
					+ " SUM (CASE WHEN GROUP_CODE = '적립' THEN MILEAGE_COST * 1 ELSE MILEAGE_COST * -1 END) AS remaining"
					+ " from mileage"
					+ " WHERE member_id = ?"
					+ " GROUP BY MEMBER_ID";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_id());
			rs = pstmt.executeQuery();
			// true값을 넘겨줘야하기때문에 if구문이 필수임.
			if (rs.next()) {
				vo = new orderVO();
				vo.setRemaining(rs.getInt("remaining"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return vo;
	}

}
