package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class orderListDAO {

	 Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 싱글톤
	static orderDAO dao = new orderDAO();
	public static orderDAO getInstance() {
		return dao;
	}
	
	private final String SELECT_ORDER = "SELECT MEMBER_NAME, MEMBER_TEL, MEMBER_ADDRESS, MEMBER_EMAIL,"
			+ " ORDER_NUMBER, RECIPE_NAME, PRODUCT_NAME, RECIPE_NAME, PRODUCT_NAME, PRODUCT_PRICE,"
			+ " ORDER_DATE, ORDER_TOTAL"
			+ " FROM ORDER3"
			+ " WHERE MEMBER_ID = ?";
	
    public ArrayList<orderVO> getOrder(orderVO vo){
    	ArrayList<orderVO> list = new ArrayList<orderVO>();
        try {
        	conn = ConnectionManager.getConnnect();
            psmt = conn.prepareStatement(SELECT_ORDER);
            psmt.setString(1, vo.getMember_id());
            rs = psmt.executeQuery();
            while(rs.next()){
            orderVO order = new orderVO();
            order.setMember_name(rs.getString("member_name"));
            order.setMember_tel(rs.getString("member_tel"));
            order.setMember_address(rs.getString("member_address"));
            order.setMember_email(rs.getString("member_email"));
            order.setOrder_number(rs.getInt("order_number"));
            order.setRecipe_name(rs.getString("recipe_name"));
            order.setProduct_name(rs.getString("product_name"));
            order.setProduct_price(rs.getInt("product_price"));
            order.setOrder_date(rs.getString("order_date"));
            order.setOrder_total(rs.getString("order_total"));
            list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	ConnectionManager.close(conn);
        }
        return list;
    }
}
