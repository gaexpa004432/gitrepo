package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class ProductDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static ProductDAO instance;

	public static ProductDAO getInstance() {
		if (instance == null)
			instance = new ProductDAO();
		return instance;
	}

	public int productInsert(ProductVO productVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into product(product_number, product_name, product_price,"
					+ "product_unit, product_status, seller_code) values (prod_no.NEXTVAL,?,?,?,'N',?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getProduct_name());
			pstmt.setInt(2, productVO.getProduct_price());
			pstmt.setString(3, productVO.getProduct_unit());
			pstmt.setInt(4, productVO.getSeller_code());

			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 처리됨");
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
			String sql = "SELECT DISTINCT product_name FROM product";
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new ProductVO();
				resultVO.setProduct_name(rs.getString("product_name"));
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
