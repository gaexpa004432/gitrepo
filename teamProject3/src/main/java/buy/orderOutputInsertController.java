package buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.orderDAO;
import model.orderVO;

public class orderOutputInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String recipe_name = request.getParameter("recipe_name");
		String product_name = request.getParameter("product_name");
		Integer product_price = Integer.parseInt(request.getParameter("product_price"));
		Integer order_total = Integer.parseInt(request.getParameter("order_total"));
		String member_email = request.getParameter("member_email");
		String member_tel = request.getParameter("member_tel");
		String member_name = request.getParameter("member_name");
		String member_address = request.getParameter("member_address");
		String member_id = request.getParameter("member_id");
		
		orderVO vo = new orderVO();
		vo.setRecipe_name(recipe_name);
		vo.setProduct_name(product_name);
		vo.setProduct_price(product_price);
		vo.setOrder_total(order_total);
		vo.setMember_email(member_email);
		vo.setMember_tel(member_tel);
		vo.setMember_name(member_name);
		vo.setMember_address(member_address);
		vo.setMember_id(member_id);
	
		int ord = orderDAO.getInstance().Insertoutput(vo);
		
		ArrayList<orderVO> list = orderDAO.getInstance().getOrder(vo);
		
		request.setAttribute("ord", ord);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);

	}
}
