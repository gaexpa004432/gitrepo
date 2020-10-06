package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;

public class SellerDAO {
	Connection conn;
	PreparedStatement pstmt;	
	
	
	//싱글톤
	static SellerDAO instance;
	public static SellerDAO getInstance() {
		if(instance == null)
			instance = new SellerDAO();
			return instance;
	}
	
	//등록
	public int insert(SellerVO sellerVO) { 
		int r = 0;
		try {
			
			conn = ConnectionManager.getConnnect();
			
			String sql="insert into seller (seller_code, seller_roadAddress, seller_store, seller_tel, seller_postcode, seller_detailAddress, seller_extraAddress) values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sellerVO.getSeller_code());
			pstmt.setString(2, sellerVO.getSeller_roadAddress());
			pstmt.setString(3, sellerVO.getSeller_store());
			pstmt.setString(4, sellerVO.getSeller_tel());
			pstmt.setString(5, sellerVO.getSeller_postcode());
			pstmt.setString(6, sellerVO.getSeller_detailAddress());
			pstmt.setString(7, sellerVO.getSeller_extraAddress());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 처리됨");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	//수정
	public int update(SellerVO sellerVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update seller set seller_roadAddress = ?, seller_store = ? , seller_tel = ?, "
					+ "seller_postcode = ?, seller_detailAddress = ?, seller_extraAddress = ? "
					+ "where seller_code = ?";
			//member_mileage=?, seller_code=? 추가하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerVO.getSeller_roadAddress());
			pstmt.setString(2, sellerVO.getSeller_store());
			pstmt.setString(3, sellerVO.getSeller_tel());
			pstmt.setString(4, sellerVO.getSeller_postcode());
			pstmt.setString(5, sellerVO.getSeller_detailAddress());
			pstmt.setString(6, sellerVO.getSeller_extraAddress());
			pstmt.setInt(7, sellerVO.getSeller_code());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	//한건조회(변수는 SellerVO타입으로)
	public SellerVO selectOne(SellerVO sellerVO) {
		SellerVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM SELLER"
					+ " WHERE SELLER_CODE=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sellerVO.getSeller_code());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new SellerVO();
				resultVO.setSeller_code(rs.getInt("seller_code"));
				resultVO.setSeller_roadAddress(rs.getString("seller_roadAddress"));
				resultVO.setSeller_store(rs.getString("seller_store"));
				resultVO.setSeller_tel(rs.getString("seller_tel"));
				resultVO.setSeller_postcode(rs.getString("seller_postcode"));
				resultVO.setSeller_detailAddress(rs.getString("seller_detailAddress"));
				resultVO.setSeller_extraAddress(rs.getString("seller_extraAddress"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return resultVO;
	}
	
	//한건조회(변수는 SellerVO타입으로)
		public SellerVO selectOne2(MemberVO memberVO) {
			SellerVO resultVO = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT * FROM SELLER"
						+ " WHERE SELLER_CODE=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, memberVO.getSeller_code());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVO = new SellerVO();
					resultVO.setSeller_code(rs.getInt("seller_code"));
					resultVO.setSeller_roadAddress(rs.getString("seller_roadAddress"));
					resultVO.setSeller_store(rs.getString("seller_store"));
					resultVO.setSeller_tel(rs.getString("seller_tel"));
					resultVO.setSeller_postcode(rs.getString("seller_postcode"));
					resultVO.setSeller_detailAddress(rs.getString("seller_detailAddress"));
					resultVO.setSeller_extraAddress(rs.getString("seller_extraAddress"));
				} else {
					System.out.println("no data");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
			}
			return resultVO;
		}
}
