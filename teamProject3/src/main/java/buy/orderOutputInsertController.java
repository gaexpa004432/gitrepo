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
		orderVO vo = new orderVO();
		
		String order_total = request.getParameter("order_total");
		String seller_code = request.getParameter("seller_code");
		String member_postcode = request.getParameter("member_postcode");
		String member_roadAddress = request.getParameter("member_roadAddress");
		String member_detailAddress = request.getParameter("member_detailAddress");
		String member_extraAddress = request.getParameter("member_extraAddress");
		String member_tel = request.getParameter("member_tel");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		
		//디테일 인서트
		
		Integer product_number = Integer.parseInt(request.getParameter("product_number"));
		String product_price = request.getParameter("product_price");
		String product_quantity = request.getParameter("product_quantity");
		String product_name = request.getParameter("product_name");
		
		vo.setOrder_total(order_total);
		vo.setSeller_code(seller_code);
		vo.setMember_postcode(member_postcode);
		vo.setMember_roadAddress(member_roadAddress);
		vo.setMember_detailAddress(member_detailAddress);
		vo.setMember_extraAddress(member_extraAddress);
		vo.setMember_tel(member_tel);
		vo.setMember_name(member_name);
		vo.setMember_email(member_email);
		vo.setProduct_number(product_number);
		vo.setProduct_price(product_price);
		vo.setPRODUCT_QUANTITY(product_quantity);
		vo.setProduct_name(product_name);
		
		
		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);
		
		int ord = orderDAO.getInstance().Insertoutput(vo);
	
		int orderd = orderDAO.getInstance().InsertDetail(vo);
						
		request.setAttribute("ord", ord);
		request.setAttribute("ord", orderd);
		
		request.getSession().setAttribute("ord", ord);
		request.getSession().setAttribute("ord", orderd);

		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);

	}
}
