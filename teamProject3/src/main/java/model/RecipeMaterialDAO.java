package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class RecipeMaterialDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static RecipeMaterialDAO instance;

	public static RecipeMaterialDAO getInstance() {
		if (instance == null)
			instance = new RecipeMaterialDAO();
		return instance;
	}
	
	public int insert(RecipeMaterialVO recipematerial) {
		int rs=0;
		try {
			Connection conn = ConnectionManager.getConnnect();

			//sql 구문 실행
			String sql = "INSERT INTO recipe_material VALUES(recipe_no.nextval,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, recipematerial.getRecipe_number());
			psmt.setInt(2, recipematerial.getProduct_number());
			psmt.setInt(3, recipematerial.getRecipe_material_number());
			psmt.executeUpdate();
			
			sql = "select res_seq.currval from dual"; //방금 쓰인 시퀀스 번호 들고옴
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionManager.close(conn);
		}
		return rs;
	}
	
	
}
