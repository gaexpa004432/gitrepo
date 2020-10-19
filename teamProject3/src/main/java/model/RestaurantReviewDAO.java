package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;

public class RestaurantReviewDAO {
	Connection conn;
	PreparedStatement pstmt; // PreparedStatement는 Statement와 같은 기능을 수행하지만 가독성이 좋고 더 빠르다. ?기호 사용가능
	ResultSet rs = null; // ResultSet은 결과의 집합이라 select할때 사용하기. 초기값 필요하다
	ResultSet rs1 = null;
	// 싱글톤
	static RestaurantReviewDAO instance;
	public static RestaurantReviewDAO getInstance() {
		if(instance == null)
			instance = new RestaurantReviewDAO();
			return instance;
	}
	public int insert(RestaurantReviewVO restaurant) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into res_review values(res_review_seq.nextval,?,?,?,sysdate)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, restaurant.getRes_review_content());
			psmt.setString(2, restaurant.getMember_id());
			psmt.setInt(3, restaurant.getRes_no());
			

			psmt.executeUpdate();
			
			sql = "select res_review_seq.currval from dual"; //방금 쓰인 시퀀스 번호 들고옴
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
			r = rs.getInt(1);
			}
			// 3. 결과 처리
			

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public int insert_res_pic(RestaurantReviewVO restaurant) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into res_review_img values(res_review_pic_seq.nextval,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, restaurant.getRes_no());
			psmt.setString(2, restaurant.getRes_review_content());
		
			

			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public List<RestaurantReviewVO> selectAllReview(RestaurantReviewVO restaurantVo) { //게시판 목록 이미지 뿌려주기
		RestaurantReviewVO restaurant = null;
		ArrayList<String> list = null; 
		List<RestaurantReviewVO> restaurantList = new ArrayList<RestaurantReviewVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			
			
			String sql = "select a.*  from ( select rownum rn, b.*  from (" + 
					"select res_review_no,res_review_content,member_id , res_no ,res_review_date ,(select member_image from member where member_id = r.member_id) as member_image from res_review r where res_no= ? ORDER BY res_review_no desc" + 
					"	) b ) a where rn BETWEEN ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, restaurantVo.getRes_no());
			pstmt.setInt(2, restaurantVo.getFirst());
			pstmt.setInt(3, restaurantVo.getLast());
			rs1 = pstmt.executeQuery();
			while(rs1.next()) {
			restaurant = new RestaurantReviewVO();
			restaurant.setRes_no(rs1.getInt("res_no"));
			restaurant.setRes_review_content(rs1.getString("res_review_content"));
			restaurant.setMember_id(rs1.getString("member_id"));
			restaurant.setRes_review_date(rs1.getString("res_review_date"));
			restaurant.setRes_review_no(rs1.getInt("res_review_no"));
			restaurant.setMember_image(rs1.getString("member_image"));
			
			sql = "select * from res_review_img where res_review_no= ?";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, restaurant.getRes_review_no());
			rs = pstmt.executeQuery();
			list = new ArrayList<String>(); 
			while (rs.next()) { 
				
				list.add(rs.getString("res_review_image"));
			}
			restaurant.setRes_review_picture(list);
			restaurantList.add(restaurant);
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
			ConnectionManager.close(rs1, null, null);
		}
		return restaurantList; 
	}
	public int count(RestaurantReviewVO restaurant) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			
			
			String sql = "select count(*) from res_review where res_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,restaurant.getRes_no());
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
	
	public int delete(RestaurantReviewVO restaurant) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "delete res_review where res_review_no = ?";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, restaurant.getRes_review_no());
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