package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class cartDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	static cartDAO CARTDAO = new cartDAO();
	public static cartDAO getInstance() {
		return CARTDAO;
	}
	
	private final String SELECT_CART = "SELECT * FROM recipe r, product p"
			+ "  WHERE r.member_id = ? "; 
	
	
	  public ArrayList<orderVO> selectCart(orderVO vo){
	    	ArrayList<orderVO> list = new ArrayList<orderVO>();
	        try {
	        	conn = ConnectionManager.getConnnect();
	            psmt = conn.prepareStatement(SELECT_CART);
	            psmt.setString(1, vo.getMember_id());
	            rs = psmt.executeQuery();
	            while(rs.next()){
	            orderVO order = new orderVO();
	            	order.setProduct_name(rs.getString("product_name"));
	            	order.setProduct_price(rs.getInt("product_price"));
	            	order.setMain_img(rs.getString("main_img"));
	            	order.setRecipe_name(rs.getString("recipe_name"));
	            	
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
