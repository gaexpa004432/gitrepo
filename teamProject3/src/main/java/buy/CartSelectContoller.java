package buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.cartDAO;
import model.orderVO;

public class CartSelectContoller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderVO vo = new orderVO();
		List<orderVO> session_cart = (List<orderVO>)request.getSession().getAttribute("session_cart");
		
		if(session_cart == null) {
			session_cart = new ArrayList<orderVO>();
			request.getSession().setAttribute("session_cart", session_cart);
		}
		
		String[] recipe_number = request.getParameterValues("recipe_number");
		int i=0;
		for(i=0; i<recipe_number.length; i++) {
			orderVO VO = new orderVO();
			VO.setRecipe_number(Integer.parseInt(recipe_number[i]));
			session_cart.add(VO);
		}

		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);
		
		ArrayList<orderVO> list = cartDAO.getInstance().selectCart(session_cart);
		
		request.getSession().setAttribute("session_cart", list);//세션에 저장

		request.setAttribute("list", list);
		request.setAttribute("session_cart", session_cart);
		
		request.getRequestDispatcher("/buy/cart.jsp").forward(request, response);
	}
}
