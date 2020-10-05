package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;

public class RecipePhotoDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	int r = 0;
	// 싱글톤
	static RecipePhotoDAO instance;

	public static RecipePhotoDAO getInstance() {
		if (instance == null)
			instance = new RecipePhotoDAO();
		return instance;
	}

	public int recipe_photoInsert(RecipePhotoVO recipephotoVO) {

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO recipe_photo (photo_number, recipe_number,"
					+ " cooking_photo_name, cooking_content)"
					+ " VALUES (recipe_photo_no.NEXTVAL, recipe_no.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, RecipePhotoVO.getRecipe_number());
			pstmt.setString(2, RecipePhotoVO.getCooking_photo_name());
			pstmt.setString(3, RecipePhotoVO.getCooking_content());
			pstmt.executeUpdate();

			sql = "select recipe_photo_no.currval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r = rs.getInt(1);

			}
			return r;
			
			sql = "select recipe_no.currval from dual";
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
