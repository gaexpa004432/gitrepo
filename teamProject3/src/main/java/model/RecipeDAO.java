package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class RecipeDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	int r = 0;
	// 싱글톤
	static RecipeDAO instance;

	public static RecipeDAO getInstance() {
		if (instance == null)
			instance = new RecipeDAO();
		return instance;
	}
		
		public int recipeInsert(RecipeVO recipeVO) {
			
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "INSERT INTO recipe (recipe_number, recipe_name, recipe_date,"
						+ " recipe_content, member_id, cooking_time, cooking_level, main_img)" 
						+ " VALUES (recipe_no.NEXTVAL, ?, sysdate, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, recipeVO.getRecipe_name());
				pstmt.setString(2, recipeVO.getRecipe_content());
				pstmt.setString(3, recipeVO.getMember_id());
				pstmt.setString(4, recipeVO.getCooking_time());
				pstmt.setString(5, recipeVO.getCooking_level());
				pstmt.setString(6, recipeVO.getMain_img());
				pstmt.executeUpdate();
				
				sql = "select recipe_no.currval from dual"; //방금 쓰인 시퀀스 번호 들고옴
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
				r = rs.getInt(1);
				
				}
				return r;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
	}
}
