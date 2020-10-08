package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class EventDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	int r = 0;
	// 싱글톤
	static EventDAO instance;

	public static EventDAO getInstance() {
		if (instance == null)
			instance = new EventDAO();
		return instance;
	}

	public int eventInsert(FreeBoardVO freeboardVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO BOARD (board_no, board_sub, board_content,"
					+ " board_date, board_file, board_groupcode)" 
					+ " VALUES (BOARD_SEQ.NEXTVAL,?,?,SYSDATE,?,?)"; // 시퀀스
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, freeboardVO.getBoard_sub());
			pstmt.setString(2, freeboardVO.getBoard_content());
			pstmt.setString(3, freeboardVO.getBoard_file());
			pstmt.setString(4, freeboardVO.getBoard_groupcode());
			r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 전체조회 (페이징처리가 되는)
	public ArrayList<FreeBoardVO> eventSelectAll(FreeBoardVO freeboardVO) {
		conn = ConnectionManager.getConnnect();
		FreeBoardVO resultVO = new FreeBoardVO();
		ArrayList<FreeBoardVO> list = new ArrayList();
		try {
			String where = " where 1=1 and board_groupcode = ?";
			if (freeboardVO.getBoard_sub() != null) {
				where += " and Board_sub like '%' || ? || '%'  or Board_content like '%' || ? || '%'";
			}
			String sql = "select a.* from (select rownum rn,b.* from ( "
			+ " SELECT * from board " + where
			+ " order by board_no desc" + " ) b) a where rn between ? and ?";
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			int pos = 1; // 물음표값 동적으로 하려고 변수선언
			pstmt.setString(pos++, freeboardVO.getBoard_groupcode());
			if (freeboardVO.getBoard_sub() != null) {
				pstmt.setString(pos++, freeboardVO.getBoard_sub());
				pstmt.setString(pos++, freeboardVO.getBoard_sub());// 물음표 부분이 pos++로 인해 동적으로 늘어남
			}
			pstmt.setInt(pos++, freeboardVO.getFirst()); // 물음표부분이 pos++로 인해 동적으로 늘어남
			pstmt.setInt(pos++, freeboardVO.getLast());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVO = new FreeBoardVO();
				resultVO.setBoard_sub(rs.getString("board_sub"));
				resultVO.setBoard_content(rs.getString("board_content"));

				list.add(resultVO);
				System.out.println(resultVO.getBoard_sub());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 삭제
	public int eventDelete(FreeBoardVO freeboardVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete from board where board_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, freeboardVO.getBoard_no());

			r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 수정
	public int eventUpdate(FreeBoardVO freeboardVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE board SET board_sub=?, board_content=?, board_file=? "
						+ "WHERE board_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, freeboardVO.getBoard_sub());
			pstmt.setString(2, freeboardVO.getBoard_content());
			pstmt.setString(3, freeboardVO.getBoard_file());
			pstmt.setInt(4, freeboardVO.getBoard_no());
			
			r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	public FreeBoardVO eventSelectOne(FreeBoardVO freeboardVO) {
		 FreeBoardVO resultVO = null;
		 try {
			 conn = ConnectionManager.getConnnect();
			 String sql = "select * from board " + 
			 		"where BOARD_NO = ?";
			 pstmt = conn.prepareStatement(sql);
		     pstmt.setInt(1, freeboardVO.getBoard_no());
		      
			rs = pstmt.executeQuery();
			if (rs.next()) {
			resultVO = new FreeBoardVO();	
			resultVO.setBoard_sub(rs.getString("board_sub"));
			resultVO.setBoard_content(rs.getString("board_content"));
			resultVO.setBoard_no(rs.getInt("board_no"));
			resultVO.setBoard_file(rs.getString("board_file"));
			resultVO.setBoard_date(rs.getString("board_date"));
			}
		 }catch(Exception e) {
			 e.printStackTrace();		 
		 } finally {
			 ConnectionManager.close(rs, pstmt, conn);
		 }
		return resultVO;
	}
}
