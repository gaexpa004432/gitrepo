package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class FreeBoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	ResultSet rs = null;
	//등록 
	   public int insert(FreeBoardVO freeboardVO) {
	       int r = 0;
		   try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "INSERT INTO BOARD (BOARD_NO, BOARD_SUB, BOARD_CONTENT,"
	         		+ "BOARD_DATE, BOARD_FILE, BOARD_GROUPCODE, MEMBER_ID, Board_passyn"
	         		+ ")"
	               + "VALUES (BOARD_SEQ.NEXTVAL,?,?,SYSDATE,?,?,?,?)"; //시퀀스
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, freeboardVO.getBoard_sub());
	         pstmt.setString(2, freeboardVO.getBoard_content());
	         pstmt.setString(3, freeboardVO.getBoard_file());
	         pstmt.setString(4, freeboardVO.getBoard_groupcode());
	         pstmt.setString(5, freeboardVO.getMember_id());
	         pstmt.setString(6, freeboardVO.getBoard_passyn());
	         r = pstmt.executeUpdate();
	         System.out.println(r + "건이 입력됨");

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(conn);
	      }
	   return r;
	   }
	   
	   //전체조회 (페이징처리가 되는)
		public ArrayList<FreeBoardVO> selectAll(FreeBoardVO freeboardVO) {
			conn = ConnectionManager.getConnnect();
			FreeBoardVO resultVO = new FreeBoardVO();
			ArrayList<FreeBoardVO> list = new ArrayList<FreeBoardVO>();
			try { 
	         String where = " where 1=1 and board_groupcode = ?";
	         if(freeboardVO.getBoard_sub() != null && !freeboardVO.getBoard_sub().isEmpty() ) {
	            where += " and (Board_sub like '%' || ? || '%'  or Board_content like '%' || ? || '%')";
	         }
				 String sql = "select a.* from (select rownum rn,b.* from ( " + 
				 		"              SELECT * from board "+where+" order by board_no desc" + 
				 		"           ) b) a where rn between ? and ?";
				 pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
		         int pos = 1;   // 물음표값 동적으로 하려고 변수선언
		            pstmt.setString(pos++, freeboardVO.getBoard_groupcode());
		            System.out.println(freeboardVO.getBoard_groupcode());
		         if(freeboardVO.getBoard_sub() != null && !freeboardVO.getBoard_sub().isEmpty()) {
		            pstmt.setString(pos++, freeboardVO.getBoard_sub());
		            pstmt.setString(pos++, freeboardVO.getBoard_sub());// 물음표 부분이 pos++로 인해 동적으로 늘어남
		         }
		         pstmt.setInt(pos++, freeboardVO.getFirst());      // 물음표부분이 pos++로 인해 동적으로 늘어남
		         pstmt.setInt(pos++, freeboardVO.getLast());
	
				rs = pstmt.executeQuery();   
				while(rs.next()) {
					resultVO = new FreeBoardVO();
					resultVO.setMember_id(rs.getString("member_id"));
					resultVO.setBoard_sub(rs.getString("board_sub"));
					resultVO.setBoard_content(rs.getString("board_content"));
					resultVO.setBoard_file(rs.getString("board_file"));
					resultVO.setBoard_groupcode(rs.getString("board_groupcode"));
					resultVO.setBoard_no(rs.getInt("board_no"));
					resultVO.setBoard_date(rs.getString("board_date"));
					resultVO.setBoard_passyn(rs.getString("board_passyn"));
					list.add(resultVO);
					System.out.println(resultVO.getBoard_sub());
				} 
				return list;
			 }catch(Exception e) {
				 e.printStackTrace();		 
			 } finally {
				 ConnectionManager.close(rs, pstmt, conn);
			 }
			return list;
		}
	   
		//삭제
				public int delete(FreeBoardVO freeboardVO) {
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
				
				//수정
				public int update(FreeBoardVO freeboardVO) {
				       int r = 0;
					   try {
				         conn = ConnectionManager.getConnnect();
				         String sql = "update board set board_sub=?, board_content=?" 
				         		+ "where board_no=?";
				         pstmt = conn.prepareStatement(sql);
				         pstmt.setString(1, freeboardVO.getBoard_sub());
				         pstmt.setString(2, freeboardVO.getBoard_content());
				         pstmt.setInt(3, freeboardVO.getBoard_no());
				  
				         r = pstmt.executeUpdate();
				         System.out.println(r + "건이 입력됨");

				      } catch (Exception e) {
				         e.printStackTrace();
				      } finally {
				         ConnectionManager.close(conn);
				      }
				   return r;
				   }
				
				//단건조회(게시물view) 
				public FreeBoardVO selectOne(FreeBoardVO freeboardVO) {
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
						resultVO.setMember_id(rs.getString("member_id"));
						resultVO.setBoard_no(rs.getInt("board_no"));
						resultVO.setBoard_sub(rs.getString("board_sub"));
						resultVO.setBoard_content(rs.getString("board_content"));
						resultVO.setMember_name(rs.getString("member_name"));
						resultVO.setBoard_date(rs.getString("board_date"));
						resultVO.setBoard_file(rs.getString("board_file"));
						}
					 }catch(Exception e) {
						 e.printStackTrace();		 
					 } finally {
						 ConnectionManager.close(rs, pstmt, conn);
					 }
					return resultVO;
				}
				public int count(FreeBoardVO freeboard) {
					int cnt = 0;
				      try {
				         conn = ConnectionManager.getConnnect();
				         String where = " where 1=1 and board_groupcode = ?";
				         if(freeboard.getBoard_sub() != null && !freeboard.getBoard_sub().isEmpty()) {
				            where += " and (Board_sub like '%' || ? || '%' or Board_content like '%' || ? || '%')";
				         }
				         String sql = "select count(*) from board" + where;
				         pstmt = conn.prepareStatement(sql);
				         int pos = 1;
				         pstmt.setString(pos++, freeboard.getBoard_groupcode());
				         if(freeboard.getBoard_sub() !=null && !freeboard.getBoard_sub().isEmpty()) {
				            pstmt.setString(pos++,freeboard.getBoard_sub());
				            pstmt.setString(pos++,freeboard.getBoard_sub());
				         }
				         rs = pstmt.executeQuery();
				         rs.next();
				         cnt = rs.getInt(1);
				         System.out.println("dsd" + freeboard.getBoard_groupcode());
				      } catch (Exception e) {
				         e.printStackTrace();
				      } finally {
				         ConnectionManager.close(conn);
				      }
				      return cnt;
				} 
				static FreeBoardDAO instance;
				public static FreeBoardDAO getInstance() {
					if(instance == null)
						instance = new FreeBoardDAO();
						return instance;
				}

				public void updateReadCount(String num) {
					// TODO Auto-generated method stub
					
				}

				public FreeBoardVO selectOneBoardByNum(String num) {
					// TODO Auto-generated method stub
					return null;
				}
				
				
			}

