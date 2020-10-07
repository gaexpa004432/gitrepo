package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import model.orderVO;

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
			+ " FROM product p, order_detail d, order1 o"
			+ " WHERE member_id = ?";
	
	private final String SELECT_PAYMENT = "SELECT member_email, member_name, member_tel"
			+ " ,member_address"
			+ " FROM users";
	
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
            	list.add(ord);
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
		
	}
	
	public ArrayList<orderVO> selectPayment(orderVO vo) {
		ArrayList<orderVO> list = new ArrayList<orderVO>();
		try {
        	conn = ConnectionManager.getConnnect();
            psmt = conn.prepareStatement(SELECT_PAYMENT);
            rs = psmt.executeQuery();
            while(rs.next()){
            	orderVO ord = new orderVO();
            	ord.setMember_email(rs.getString("member_email"));
            	ord.setMember_name(rs.getString("member_name"));
            	ord.setMember_tel(rs.getString("member_tel"));
            	ord.setMember_address(rs.getString("member_address"));
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

