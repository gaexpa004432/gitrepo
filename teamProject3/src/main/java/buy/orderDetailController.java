package buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BuyMileageDAO;
import model.MemberVO;
import model.orderDetailDAO;
import model.orderVO;

public class orderDetailController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderVO VO = new orderVO();
		
		@SuppressWarnings("unchecked")
		ArrayList<orderVO> ord = (ArrayList<orderVO>) request.getSession().getAttribute("session_cart");
		request.getSession().setAttribute("ord", ord);
		
		String member_id = //request.getParameter("member_id");
		(String) request.getSession().getAttribute("id");
		VO.setMember_id(member_id);
		
		MemberVO vo = (MemberVO) request.getSession().getAttribute("login");
		request.getSession().setAttribute("vo", vo);

		ArrayList<orderVO> array = orderDetailDAO.getInstance().selectOrder(VO);
		orderVO mil = BuyMileageDAO.getInstance().selectOne(VO);
		
		request.setAttribute("mil", mil);
		request.setAttribute("array", array);

		request.getRequestDispatcher("/buy/buyDetail.jsp").forward(request, response);
		}
	}
