package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class InqDAO {
	Connection conn;
	PreparedStatement pstmt;	
	
	
	//싱글톤
	static InqDAO instance;
	public static InqDAO getInstance() {
		if(instance == null)
			instance = new InqDAO();
			return instance;
	}
	
	//문의등록
	public int insert(InqVO inqVO) { 
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql="insert into inq (inq_no, member_id, inq_title, inq_content, seller_code, inq_regdate) "
					+ "values (inq_no_seq.nextval,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inqVO.getMember_id());
			pstmt.setString(2, inqVO.getInq_title());
			pstmt.setString(3, inqVO.getInq_content());
			pstmt.setInt(4, inqVO.getSeller_code());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 처리됨");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	//각 회원 문의 리스트
	public ArrayList<InqVO> selectList(InqVO inqVO) {//List혹은 ArrayList쓰기
		InqVO resultVO = null;
		ResultSet rs = null;
		ArrayList<InqVO> list = new ArrayList<InqVO>();//리턴값을 저장할 변수 저장
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT i.inq_no, i.member_id, i.inq_title, i.inq_content, i.inq_regdate, i.inq_answer, i.seller_code, m.member_id"
					+ " FROM inq i, member m"
					+ "	where i.seller_code=m.seller_code"
					+ " and i.member_id = ?"
					+ " ORDER BY inq_regdate desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inqVO.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new InqVO();
				resultVO.setInq_no(rs.getInt(1));
				resultVO.setMember_id(rs.getString(2));
				resultVO.setInq_title(rs.getString(3));
				resultVO.setInq_content(rs.getString(4));
				resultVO.setInq_regdate(rs.getString(5));
				resultVO.setInq_answer(rs.getString(6));
				resultVO.setSeller_code(rs.getInt(7));
				resultVO.setSeller_id(rs.getString(8));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//문의 한건 조회
	public InqVO selectOne(InqVO inqVO) {
		InqVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM inq"
					+ " WHERE inq_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, inqVO.getInq_no());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new InqVO();
				resultVO.setInq_no(rs.getInt("inq_no"));
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setInq_title(rs.getString("inq_title"));
				resultVO.setInq_content(rs.getString("inq_content"));
				resultVO.setInq_regdate(rs.getString("inq_regdate"));
				resultVO.setInq_answer(rs.getString("inq_answer"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
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
	
	//판매자에게 온 문의 리스트
	public ArrayList<InqVO> selectAnsList(InqVO inqVO) {//List혹은 ArrayList쓰기
		InqVO resultVO = null;
		ResultSet rs = null;
		ArrayList<InqVO> list = new ArrayList<InqVO>();//리턴값을 저장할 변수 저장
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM inq"
					+ " where seller_code = ?"
					+ " ORDER BY inq_regdate desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, inqVO.getSeller_code());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new InqVO();
				resultVO.setInq_no(rs.getInt("inq_no"));
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setInq_title(rs.getString("inq_title"));
				resultVO.setInq_content(rs.getString("inq_content"));
				resultVO.setInq_regdate(rs.getString("inq_regdate"));
				resultVO.setInq_answer(rs.getString("inq_answer"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//답변 update
	public int answerRply(InqVO inqVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update inq set inq_answer = ?"
					+ " where inq_no = ?";
			//member_mileage=?, seller_code=? 추가하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inqVO.getInq_answer());
			pstmt.setInt(2, inqVO.getInq_no());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
}

