package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SellerDAO;
import model.SellerVO;

public class MemberAddInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seller_code = Integer.parseInt(request.getParameter("seller_code"));
		String seller_address = request.getParameter("seller_roadAddress");
		String seller_store = request.getParameter("seller_store");
		String seller_tel = request.getParameter("seller_tel");
		
		SellerVO sellerVO = new SellerVO();
		sellerVO.setSeller_code(seller_code);
		sellerVO.setSeller_address(seller_address);
		sellerVO.setSeller_store(seller_store);
		sellerVO.setSeller_tel(seller_tel);
		
		int r = SellerDAO.getInstance().insert(sellerVO);
		
		request.setAttribute("cnt", r);
		
		request.getRequestDispatcher("/member/memberAddInsertOutput.jsp").forward(request, response);
	}

}
