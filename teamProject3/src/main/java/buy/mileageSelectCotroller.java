package buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BuyMileageDAO;
import model.orderVO;

public class mileageSelectCotroller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderVO vo = new orderVO();
		
		int remaining = Integer.parseInt(request.getParameter("remaining")); 
		//request.getParameter("member_id");
		vo.setRemaining(remaining);

		orderVO mil = BuyMileageDAO.getInstance().selectOne(vo);
		
		request.setAttribute("mil", mil);
		
		request.getRequestDispatcher("/buy/buyDetail.jsp").forward(request, response);
	}

}
