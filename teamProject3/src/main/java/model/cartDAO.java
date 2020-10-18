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
	
	private final String SELECT_CART = "SELECT p.product_number, p.product_name, p.product_price, r.recipe_number,"
			+ " r.recipe_name, r.main_img, m.seller_code FROM product p, recipe r, member m"
			+ " WHERE r.recipe_number = p.recipe_number AND p.product_code = 'prod' AND"
			+ " p.recipe_number = ? AND r.member_id = m.member_id"; 
	
	String order_detail = "SELECT p.product_number, p.product_name, p.product_price, r.recipe_number,"
			+ " r.recipe_name, r.main_img FROM product p, recipe r"
			+ " WHERE r.recipe_number = p.recipe_number AND"
			+ " p.product_number IN (";
	
		public ArrayList<orderVO> order_detail(String[] pro) {
			ArrayList<orderVO> list = new ArrayList<orderVO>();

	        try {
	        	conn = ConnectionManager.getConnnect();
	        	int i =0;
	        	String proc= "";
	        	for (i=0; i<pro.length; i++) {
	        		proc += pro[i];
	        		if(pro.length -1 > i) {
	        			proc += ",";
	        		} else {
	        			proc += ")";
	        		}
	        		
	        	}
	            psmt = conn.prepareStatement(order_detail + proc);
	            rs = psmt.executeQuery(order_detail + proc);
	            System.out.println(order_detail + proc);
	            while(rs.next()){
	            orderVO order = new orderVO();
	            	order.setProduct_number(rs.getString("product_number"));
	            	order.setProduct_name(rs.getString("product_name"));
	            	order.setProduct_price(rs.getString("product_price"));
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
	
	
	
	
	  public ArrayList<orderVO> selectCart(orderVO pro){
	    	ArrayList<orderVO> list = new ArrayList<orderVO>();
	    	
	        try {
	        	conn = ConnectionManager.getConnnect();
	            psmt = conn.prepareStatement(SELECT_CART);
	            psmt.setString(1, pro.getRecipe_number());
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()){
	            orderVO order = new orderVO();
	            	order.setProduct_number(rs.getString("product_number"));
	            	order.setProduct_name(rs.getString("product_name"));
	            	order.setProduct_price(rs.getString("product_price"));
	            	order.setMain_img(rs.getString("main_img"));
	            	order.setRecipe_name(rs.getString("recipe_name"));
	            	order.setSeller_code(rs.getString("seller_code"));
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
