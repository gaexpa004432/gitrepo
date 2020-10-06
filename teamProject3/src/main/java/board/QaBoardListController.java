package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class QaBoardListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardDAO freeboard = new FreeBoardDAO();
		FreeBoardVO freeboardvo = new FreeBoardVO();
		freeboardvo.setBoard_groupcode("pq");
		ArrayList<FreeBoardVO> list = freeboard.selectAll(freeboardvo);//
		
		
		
	}

}
