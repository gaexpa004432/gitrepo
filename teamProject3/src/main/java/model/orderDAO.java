package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import model.orderVO;

public class orderDAO {

	 Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 싱글톤
	static orderDAO dao = new orderDAO();
	public static orderDAO getInstance() {
		return dao;
	}
	
	private final String SELECT_ORDER = "select p.product_name, o.order_number, d.order_detail_no, o.seller_code,"
			+ 	" o.order_status, o.order_date, o.order_total" 
			+   " from order1 o, order_Detail d, product p" 
			+   " WHERE o.member_id = ?";
		
	    public ArrayList<orderVO> getOrder(orderVO vo){
	    	ArrayList<orderVO> list = new ArrayList<orderVO>();
	        try {
	        	conn = ConnectionManager.getConnnect();
	            psmt = conn.prepareStatement(SELECT_ORDER);
	            psmt.setString(1, vo.getMember_id());
	            rs = psmt.executeQuery();
	            while(rs.next()){
	            orderVO order = new orderVO();
	            	order.setProduct_name(rs.getString("product_name"));
	            	order.setOrder_number(rs.getInt("order_number"));
	            	order.setOrder_detail_no(rs.getInt("order_detail_no"));
	            	order.setSeller_code(rs.getInt("seller_code"));
	            	order.setOrder_status(rs.getString("order_status"));
	            	order.setOrder_date(rs.getString("order_date"));
	            	order.setOrder_total(rs.getInt("order_total"));
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
