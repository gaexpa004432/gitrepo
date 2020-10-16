package buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.orderDAO;
import model.orderVO;

public class orderOutputController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderVO VO = new orderVO();
		
		Integer order_number = Integer.parseInt(request.getParameter("order_number"));	
		VO.setRecipe_number(order_number);
		
		String member_id = //request.getParameter("member_id");
		(String) request.getSession().getAttribute("id");
		VO.setMember_id(member_id);
		
		ArrayList<orderVO> list = orderDAO.getInstance().getOrderoutput(VO);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);
	}
}
