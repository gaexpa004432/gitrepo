package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.EventDAO;
import model.FreeBoardVO;

public class EventDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		FreeBoardVO eventboard = new FreeBoardVO();
		eventboard.setBoard_no(board_no);
		EventDAO DAO = new EventDAO();
		DAO.eventDelete(eventboard);
		
		//forward
	    request.getRequestDispatcher("teamProject3/eventBoardList.do").forward(request, response);
	}

}
