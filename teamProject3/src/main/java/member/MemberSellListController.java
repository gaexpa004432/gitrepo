package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.MemberVO;
import model.SellDAO;
import model.SellVO;

public class MemberSellListController implements Controller {


	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO login = (MemberVO)request.getSession().getAttribute("login");
		int seller_code = login.getSeller_code();
		String p = request.getParameter("p");
	
//		//유효성
//		int page = 1;
//		if(p != null) {
//			page = Integer.parseInt(p);
//		}
//		Paging paging = new Paging();
//		paging.setPageUnit(5);//한페이지에 보일 건수
//		paging.setPageSize(2);//페이지 번호수
//		paging.setPage(page);
//		
//		//VO에 담기
//		SellVO sellVO = new SellVO();
//		sellVO.setSeller_code(seller_code);
//		
//		SellDAO dao = SellDAO.getInstance();
//		paging.setTotalRecord(dao.count(sellVO));
//		sellVO.setFirst(paging.getFirst());
//		sellVO.setLast(paging.getLast());
		
		//
		SellVO sellVO = new SellVO();
		sellVO.setSeller_code(seller_code);
		
		SellDAO dao = SellDAO.getInstance();
		//
		
		ArrayList<SellVO> list = dao.sellRecipe(sellVO);
//		String status = "";
//		for(SellVO sell : list) {
//			if(sell.getOrder_status().equals("대기")) {
//				status = "대기";
//			} else if (sell.getOrder_status().equals("거절")) {
//				status = "거절";
//			} else if (sell.getOrder_status().equals("승인")) {
//				status = "승인";
//			}
//		}

//		request.setAttribute("status", status);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/member/sellList.jsp").forward(request, response);
	
	}

}
