package buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class CartController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] recipe_number =  request.getParameterValues("product_number");
		 //for(String str:recipe_number) { System.out.println(str); }
		request.getSession().setAttribute("product",recipe_number);
	}

}
