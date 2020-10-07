package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import net.sf.json.JSONObject;


public class CommentInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터를 VO에 담기
				response.setContentType("text/html; charset=UTF-8");
				
				String comment_content = request.getParameter("content");
				Integer post_no = Integer.parseInt(request.getParameter("post_no")); 
				
				CommentVO commentVO = new CommentVO();
				commentVO.setComment_content(comment_content);
				commentVO.setPost_no(post_no);
				
				System.out.println(post_no);
				
				HttpSession session = ((HttpServletRequest)request).getSession();
			    commentVO.setMember_id((String)session.getAttribute("id"));//로그인된 아이디를 들고옴
				//등록 처리
				CommentDAO dao = new CommentDAO();
				dao.insert(commentVO);
				
				//등록된 결과를 조회
				
				//등록된 정보를 응답
				String str = JSONObject.fromObject(commentVO).toString();
				System.out.println(str);
				response.getWriter().print(str); //이부분만 수정 
				
				
	}

}
