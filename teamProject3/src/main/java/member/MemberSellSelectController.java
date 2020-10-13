package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberVO;
import model.SellDAO;
import model.SellVO;

public class MemberSellSelectController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int order_number = Integer.parseInt(request.getParameter("order_number"));
		MemberVO login = (MemberVO)request.getSession().getAttribute("login");
		int seller_code = login.getSeller_code();
		
		SellVO sellVO = new SellVO();
		sellVO.setOrder_number(order_number);
		sellVO.setSeller_code(seller_code);
		
		ArrayList<SellVO> list = SellDAO.getInstance().sellSelectOne(sellVO);
		SellVO orderOne = SellDAO.getInstance().sellRecipeOne(sellVO);
		
		request.setAttribute("list", list);
		request.setAttribute("orderOne", orderOne);
		
		request.getRequestDispatcher("/member/sellOrderSelect.jsp").forward(request, response);
	}

}
