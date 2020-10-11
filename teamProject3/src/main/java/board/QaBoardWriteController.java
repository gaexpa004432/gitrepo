package board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;
import model.QaBoardVO;
import model.boardDAO;

public class QaBoardWriteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardVO freeboard = new FreeBoardVO();
		String qaboard_sub = request.getParameter("qaboard_sub");
		String qaboard_content = request.getParameter("qaboard_content");
		String qaboard_file = request.getParameter("qaboard_file");
		String qaboard_passyn = request.getParameter("qaboard_passyn");
		System.out.println(qaboard_sub + qaboard_content + qaboard_passyn);
		
		freeboard.setBoard_sub(qaboard_sub); //vo객체에 담는 방법
		freeboard.setBoard_content(qaboard_content);
		freeboard.setBoard_file(qaboard_file);
		freeboard.setBoard_passyn(qaboard_passyn);
		freeboard.setBoard_groupcode("pq");
		
		HttpSession session = ((HttpServletRequest)request).getSession();
	      freeboard.setMember_id((String)session.getAttribute("id"));//로그인된 아이디를 들고옴
	     
	    boardDAO freeboarddao = new FreeBoardDAO();
	    freeboarddao.insert(freeboard);
		
	    response.sendRedirect("qaBoardList.do");
	}
	
	// 파일의 이름을 가져오는 메서드
		private String getFileName(Part part) throws UnsupportedEncodingException {
			for (String cd : part.getHeader("Content-Disposition").split(";")) {
				if (cd.trim().startsWith("filename")) {		// filename으로 시작되는거 찾아서 
					return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				}
			}
			return null;

		}
}
