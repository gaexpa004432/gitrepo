package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class ProductDAO{
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static ProductDAO instance;

	public static ProductDAO getInstance() {
		if (instance == null)
			instance = new ProductDAO();
		return instance;
	}
	//select * from product where product_name = ;
	public boolean productStatus(ProductVO productVO) {
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from product where product_name=? and product_status = 'Y'";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getProduct_name());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return false;
	}
	

	public int productInsert(ProductVO productVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " INSERT INTO product(product_number, product_name, product_price,"
					+ " product_unit, product_status, seller_code,recipe_number,product_code) "

					+ " VALUES (prod_no.NEXTVAL,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getProduct_name());
			pstmt.setInt(2, productVO.getProduct_price());
			pstmt.setString(3, productVO.getProduct_unit());
			pstmt.setString(4, productVO.getProduct_status());
			pstmt.setInt(5, productVO.getSeller_code());
			pstmt.setInt(6, productVO.getRecipe_number());
			pstmt.setString(7, productVO.getProduct_code());
			r = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public ArrayList<ProductVO> productSelectAll(ProductVO productVO) {
		ProductVO resultVO = null;
		ResultSet rs = null;
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT DISTINCT product_name, product_unit, product_price, product_code "
						+ "FROM product"
						+ " WHERE recipe_number = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, productVO.getRecipe_number());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new ProductVO();
				resultVO.setProduct_name(rs.getString("product_name"));
				resultVO.setProduct_unit(rs.getString("product_unit"));
				resultVO.setProduct_price(rs.getInt("product_price"));
				resultVO.setProduct_code(rs.getString("product_code"));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<ProductVO> productSelectOne(RecipeVO recipeVO) {
		ProductVO resultVO = null;
		ResultSet rs = null;
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * from product where recipe_number = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, recipeVO.getRecipe_number());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new ProductVO();
				resultVO.setProduct_name(rs.getString("product_name"));
				resultVO.setProduct_number(rs.getInt("product_number"));
				resultVO.setProduct_price(rs.getInt("product_price"));
				resultVO.setProduct_unit(rs.getString("product_unit"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
				resultVO.setProduct_code(rs.getString("product_code"));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
