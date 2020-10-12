package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;
import model.FreeBoardDAO;

public class FreeBoardListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String url = "/board/freeBoardList.jsp";
		 FreeBoardDAO DAO = new FreeBoardDAO();//dao객체 만들어서 모든 데이터 다 들고오기
		 String p = request.getParameter("p");
			String search = request.getParameter("board_search");
			
			//유효성 체크
			int page = 1;
			if(p != null) {
				page = Integer.parseInt(p);
			}
			Paging paging = new Paging();
			paging.setPageUnit(10); //들고 올 레코드 개수
			paging.setPageSize(5); //페이징 번호 개수
			paging.setPage(page);
		
		
			//vo에 담기
			FreeBoardVO board = new FreeBoardVO();
			board.setBoard_groupcode("pf");
			board.setBoard_sub(search);
			paging.setTotalRecord(DAO.count(board));
			board.setFirst(paging.getFirst());
			board.setLast(paging.getLast());
		 ArrayList<FreeBoardVO> list = DAO.selectAll(board); //db에서 실행한 모든 데이터를 가짐
		 //dao가 갖고있는 메소드중에 selectAll이라는 메소드를 수행.DB에서 조회한 모든데이터를 리스트에 담아둠
		 request.setAttribute("list", list); //데이터를 담아둔 리스트를 리퀘스트라는 변수안에 저장
		 request.setAttribute("paging", paging);
		 request.getRequestDispatcher(url).forward(request, response);
	} 

}
