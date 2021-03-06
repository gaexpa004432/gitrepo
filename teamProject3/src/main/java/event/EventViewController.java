package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.EventDAO;
import model.FreeBoardVO;

public class EventViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url= "/event/eventView.jsp";

	//	FreeBoardDAO.getInstance().updateReadCount(num);
		EventDAO dao = new EventDAO();//dao객체 만들어서 모든 데이터 다 들고오기
		FreeBoardVO vo = new FreeBoardVO();
		vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		vo = dao.eventSelectOne(vo);//dao에도 selectOne 만들어줘야함 
	
		
		String content= vo.getBoard_content().replaceAll("\r\n", "<br>");
		vo.setBoard_content(content); //글 입력할때 엔터치면 적용되도록 br태그로 변환해야함(글의 엔터값을 br태그로 변환)
		request.setAttribute("board", vo);
		request.getRequestDispatcher(url).forward(request,response);
		
	}
}
