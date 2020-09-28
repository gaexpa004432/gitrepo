package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class FreeBoardUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardVO freeboard = new FreeBoardVO();
		freeboard.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		freeboard = FreeBoardDAO.getInstance().selectOne(freeboard);//freeboardDAO에
		//있는 셀렉트원을 실행하고 실행할때 프리보드의 변수에 담긴 값을 같이 넘겨준다.그리고 처리가 끝난 데이터를
		//반환값으로 받은후 변수 freeboard에 넣어준다
		
		request.setAttribute("content",freeboard);//request에 변수 freeboard를 content
		//라는 이름으로 저장
		
		//selectone으로 들고온걸 board_no jsp페이지로 들고오기
		
	
		
		request.getRequestDispatcher("/board/freeBoardUpdate.jsp").forward(request, response);
		

	}

}
