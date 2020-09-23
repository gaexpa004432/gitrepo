package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class RecipeDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static RecipeDAO instance;

	public static RecipeDAO getInstance() {
		if (instance == null)
			instance = new RecipeDAO();
		return instance;
	}
		
		public int recipeInsert(RecipeVO recipeVO) {
			int r = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "INSERT INTO recipe" +
						" VALUES (recipe_no.NEXTVAL, ?, sysdate, ?, ?)"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, recipeVO.getRecipe_name());
				pstmt.setString(2, recipeVO.getRecipe_date());
				pstmt.setString(3, recipeVO.getRecipe_content());
				pstmt.setString(4, recipeVO.getMember_id());

				r = pstmt.executeUpdate();
				System.out.println(r + " 건이 처리됨");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
	}
	
}
