package buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.RecipeVO;
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
		
		orderVO VO = new orderVO();
		Integer recipe_number = Integer.parseInt(request.getParameter("recipe_number"));	
		VO.setRecipe_number(recipe_number);
		
		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);
		
//		request.getSession().getAttribute("seller_code");
		
		ArrayList<orderVO> list = cartDAO.getInstance().selectCart(VO);
		
		RecipeVO res = (RecipeVO) request.getSession().getAttribute("resultVO");
		String seller_code = res.getSeller_code();
		
		request.getSession().setAttribute("session_cart", list);//세션에 저장
		
		request.setAttribute("seller_code", seller_code);
		request.setAttribute("list", list);
		request.setAttribute("session_cart", session_cart);
		
		request.getRequestDispatcher("/buy/cart.jsp").forward(request, response);
	}
}
