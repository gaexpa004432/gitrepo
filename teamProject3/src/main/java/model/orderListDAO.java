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
	static orderListDAO dao = new orderListDAO();
	public static orderListDAO getInstance() {
		return dao;
	}
	
	private final String SELECT_ORDER = "select o.order_number, o.order_date, o.member_id, o.order_status, o.member_postcode,"
			+ " o.member_roadaddress, o.member_detailaddress, o.MEMBER_EXTRAADDRESS, p.product_name, p.product_price, p.product_quantity,"
			+ " o.order_total"
			+ " from orderList o, ORDER_DETAIL p"
			+ " where o.order_number = p.order_number AND o.member_id = ?";
	
    public ArrayList<orderVO> selectOrderOutput(orderVO vo){
    	ArrayList<orderVO> list = new ArrayList<orderVO>();
        try {
        	conn = ConnectionManager.getConnnect();
            psmt = conn.prepareStatement(SELECT_ORDER);
            psmt.setString(1, vo.getMember_id());
            rs = psmt.executeQuery();
            while(rs.next()){
            orderVO order = new orderVO();
            order.setOrder_number(rs.getString("order_number"));
            order.setOrder_date(rs.getString("order_date"));
            order.setMember_id(rs.getString("member_id"));
            order.setOrder_status(rs.getString("order_status"));
            order.setMember_postcode(rs.getString("member_postcode"));
            order.setMember_roadAddress(rs.getString("member_roadaddress"));
            order.setMember_detailAddress(rs.getString("member_detailaddress"));
            order.setMember_extraAddress(rs.getString("member_extraaddress"));
            order.setProduct_name(rs.getString("product_name"));
            order.setProduct_price(rs.getString("product_price"));
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
