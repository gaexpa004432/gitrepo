package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
					+ " COOKING_PHOTO_NAME, COOKING_CONTENT)"
					+ " VALUES (recipe_photo_no.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipephotoVO.getRecipe_number());
			pstmt.setString(2, recipephotoVO.getCooking_photo_name());
			pstmt.setString(3, recipephotoVO.getCooking_content());
			pstmt.executeUpdate();

			sql = "select recipe_photo_no.currval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r = rs.getInt(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public List<RecipePhotoVO> selectOne(RecipeVO Recipe) {
		List<RecipePhotoVO> list = new ArrayList<RecipePhotoVO>();
		conn = ConnectionManager.getConnnect();
		RecipePhotoVO resultVO = new RecipePhotoVO();
		try { 
         
			 String sql = "select * from recipe_photo where recipe_number=? order by photo_number";
			 pstmt = conn.prepareStatement(sql); 

	         pstmt.setInt(1, Recipe.getRecipe_number());
			rs = pstmt.executeQuery();

			while(rs.next()) {
				resultVO = new RecipePhotoVO();
				resultVO.setCooking_content(rs.getString("cooking_content"));
				resultVO.setCooking_photo_name(rs.getString("cooking_photo_name"));
				resultVO.setPhoto_number(rs.getInt("photo_number"));
				resultVO.setRecipe_number(rs.getInt("recipe_number"));
				list.add(resultVO);
				
			} 
		 }catch(Exception e) {
			 e.printStackTrace();		 
		 } finally {
			 ConnectionManager.close(rs, pstmt, conn);
		 }
		return list;
	}

}
