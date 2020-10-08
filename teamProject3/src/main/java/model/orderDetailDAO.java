package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class orderDetailDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 싱글톤
	static orderDetailDAO Detaildao = new orderDetailDAO();
	public static orderDetailDAO getInstance() {
		return Detaildao;
	}
	
	private final String SELECT_ORDER_DETAIL = "SELECT p.product_name,"
			+ " p.product_price, d.order_detail_no, o.order_total"
			+ " , SUM (CASE WHEN GROUP_CODE = '적립' THEN MILEAGE_COST * 1"
			+ " ELSE MILEAGE_COST * -1 END) OVER (ORDER BY MILEAGE_NO) AS remaining"
			+ " , m.group_code, m.mileage_cost, m.mileage_no"
			+ " FROM product p, order_detail d, order1 o, mileage m"
			+ " WHERE m.member_id = ?";
	

	public ArrayList<orderVO> selectOrder(orderVO order) {
		ArrayList<orderVO> list = new ArrayList<orderVO>();
		try {
        	conn = ConnectionManager.getConnnect();
            psmt = conn.prepareStatement(SELECT_ORDER_DETAIL);
            psmt.setString(1, order.getMember_id());
            rs = psmt.executeQuery();
            while(rs.next()){
            	orderVO ord = new orderVO();
            	ord.setProduct_name(rs.getString("product_name"));
            	ord.setProduct_price(rs.getInt("product_price"));
            	ord.setOrder_detail_no(rs.getInt("order_detail_no"));
            	ord.setOrder_total(rs.getInt("order_total"));
            	ord.setRemaining(rs.getInt("remaining"));
            	list.add(ord);
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
		
	}
	
}

