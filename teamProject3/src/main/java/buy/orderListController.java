package buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.orderListDAO;
import model.orderVO;

public class orderListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		orderVO vo = new orderVO();
		
		String member_id = //request.getParameter("member_id");
				(String) request.getSession().getAttribute("id");
				vo.setMember_id(member_id);
		
		Integer order_number = Integer.parseInt(request.getParameter("order_number"));
		vo.setOrder_number(order_number);
						
		request.getRequestDispatcher("/member/orderList.jsp").forward(request, response);
	}

}
