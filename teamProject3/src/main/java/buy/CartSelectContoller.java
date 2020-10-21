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
		
		String recipe_number = (String) request.getParameter("recipe_number");	
		vo.setRecipe_number(recipe_number);
		
		String product_number = (String) request.getParameter("product_number");
		vo.setProduct_number(product_number);
		
		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);
		
//		request.getSession().getAttribute("seller_code");
		
		ArrayList<orderVO> list = cartDAO.getInstance().selectCart(vo);
		
		RecipeVO res = (RecipeVO) request.getSession().getAttribute("resultVO");
		String seller_code = res.getSeller_code();
		
		request.getSession().setAttribute("session_cart", list);//세션에 저장
		
		request.setAttribute("seller_code", seller_code);
		request.setAttribute("list", list);
		request.setAttribute("cart", cartDAO.getInstance().selectCart(vo));
		
		request.getRequestDispatcher("/buy/cart.jsp").forward(request, response);
	}
}
