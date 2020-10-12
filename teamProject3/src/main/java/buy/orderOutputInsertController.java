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
		
		Integer order_total = Integer.parseInt(request.getParameter("order_total"));
		String member_email = request.getParameter("member_email");
		String member_tel = request.getParameter("member_tel");
		String member_name = request.getParameter("member_name");
		String member_address = request.getParameter("member_address");
		
		orderVO vo = new orderVO();
		vo.setOrder_total(order_total);
		vo.setMember_email(member_email);
		vo.setMember_tel(member_tel);
		vo.setMember_name(member_name);
		vo.setMember_address(member_address);
		
		int array = orderDAO.getInstance().Insertoutput(vo);
		
		request.setAttribute("array", array);
		
		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);

	}
}
