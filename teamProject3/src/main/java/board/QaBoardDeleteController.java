package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class QaBoardDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		FreeBoardVO freeboard = new FreeBoardVO();
		freeboard.setBoard_no(board_no);
		 FreeBoardDAO DAO = new FreeBoardDAO();
		DAO.delete(freeboard);
		
		//forward
	    request.getRequestDispatcher("/qaBoardList.do").forward(request, response);
	}
}
