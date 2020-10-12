package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;

public class RecipeReviewDAO {
	Connection conn;
	PreparedStatement pstmt; // PreparedStatement는 Statement와 같은 기능을 수행하지만 가독성이 좋고 더 빠르다. ?기호 사용가능
	ResultSet rs = null; // ResultSet은 결과의 집합이라 select할때 사용하기. 초기값 필요하다
	ResultSet rs1 = null;
	// 싱글톤
	static RecipeReviewDAO instance;
	public static RecipeReviewDAO getInstance() {
		if(instance == null)
			instance = new RecipeReviewDAO();
			return instance;
	}
	
	public int insert(RecipeReviewVO recipe) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into recipe_review values(recipe_review_seq.nextval,?,?,sysdate,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, recipe.getRecipe_review_content());
			psmt.setString(2, recipe.getRecipe_review_file());
			psmt.setString(3, recipe.getMember_id());
			psmt.setInt(4, recipe.getRecipe_number());
			
			psmt.executeUpdate();
			// 3. 결과 처리
			

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public List<RecipeReviewVO> selectAllReview(RecipeReviewVO recipe) { //게시판 목록 이미지 뿌려주기
		RecipeReviewVO recipevo = null;
		List<RecipeReviewVO> recipeList = new ArrayList<RecipeReviewVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			
			
			String sql = "select a.*  from ( select rownum rn, b.*  from (" + 
					"select * from recipe_review where recipe_number= ?" + 
					"	ORDER BY recipe_review_no desc" + 
					"	) b ) a where rn BETWEEN ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipe.getRecipe_number());
			pstmt.setInt(2, recipe.getFirst());
			pstmt.setInt(3, recipe.getLast());
			rs1 = pstmt.executeQuery();
			while(rs1.next()) {
				recipevo = new RecipeReviewVO();
				recipevo.setRecipe_review_no(rs1.getInt("recipe_review_no"));
				recipevo.setRecipe_review_content(rs1.getString("recipe_review_content"));
				recipevo.setRecipe_review_file(rs1.getString("recipe_review_file"));
				recipevo.setRecipe_review_date(rs1.getString("recipe_review_date"));
				recipevo.setMember_id(rs1.getString("member_id"));
			recipevo.setRecipe_number(rs1.getInt("recipe_number"));
			recipeList.add(recipevo);
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
			ConnectionManager.close(rs1, null, null);
		}
		return recipeList; 
	}
	
	public int count(RecipeReviewVO restaurant) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			
			
			String sql = "select count(*) from recipe_review where recipe_number = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,restaurant.getRecipe_number());
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}
	public int delete(RecipeReviewVO recipe) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "delete recipe_review where recipe_review_no = ?";
			
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, recipe.getRecipe_review_no());
			psmt.executeUpdate();
			
			// 3. 결과 처리
			

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	}
}
