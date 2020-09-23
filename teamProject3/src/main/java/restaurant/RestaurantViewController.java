package restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.RestaurantDAO;
import model.RestaurantVO;

public class RestaurantViewController implements Controller {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RestaurantVO restaurant =new RestaurantVO();
		
		restaurant.setRes_no(Integer.parseInt(request.getParameter("res_no")));
		restaurant = RestaurantDAO.getInstance().selectOne(restaurant);
		
		request.setAttribute("res", restaurant);
		request.getRequestDispatcher("/restaurant/restaurantView.jsp").forward(request, response);
	}

}
