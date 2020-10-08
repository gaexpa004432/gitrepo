package buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.cartDAO;
import model.orderVO;

public class CartSelectContoller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderVO vo = new orderVO();
		
		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);

		ArrayList<orderVO> list = cartDAO.getInstance().selectCart(vo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/buy/cart.jsp").forward(request, response);
	}

}
