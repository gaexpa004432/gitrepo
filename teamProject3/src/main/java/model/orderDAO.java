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
	
	
	String INSERT_OREDER_OUTPUT = "INSERT INTO orderList (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL,"
			+ " MEMBER_ID, ORDER_STATUS, ORDER_REASON, SELLER_CODE,  MEMBER_POSTCODE, MEMBER_ROADADDRESS,"
			+ " MEMBER_DETAILADDRESS, MEMBER_EXTRAADDRESS, MEMBER_TEL, MEMBER_NAME, MEMBER_EMAIL) "
			+ " VALUES(order_number_seq.nextval, SYSDATE, ?, ?, 'ow', ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	String INSERT_ORDER_DETAIL = "INSERT INTO ORDER_DETAIL(order_detail_number, PRODUCT_NUMBER,"
			+ " ORDER_NUMBER, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)"
			+ " VALUES (order_detial_number_seq.nextval, ?, ?, ?, ?, ?)";
	
	String SELECT_ORDER = "SELECT l.order_date, l.member_postcode, l.MEMBER_ROADADDRESS,"
			+ " l.MEMBER_DETAILADDRESS, l.MEMBER_EXTRAADDRESS, l.ORDER_TOTAL"
			+ "	, d.product_number, d.product_price, d.product_quantity, d.product_name"
			+ " FROM orderList l, order_detail d"
			+ " WHERE l.order_number = d.order_number AND l.order_number = ?";
	
	String INSERT_USE_MILEAGE = "INSERT INTO mileage(MILEAGE_NO, MILEAGE_CONTENTS, MILEAGE_DATE, MILEAGE_COST,"
			+ " GROUP_CODE, MEMBER_ID) "
			+ " VALUES (order_mileage_seq.nextval, '마일리지사용', SYSDATE, ?, '사용', ?)";
	
	String INSERT_ORDER_MILEAGE = "INSERT INTO mileage(MILEAGE_NO, MILEAGE_CONTENTS, MILEAGE_DATE, MILEAGE_COST,"
			+ " GROUP_CODE, MEMBER_ID) "
			+ " VALUES (order_mileage_seq.nextval, '상품구매', SYSDATE, ?, '적립', ?)";
	
	
	    public ArrayList<orderVO> getOrderoutput(orderVO vo){
	    	ArrayList<orderVO> list = new ArrayList<orderVO>();
	        try {
	        	conn = ConnectionManager.getConnnect();
	            psmt = conn.prepareStatement(SELECT_ORDER);
	            psmt.setString(1, vo.getOrder_number());
	            rs = psmt.executeQuery();
	            while(rs.next()){
	            orderVO order = new orderVO();
	            order.setOrder_date(rs.getString("order_date"));
	            order.setMember_postcode(rs.getString("member_postcode"));
	            order.setProduct_name(rs.getString("product_name"));
	            order.setMember_roadAddress(rs.getString("member_roadAddress"));
	            order.setMember_detailAddress(rs.getString("member_detailAddress"));
	            order.setMember_extraAddress(rs.getString("member_extraAddress"));
	            order.setOrder_total(rs.getString("order_total"));
	            order.setProduct_number(rs.getString("product_number"));
	            order.setProduct_price(rs.getString("product_price"));
	            order.setProduct_quantity(rs.getString("product_quantity"));
	            list.add(order);
	            System.out.println("list:" + list);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
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
							
				INSERT_OREDER_OUTPUT = "select order_number_seq.currval from dual";
				psmt = conn.prepareStatement(INSERT_OREDER_OUTPUT);
				rs = psmt.executeQuery();
				if (rs.next()) {
					r = rs.getInt(1);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
	    	return r;
	    }
	    
	    public int InsertDetail(orderVO vo) {
			int r = 0;
			try {
				conn = ConnectionManager.getConnnect();
				psmt = conn.prepareStatement(INSERT_ORDER_DETAIL);
				psmt.setString(1, vo.getProduct_number());
				psmt.setInt(2, vo.getLast());
				psmt.setString(3, vo.getProduct_name());
				psmt.setString(4, vo.getProduct_price());
				psmt.setString(5, vo.getProduct_quantity());
				r = psmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
	    	return r;
	    }
	    
	    public int Usemileage(orderVO vo) {
	    	int r=0;
	    	try {
	    		conn = ConnectionManager.getConnnect();
	    		psmt = conn.prepareStatement(INSERT_USE_MILEAGE);
	    		psmt.setString(1, vo.getMileage_use());
	    		psmt.setString(2, vo.getMember_id());
	    		r = psmt.executeUpdate();
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return r;
	    	
	    }
	    public int Insertmileage(orderVO vo) {
	    	int r=0;
	    	try {
	    		conn = ConnectionManager.getConnnect();
				psmt = conn.prepareStatement(INSERT_ORDER_MILEAGE);
				psmt.setString(1, vo.getMileage_cost());
				psmt.setString(2, vo.getMember_id());
				r = psmt.executeUpdate();
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
			return r;
	    	
	    }
}
	    
