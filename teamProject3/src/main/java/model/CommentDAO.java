package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	ResultSet rs = null;
	//등록 
	   public int insert(CommentVO commentVO) {
	       int r = 0;
		   try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "INSERT INTO BOARDCOMMENT (COMMENT_NO, COMMENT_CONTENT,"
	         		+ "COMMENT_DATE, POST_NO, MEMBER_ID"
	         		+ ")"
	               + "VALUES (COMMENT_SEQ.NEXTVAL,?,SYSDATE,?,?)"; //시퀀스
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, commentVO.getComment_content());
	         pstmt.setInt(2, commentVO.getPost_no());
	         pstmt.setString(3, commentVO.getMember_id());
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
		public int update(CommentVO commentVO) {
		       int r = 0;
			   try {
		         conn = ConnectionManager.getConnnect();
		         String sql = "update boardcomment set comment_content=?" 
		         		+ "where board_no=?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, commentVO.getComment_content());
		  
		         r = pstmt.executeUpdate();
		         System.out.println(r + "건이 입력됨");

		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         ConnectionManager.close(conn);
		      }
		   return r;
		   }
		
		//단건조회(댓글view) 
		public ArrayList<CommentVO> selectOne(CommentVO commentVO) {
			 CommentVO resultVO = null;
			 ArrayList<CommentVO> list = new ArrayList();
			
			 try {
				 conn = ConnectionManager.getConnnect();
				 String sql = "select * from boardcomment where post_no =?";
				 pstmt = conn.prepareStatement(sql);
			     pstmt.setInt(1, commentVO.getPost_no());
			      
				rs = pstmt.executeQuery();
				while (rs.next()) {
				resultVO = new CommentVO();	
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setComment_no(rs.getInt("comment_no"));
				resultVO.setComment_content(rs.getString("comment_content"));
				resultVO.setComment_date(rs.getString("comment_date"));
				resultVO.setPost_no(rs.getInt("post_no"));
				list.add(resultVO);
				}
			 }catch(Exception e) {
				 e.printStackTrace();		 
			 } finally {
				 ConnectionManager.close(rs, pstmt, conn);
			 }
			return list;
		
		}
		
		//삭제
		public int delete(CommentVO commentVO) {
		       int r = 0;
			   try {
		         conn = ConnectionManager.getConnnect();
		         String sql = "delete from boardcomment where comment_no = ?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, commentVO.getComment_no());
		  
		         r = pstmt.executeUpdate();
		         System.out.println(r + "건이 입력됨");

		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         ConnectionManager.close(conn);
		      }
		   return r;
		   }
		
		static CommentDAO instance; //인스턴스를 들고옴
		public static CommentDAO getInstance() {
			if(instance == null)
				instance = new CommentDAO();
				return instance;
		}
	}

