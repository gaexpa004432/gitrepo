package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;

public class FavoriteDAO {
	Connection conn;
	PreparedStatement pstmt; 
	ResultSet rs = null;
	
	static FavoriteDAO instance;
	public static FavoriteDAO getInstance() {
		if(instance == null)
			instance = new FavoriteDAO();
			return instance;
	}
	
	public void insert(FavoriteVO favorite) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into favorites values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, favorite.getFavorite_code());
			pstmt.setInt(2, favorite.getFavorite_no());
			pstmt.setString(3, favorite.getMember_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public List<FavoriteVO> selectAll(FavoriteVO favoriteVo) { //게시판 목록 이미지 뿌려주기
		List<FavoriteVO> list = new ArrayList<FavoriteVO>(); 

		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "select * from favorites where MEMBER_ID= ?"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, favoriteVo.getMember_id());
			rs = pstmt.executeQuery();
			
			while (rs.next()) { 
				FavoriteVO favorite = new FavoriteVO();
				favorite.setFavorite_no(rs.getInt("favorite_no"));
				favorite.setFavorite_code(rs.getString("favorite_code"));

				list.add(favorite);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; 
	}

	public void delete(FavoriteVO favorite) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete favorites where favorite_code = ? and favorite_no = ? and member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, favorite.getFavorite_code());
			pstmt.setInt(2, favorite.getFavorite_no());
			pstmt.setString(3, favorite.getMember_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
}
