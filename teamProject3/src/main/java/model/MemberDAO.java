package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//싱글톤
	static MemberDAO instance;
	public static MemberDAO getInstance() {
		if(instance == null)
			instance = new MemberDAO();
			return instance;
	}
	
	//전체조회
	public ArrayList<MemberVO> selectAll(MemberVO memberVO) {//List혹은 ArrayList쓰기
		MemberVO resultVO = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();//리턴값을 저장할 변수 저장
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM MEMBER"
					+ " ORDER BY MEMBER_ID";
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new MemberVO();
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setMember_name(rs.getString("member_name"));
				resultVO.setMember_tel(rs.getString("member_tel"));
				resultVO.setMember_roadAddress(rs.getString("member_roadAddress"));
				resultVO.setMember_pass(rs.getString("member_pass"));
				resultVO.setMember_gender(rs.getString("member_gender"));
				resultVO.setMember_birth(rs.getString("member_birth"));
				resultVO.setMember_type(rs.getString("member_type"));
				resultVO.setMember_mileage(rs.getInt("member_mileage"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
				resultVO.setMember_postcode(rs.getString("member_postcode"));
				resultVO.setMember_detailAddress(rs.getString("member_detailAddress"));
				resultVO.setMember_extraAddress(rs.getString("member_extraAddress"));
				resultVO.setMember_email(rs.getString("member_email"));
				resultVO.setMember_image(rs.getString("member_image"));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//한건조회
	public MemberVO selectOne(MemberVO memberVO) {
		MemberVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM MEMBER"
					+ " WHERE MEMBER_ID=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new MemberVO();
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setMember_name(rs.getString("member_name"));
				resultVO.setMember_tel(rs.getString("member_tel"));
				resultVO.setMember_roadAddress(rs.getString("member_roadAddress"));
				resultVO.setMember_pass(rs.getString("member_pass"));
				resultVO.setMember_gender(rs.getString("member_gender"));
				resultVO.setMember_birth(rs.getString("member_birth"));
				resultVO.setMember_type(rs.getString("member_type"));
				resultVO.setMember_mileage(rs.getInt("member_mileage"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
				resultVO.setMember_postcode(rs.getString("member_postcode"));
				resultVO.setMember_detailAddress(rs.getString("member_detailAddress"));
				resultVO.setMember_extraAddress(rs.getString("member_extraAddress"));
				resultVO.setMember_email(rs.getString("member_email"));
				resultVO.setMember_image(rs.getString("member_image"));
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
	
	//소상공인 한건조회
	public MemberVO selectOneAdd(MemberVO memberVO) {
		MemberVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from member m, seller s "
					+ "where m.seller_code = s.seller_code "
					+ "and m.member_id = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new MemberVO();
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setMember_name(rs.getString("member_name"));
				resultVO.setMember_tel(rs.getString("member_tel"));
				resultVO.setMember_roadAddress(rs.getString("member_roadAddress"));
				resultVO.setMember_pass(rs.getString("member_pass"));
				resultVO.setMember_gender(rs.getString("member_gender"));
				resultVO.setMember_birth(rs.getString("member_birth"));
				resultVO.setMember_type(rs.getString("member_type"));
				resultVO.setMember_mileage(rs.getInt("member_mileage"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
				resultVO.setMember_postcode(rs.getString("member_postcode"));
				resultVO.setMember_detailAddress(rs.getString("member_detailAddress"));
				resultVO.setMember_extraAddress(rs.getString("member_extraAddress"));
				resultVO.setMember_email(rs.getString("member_email"));
				resultVO.setMember_image(rs.getString("member_image"));
				resultVO.setSeller_roadAddress(rs.getString("seller_roadAddress"));
				resultVO.setSeller_store(rs.getString("seller_store"));
				resultVO.setSeller_tel(rs.getString("seller_tel"));
				resultVO.setSeller_postcode(rs.getString("seller_postcode"));
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
	
	
	
	//삭제
	public void delete(MemberVO memberVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE MEMBER WHERE MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql);//statement 만들때 sql넣어 줌
			pstmt.setString(1, memberVO.getMember_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + " 건이 삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	//seller_code만 수정
	public int updateSellerCode(MemberVO memberVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update member set seller_code =? "
					+ "where member_id = ?";
			//member_mileage=?, seller_code=? 추가하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberVO.getSeller_code());
			pstmt.setString(2, memberVO.getMember_id());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	//member_email만 수정
	public int updateMemberEmail(MemberVO memberVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update member set member_email =? "
					+ "where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_email());
			pstmt.setString(2, memberVO.getMember_id());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	
	//수정
	public int update(MemberVO memberVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update member set member_name=?, member_tel=?, member_postcode=?, member_roadAddress=?, "
					+ "member_detailAddress=?, member_extraAddress=?, "
					+ "member_gender=?, member_pass=?, "
					+ "member_birth=?, member_type=?, member_image=? "
					+ "where member_id = ?";
			//member_mileage=?, seller_code=? 추가하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_name());
			pstmt.setString(2, memberVO.getMember_tel());
			pstmt.setString(3, memberVO.getMember_postcode());
			pstmt.setString(4, memberVO.getMember_roadAddress());
			pstmt.setString(5, memberVO.getMember_detailAddress());
			pstmt.setString(6, memberVO.getMember_extraAddress());
			pstmt.setString(7, memberVO.getMember_gender());
			pstmt.setString(8, memberVO.getMember_pass());
			pstmt.setString(9, memberVO.getMember_birth());
			pstmt.setString(10, memberVO.getMember_type());
			pstmt.setString(11, memberVO.getMember_image());
			pstmt.setString(12, memberVO.getMember_id());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
		
	
	//등록
	public int insert(MemberVO memberVO) { 
		int r = 0;
		try {
			
			conn = ConnectionManager.getConnnect();
			
			String sql="insert into member (member_id, member_name, member_tel, member_roadAddress, member_pass, "
					+ "member_postcode, member_detailAddress, member_extraAddress, member_email, member_image, "
					+ "member_gender, member_birth, member_type) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
			pstmt.setString(2, memberVO.getMember_name());
			pstmt.setString(3, memberVO.getMember_tel());
			pstmt.setString(4, memberVO.getMember_roadAddress());
			pstmt.setString(5, memberVO.getMember_pass());
			pstmt.setString(6, memberVO.getMember_postcode());
			pstmt.setString(7, memberVO.getMember_detailAddress());
			pstmt.setString(8, memberVO.getMember_extraAddress());
			pstmt.setString(9, memberVO.getMember_email());
			pstmt.setString(10, memberVO.getMember_image());
			pstmt.setString(11, memberVO.getMember_gender());
			pstmt.setString(12, memberVO.getMember_birth());
			pstmt.setString(13, memberVO.getMember_type());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 처리됨");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	//판매자 아이디 가져오기
		public MemberVO selectSellerId(MemberVO memberVO) {
			MemberVO resultVO = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select * from member where seller_code=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, memberVO.getSeller_code());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVO = new MemberVO();
					resultVO.setMember_id(rs.getString("member_id"));
					resultVO.setMember_name(rs.getString("member_name"));
					resultVO.setMember_tel(rs.getString("member_tel"));
					resultVO.setMember_roadAddress(rs.getString("member_roadAddress"));
					resultVO.setMember_pass(rs.getString("member_pass"));
					resultVO.setMember_gender(rs.getString("member_gender"));
					resultVO.setMember_birth(rs.getString("member_birth"));
					resultVO.setMember_type(rs.getString("member_type"));
					resultVO.setMember_mileage(rs.getInt("member_mileage"));
					resultVO.setSeller_code(rs.getInt("seller_code"));
					resultVO.setMember_postcode(rs.getString("member_postcode"));
					resultVO.setMember_detailAddress(rs.getString("member_detailAddress"));
					resultVO.setMember_extraAddress(rs.getString("member_extraAddress"));
					resultVO.setMember_email(rs.getString("member_email"));
					resultVO.setMember_image(rs.getString("member_image"));
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

		
		//멤버 식당 즐찾
		public ArrayList<MemberFavoriteVO> selectFavoriteResAll(MemberFavoriteVO mfVO) {
			MemberFavoriteVO resultVO = null;
			ResultSet rs = null;
			ArrayList<MemberFavoriteVO> list = new ArrayList<MemberFavoriteVO>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select a.* from( select b.* , rownum rn    from(" +
						"select s.res_no, s.res_name, s.res_content, f.favorite_code, p.RES_PIC_NAME, p.res_pic_no " + 
						"from res s, favorites f, res_pic p " + 
						"where s.res_no = f.favorite_no " + 
						"and f.favorite_no = p.res_no " +
						"and f.favorite_code='fs' " + 
						"and member_id = ? " + 
						"and p.res_pic_no in ( " + 
						"select min(p.res_pic_no) " + 
						"from res s, favorites f, res_pic p " + 
						"where s.res_no = f.favorite_no " + 
						"and f.favorite_no = p.res_no " + 
						"and member_id = ? " + 
						"group by s.res_no, s.res_name, s.res_content)" +
						"order by s.res_no" +
						") b )a where rn between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mfVO.getMember_id());
				pstmt.setString(2, mfVO.getMember_id());
				pstmt.setInt(3, mfVO.getFirst());
				pstmt.setInt(4, mfVO.getLast());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					resultVO = new MemberFavoriteVO();
					resultVO.setRes_no(rs.getInt(1));
					resultVO.setRes_name(rs.getString(2));
					resultVO.setRes_content(rs.getString(3));
					resultVO.setFavorite_code(rs.getString(4));
					resultVO.setRes_pic_name(rs.getString(5));
					resultVO.setRes_pic_no(rs.getInt(6));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
		
		//멤버 레시피 즐찾
		public ArrayList<MemberFavoriteVO> selectFavoriteRecipeAll(MemberFavoriteVO mfVO) {
			MemberFavoriteVO resultVO = null;
			ResultSet rs = null;
			ArrayList<MemberFavoriteVO> list = new ArrayList<MemberFavoriteVO>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select a.* from( select b.* , rownum rn    from(" + 
						"select r.recipe_number, r.recipe_name, r.recipe_content, r.main_img, f.favorite_code, r.recipe_date " + 
						"from recipe r, favorites f " + 
						"where r.recipe_number = f.favorite_no " + 
						"and f.member_id = ? " + 
						"and f.favorite_code='fr' " + 
						"order by r.recipe_number " + 
						") b )a where rn between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mfVO.getMember_id());
				pstmt.setInt(2, mfVO.getFirst());
				pstmt.setInt(3, mfVO.getLast());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					resultVO = new MemberFavoriteVO();
					resultVO.setRecipe_number(rs.getInt(1));
					resultVO.setRecipe_name(rs.getString(2));
					resultVO.setRecipe_content(rs.getString(3));
					resultVO.setMain_img(rs.getString(4));
					resultVO.setFavorite_code(rs.getString(5));
					resultVO.setRecipe_date(rs.getString(6));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
		
		//즐찾 식당 전체 건수 
		public int fsCount(MemberFavoriteVO mfVO) {
			int cnt = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select count(*) from (" +
						"select s.res_no, s.res_name, f.favorite_code, s.res_content, p.RES_PIC_NAME, p.res_pic_no " + 
						"from res s, favorites f, res_pic p " + 
						"where s.res_no = f.favorite_no " + 
						"and f.favorite_no = p.res_no " + 
						"and member_id = ? " + 
						"and f.favorite_code='fs' " + 
						"and p.res_pic_no in ( " + 
						"select min(p.res_pic_no) " + 
						"from res s, favorites f, res_pic p " + 
						"where s.res_no = f.favorite_no " + 
						"and f.favorite_no = p.res_no " + 
						"and member_id = ? " + 
						"group by s.res_no) " + 
						"order by s.res_no)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mfVO.getMember_id());
				pstmt.setString(2, mfVO.getMember_id());
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
		
		//즐찾 레시피 전체 건수
		public int frCount(MemberFavoriteVO mfVO) {
			int cnt = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select count(*) from (" +
						"select r.recipe_number, r.recipe_name, r.recipe_content, r.main_img, f.favorite_code " + 
						"from recipe r, favorites f " + 
						"where r.recipe_number = f.favorite_no " + 
						"and f.member_id = ? " + 
						"and f.favorite_code='fr')";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mfVO.getMember_id());
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
		
		//한 회원의 모든 즐겨찾기 개수
		public int favoriteCount(MemberVO mfVO) {
			int cnt = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select count(*) from favorites where member_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mfVO.getMember_id());
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

}


	

