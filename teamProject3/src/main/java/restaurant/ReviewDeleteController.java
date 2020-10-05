package restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.RestaurantReviewDAO;
import model.RestaurantReviewVO;

public class ReviewDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RestaurantReviewVO reviewVO = new RestaurantReviewVO(); 
		int review_no = Integer.parseInt(request.getParameter("res_review_no"));
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		reviewVO.setRes_review_no(review_no);
		RestaurantReviewDAO.getInstance().delete(reviewVO);
		request.setAttribute("res_no", res_no);
		request.getRequestDispatcher("/restaurantView.do").forward(request, response);
	}

}
