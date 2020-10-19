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
	
	private final String SELECT_ORDER_DETAIL = "SELECT r.recipe_name, p.product_name,"
			+ " p.product_price, p.product_number"
			+ " , SUM (CASE WHEN GROUP_CODE = '적립' THEN MILEAGE_COST * 1"
			+ " ELSE MILEAGE_COST * -1 END) OVER (ORDER BY MILEAGE_NO) AS remaining"
			+ " ,m.group_code, m.mileage_cost, m.mileage_no"
			+ " FROM product p, recipe r, mileage m"
			+ " WHERE r.recipe_number = ?";
	

	public ArrayList<orderVO> selectOrder(orderVO order) {
		ArrayList<orderVO> list = new ArrayList<orderVO>();
		try {
        	conn = ConnectionManager.getConnnect();
            psmt = conn.prepareStatement(SELECT_ORDER_DETAIL);
            psmt.setString(1, order.getRecipe_number());
            rs = psmt.executeQuery();
            while(rs.next()){
            	orderVO ord = new orderVO();
            	ord.setProduct_number(rs.getString("product_number"));
            	ord.setProduct_name(rs.getString("product_name"));
            	ord.setProduct_price(rs.getString("product_price"));
            	ord.setRecipe_name(rs.getString("recipe_name"));
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

