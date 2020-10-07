package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.EventDAO;
import model.FreeBoardVO;

public class EventUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		FreeBoardVO eventboard = new FreeBoardVO();

		eventboard.setBoard_sub(request.getParameter("board_sub"));//board_sub는 freeboardupdate.jsp의 form태그안의 name과 동일
		//즉, board_sub의 value값을 가져온다는 의미
		eventboard.setBoard_content(request.getParameter("board_content"));
		eventboard.setBoard_file(request.getParameter("board_file"));

		EventDAO DAO = new EventDAO();
		DAO.eventUpdate(eventboard);
				
		response.sendRedirect("eventBoardList.do");

	}
}
