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
		String member_postcode = request.getParameter("member_postcode");
		String member_roadAddress = request.getParameter("member_roadAddress");
		String member_detailAddress = request.getParameter("member_detailAddress");
		String member_extraAddress = request.getParameter("member_extraAddress");

		vo.setOrder_total(order_total);
		vo.setMember_postcode(member_postcode);
		vo.setMember_roadAddress(member_roadAddress);
		vo.setMember_detailAddress(member_detailAddress);
		vo.setMember_extraAddress(member_extraAddress);
		
		String member_id = (String) request.getSession().getAttribute("id");//request.getParameter("member_id");
		vo.setMember_id(member_id);

		int ord = orderDAO.getInstance().Insertoutput(vo);
		
		request.setAttribute("ord", ord);

		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);

	}
}
