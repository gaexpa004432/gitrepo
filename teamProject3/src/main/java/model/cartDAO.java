package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
			+ " r.recipe_name, r.main_img FROM product p, recipe r"
			+ " WHERE r.recipe_number IN ("; 
	
	
	  public ArrayList<orderVO> selectCart(List<orderVO> pro){
	    	ArrayList<orderVO> list = new ArrayList<orderVO>();
	    	String proc = "";
	    	int i = 0;
	    	for(i=0; i<pro.size(); i++) {
	    			proc = proc + "'"+ pro.get(i).getRecipe_number() +"'";
	    			//끝이 아니면 ,
	    			if(i < pro.size() -1) {
	    				proc = proc + ",";
	    				//끝일경우에는 ) 
	    			} else {
	    				proc = proc + ")";
	    			}
	    	}
	        try {
	        	conn = ConnectionManager.getConnnect();
	            psmt = conn.prepareStatement(SELECT_CART + proc);
	            rs = psmt.executeQuery();
	            while(rs.next()){
	            orderVO order = new orderVO();
	            	order.setProduct_number(rs.getInt("product_number"));
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
