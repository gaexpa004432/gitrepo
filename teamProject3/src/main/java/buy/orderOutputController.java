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

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		orderVO VO = new orderVO();
		
		String member_id = //request.getParameter("member_id");
		(String) request.getSession().getAttribute("id");
		VO.setMember_id(member_id);
		
		ArrayList<orderVO> list = orderDAO.getInstance().getOrder(VO);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/buy/buyOutput.jsp").forward(request, response);

	}

}