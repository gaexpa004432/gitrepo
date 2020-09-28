package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class FreeBoardUpdate2Controller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardVO freeboard = new FreeBoardVO();
		
		System.out.println(request.getParameter("no"));
		//변경내용들을 디비에 저장
		freeboard.setBoard_no(Integer.parseInt(request.getParameter("no")));
		freeboard.setBoard_content(request.getParameter("contents"));
		freeboard.setBoard_sub(request.getParameter("sub"));
		
		FreeBoardDAO.getInstance().update(freeboard);//DAO에서 인스턴스를 들고와서 DAO의 기능 중 하나인 업데이트라는 기능을 사용
		response.sendRedirect("freeBoardList.do"); //이동시킬때는 /가 빠져야함 
	}

}
