package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class FreeBoardViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url= "/board/freeBoardView.jsp";

	//	FreeBoardDAO.getInstance().updateReadCount(num);
		FreeBoardDAO DAO = new FreeBoardDAO();//dao객체 만들어서 모든 데이터 다 들고오기
		FreeBoardVO VO = new FreeBoardVO();
		VO.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		VO = DAO.selectOne(VO);//dao에도 selectOne 만들어줘야함 
		HttpSession session = ((HttpServletRequest)request).getSession();
	    String id = (String)session.getAttribute("id");//로그인된 아이디를 들고옴
	    request.setAttribute("id", (String)session.getAttribute("id"));
		request.setAttribute("board", VO);
		request.getRequestDispatcher(url).forward(request,response);
		
	}
}
