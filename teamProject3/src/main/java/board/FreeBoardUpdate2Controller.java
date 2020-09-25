package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FreeBoardVO;

public class FreeBoardUpdate2Controller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardVO freeboard = new FreeBoardVO();
		request.getParameter("contents");
		request.getParameter("no");
		request.getParameter("sub");

	}

}
