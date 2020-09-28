package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class FreeBoardUpdate2Controller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


				FreeBoardVO freeboard = new FreeBoardVO();

				freeboard.setBoard_sub(request.getParameter("board_sub"));//board_sub는 freeboardupdate.jsp의 form태그안의 name과 동일
				//즉, board_sub의 value값을 가져온다는 의미
				freeboard.setBoard_content(request.getParameter("board_content"));
				freeboard.setBoard_file(request.getParameter("board_file"));
				freeboard.setBoard_no(Integer.parseInt(request.getParameter("board_no")));

			      
			      
			      
				FreeBoardDAO DAO = new FreeBoardDAO();
				DAO.update(freeboard);
				
				response.sendRedirect("freeBoardList.do");
	}

}
