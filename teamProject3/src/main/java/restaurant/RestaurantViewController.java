package restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.RestaurantDAO;
import model.RestaurantReviewDAO;
import model.RestaurantReviewVO;
import model.RestaurantVO;

public class RestaurantViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RestaurantVO restaurant =new RestaurantVO();
		RestaurantReviewVO restaurantReview = new RestaurantReviewVO();
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		System.out.println(res_no);
		restaurant.setRes_no(res_no);
		restaurantReview.setRes_no(res_no);
		
		restaurant = RestaurantDAO.getInstance().selectOne(restaurant);
		
		
		request.setAttribute("res", restaurant);
		request.setAttribute("review", RestaurantReviewDAO.getInstance().selectAllReview(restaurantReview));
		
		request.getRequestDispatcher("/restaurant/restaurantView.jsp").forward(request, response);
	}

}
