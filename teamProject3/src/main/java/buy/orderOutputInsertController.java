package buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberVO;
import model.orderDAO;
import model.orderVO;

public class orderOutputInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderVO vo = new orderVO();
		
		
		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);
		
		String order_total = request.getParameter("order_total");
		System.out.println(order_total);
		String seller_code = request.getParameter("seller_code");
		String member_postcode = request.getParameter("member_postcode");
		String member_roadAddress = request.getParameter("member_roadAddress");
		String member_detailAddress = request.getParameter("member_detailAddress");
		String member_extraAddress = request.getParameter("member_extraAddress");
		String member_tel = request.getParameter("member_tel");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String mileage_cost =request.getParameter("mileage_cost");
		String mileage_use = request.getParameter("mileage_use");
		System.out.println(mileage_cost);
		System.out.println(member_id);
		
		//디테일 인서트
		
		String[] product_price = request.getParameterValues("product_price");
		String[] product_number = request.getParameterValues("product_number");
		String[] product_quantity = request.getParameterValues("product_quantity");
		String[] product_name = request.getParameterValues("product_name");

		List<orderVO> ord = new ArrayList<orderVO>();
		vo.setOrder_total(order_total);
		vo.setSeller_code(seller_code);
		vo.setMember_postcode(member_postcode);
		vo.setMember_roadAddress(member_roadAddress);
		vo.setMember_detailAddress(member_detailAddress);
		vo.setMember_extraAddress(member_extraAddress);
		vo.setMember_tel(member_tel);
		vo.setMember_name(member_name);
		vo.setMember_email(member_email);
		vo.setMileage_cost(mileage_cost);
		vo.setMileage_use(mileage_use);
		
		vo.setLast(orderDAO.getInstance().Insertoutput(vo));
		
		for(int i=0;  i<product_number.length; i++) {
			vo.setProduct_number(product_number[i]);
			vo.setProduct_price(product_price[i]);
			vo.setProduct_quantity(product_quantity[i]);
			vo.setProduct_name(product_name[i]);
			orderDAO.getInstance().InsertDetail(vo);
			ord.add(vo);
		}
		int r = orderDAO.getInstance().Insertmileage(vo);
		System.out.println(r + "건이 들어갔다.");
		
		if(mileage_use != null && !mileage_use.equals("") && !mileage_use.equals("0")) {
			vo.setMileage_use(mileage_use);
			orderDAO.getInstance().Usemileage(vo);
		}
		
		request.setAttribute("ord", ord);
		request.getSession().setAttribute("ord", "ord");
		
		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);
		
	}
}
