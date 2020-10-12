package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;
import model.boardDAO;

public class qaBoardViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url= "/board/qaBoardView.jsp";
		boardDAO dao = new FreeBoardDAO();
		FreeBoardVO vo = new FreeBoardVO();
		vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		vo = dao.selectOne(vo);
		
		String content = vo.getBoard_content().replaceAll("\r\n", "<br>");
		vo.setBoard_content(content);
		request.setAttribute("board",vo);
		request.getRequestDispatcher(url).forward(request,response);
	}

}
