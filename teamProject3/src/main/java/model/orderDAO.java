package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class orderDAO {

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
	
	private final String INSERT_OREDER_OUTPUT = "INSERT INTO orderList (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL,"
			+ " MEMBER_ID, ORDER_STATUS, ORDER_REASON, SELLER_CODE,  MEMBER_POSTCODE, MEMBER_ROADADDRESS,"
			+ " MEMBER_DETAILADDRESS, MEMBER_EXTRAADDRESS, MEMBER_TEL, MEMBER_NAME, MEMBER_EMAIL) "
			+ " VALUES(order_number_seq.nextval, SYSDATE, ?, ?, 'ow', ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
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
	    
	    public int Insertoutput(orderVO vo) {
			int r = 0;
			try {
				conn = ConnectionManager.getConnnect();
				psmt = conn.prepareStatement(INSERT_OREDER_OUTPUT);
				psmt.setString(1, vo.getOrder_total());
				psmt.setString(2, vo.getMember_id());
				psmt.setString(3, vo.getOrder_reason());
				psmt.setString(4, vo.getSeller_code());
				psmt.setString(5, vo.getMember_postcode());
				psmt.setString(6, vo.getMember_roadAddress());
				psmt.setString(7, vo.getMember_detailAddress());
				psmt.setString(8, vo.getMember_extraAddress());
				psmt.setString(9, vo.getMember_tel());
				psmt.setString(10, vo.getMember_name());
				psmt.setString(11, vo.getMember_email());
				r = psmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
	    	return r;
	    }
}
