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
	public void insert(RestaurantVO restaurant) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into res values(res_seq.nextval,?,?,sysdate,?,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, restaurant.getRes_name());
			psmt.setString(2, restaurant.getRes_content());
			psmt.setString(3, restaurant.getRes_tel());
			psmt.setString(4, restaurant.getRes_si());
			psmt.setString(5, restaurant.getRes_gu());
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
	
	public List<RestaurantVO> selectAll() { // 조회가 여러건이면 DeptVO를 list에 담음
		List<RestaurantVO> list = new ArrayList<RestaurantVO>(); // 결과값을 저장할 list 변수 객체 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select no , name ,limit , picture , startprice , id ,(select max(b.price) from bidding b where a.no = b.no) " + 
			"from auction a where systimestamp < limit"; // 컨+쉬+x 대문자, 컨+쉬+y 소문자 변환가능. 쿼리 엔터해서 쓸거면 앞에 공백 붙이기
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			rs = pstmt.executeQuery(); // select 시에는 executeQuery() 쓰기

			while (rs.next()) { // 여러건 조회라서 while를 사용. next()로 한건 한건마다 true 인지 false인지 확인하고 이동함
//				AuctionVO auction = new AuctionVO(); // 레코드 한건을 resultVO에 담음
//				auction.setNo(rs.getInt(1)); 
//				auction.setName(rs.getString(2)); 
//				auction.setLimit_date(rs.getString(3));
//				auction.setPicture(rs.getString(4));
//				auction.setStartprice(rs.getInt(5)); 
//				auction.setId(rs.getString(6));
//				auction.setLimit(rs.getInt(7));
//				list.add(auction); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}
	
	
}
