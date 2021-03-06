package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;

public class RestaurantDAO {
	Connection conn;
	PreparedStatement pstmt; // PreparedStatement는 Statement와 같은 기능을 수행하지만 가독성이 좋고 더 빠르다. ?기호 사용가능
	ResultSet rs = null; // ResultSet은 결과의 집합이라 select할때 사용하기. 초기값 필요하다
	
	// 싱글톤
	static RestaurantDAO instance;
	public static RestaurantDAO getInstance() {
		if(instance == null)
			instance = new RestaurantDAO();
			return instance;
	}
	public int insert(RestaurantVO restaurant) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into res values(res_seq.nextval,?,?,sysdate,?,?,?,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, restaurant.getRes_name());
			psmt.setString(2, restaurant.getRes_content());
			psmt.setString(3, restaurant.getRes_tel());
			psmt.setString(4, restaurant.getRes_si());
			psmt.setString(5, restaurant.getRes_gu());
			psmt.setString(6, restaurant.getRes_time());
			psmt.setString(7, restaurant.getRes_extra());
			psmt.executeUpdate();
			
			sql = "select res_seq.currval from dual"; //방금 쓰인 시퀀스 번호 들고옴
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
	

	
	public void insert_pic(RestaurantVO restaurant) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into res_pic values(res_pic_seq.nextval,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, restaurant.getRes_name());
			psmt.setInt(2, restaurant.getRes_no());
			r = psmt.executeUpdate();
			
			// 3. 결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}

	}
	
	public ArrayList<RestaurantVO> selectAll(RestaurantVO restaurantVo) { //게시판 목록 이미지 뿌려주기
		ArrayList<RestaurantVO> list = new ArrayList<RestaurantVO>(); 

		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "select a.*  from ( select rownum rn, b.*  from ( " + 
					" select res_pic_no,res_pic_name,r.res_no,r.res_name,r.res_date,(select count(*) from res_review where res_no = r.res_no) as count from res r ,res_pic p where r.res_no=p.res_no and res_pic_no in (select min(res_pic_no) from res_pic group by res_no)" + 
					"	ORDER BY res_no" + 
					"	) b ) a where rn BETWEEN ? and ?"; // 첫번째 이미지만 들고옴
			pstmt = conn.prepareStatement(sql); 
			int pos = 1;
			
			pstmt.setInt(pos++, restaurantVo.getFirst());
			pstmt.setInt(pos++, restaurantVo.getLast());
			rs = pstmt.executeQuery(); 

			
			
			
			while (rs.next()) { 
				RestaurantVO restaurant = new RestaurantVO();
				restaurant.setRes_no(rs.getInt("res_no"));
				restaurant.setRes_name(rs.getString("res_pic_name"));
				restaurant.setRes_gu(rs.getString("res_name"));
				restaurant.setRes_date(rs.getString("res_date").substring(0,10));
				restaurant.setRes_si(rs.getString("count"));

				list.add(restaurant);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; 
	}
	
	public int count(RestaurantVO restaurant) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			
			
			String sql = "select count(*) from res ";
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			
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
	
	public RestaurantVO selectOne(RestaurantVO restaurantVo) { //게시판 목록 이미지 뿌려주기
		RestaurantVO restaurant = new RestaurantVO(); 
		ArrayList<String> list = new ArrayList<String>(); 
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "select * from res where res_no= ?"; // 첫번째 이미지만 들고옴
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, restaurantVo.getRes_no());
			rs = pstmt.executeQuery();
			if(rs.next()) {
			restaurant.setRes_no(rs.getInt("res_no"));
			restaurant.setRes_name(rs.getString("res_name"));
			restaurant.setRes_content(rs.getString("res_content"));
			restaurant.setRes_date(rs.getString("res_date"));
			restaurant.setRes_tel(rs.getString("res_tel"));
			restaurant.setRes_si(rs.getString("res_si"));
			restaurant.setRes_gu(rs.getString("res_gu"));
			restaurant.setRes_time(rs.getString("res_time"));
			restaurant.setRes_extra(rs.getString("res_extra"));
			}
			sql = "select * from res_pic where res_no= ?";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, restaurantVo.getRes_no());
			rs = pstmt.executeQuery();
			
			while (rs.next()) { 
				list.add(rs.getString("res_pic_name"));
			}
			restaurant.setRes_picture(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return restaurant; 
	}
}
