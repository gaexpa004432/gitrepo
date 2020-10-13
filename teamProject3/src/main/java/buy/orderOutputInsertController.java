package buy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.orderDAO;
import model.orderVO;

public class orderOutputInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer order_number = Integer.parseInt(request.getParameter("order_number"));
		String recipe_name = request.getParameter("recipe_name");
		String product_name = request.getParameter("product_name");
		Integer product_price = Integer.parseInt(request.getParameter("product_price"));
		Integer order_total = Integer.parseInt(request.getParameter("order_total"));
		String member_email = request.getParameter("member_email");
		String member_tel = request.getParameter("member_tel");
		String member_name = request.getParameter("member_name");
		String member_address = request.getParameter("member_address");
		String order_date = request.getParameter("order_date");
		
		orderVO vo = new orderVO();
		vo.setOrder_number(order_number);
		vo.setRecipe_name(recipe_name);
		vo.setProduct_name(product_name);
		vo.setProduct_price(product_price);
		vo.setOrder_total(order_total);
		vo.setMember_email(member_email);
		vo.setMember_tel(member_tel);
		vo.setMember_name(member_name);
		vo.setMember_address(member_address);
		vo.setOrder_date(order_date);
		
		int ord = orderDAO.getInstance().Insertoutput(vo);
		
		request.setAttribute("ord", ord);
		
		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);

	}
}
