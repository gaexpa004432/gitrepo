package buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberVO;
import model.orderListDAO;
import model.orderVO;

public class orderListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		orderVO vo = new orderVO();
		
		String member_id = //request.getParameter("member_id");
				(String) request.getSession().getAttribute("id");
				vo.setMember_id(member_id);
				
		MemberVO VO = (MemberVO) request.getSession().getAttribute("login");
		request.getSession().setAttribute("VO", VO);
		
		String order_number = request.getParameter("order_number");
		vo.setOrder_number(order_number);
		
		ArrayList<orderVO> list = orderListDAO.getInstance().selectOrderOutput(vo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/buy/orderList.jsp").forward(request, response);
	}

}

