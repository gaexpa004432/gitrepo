package buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class CartController implements Controller {

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] recipe_number =  request.getParameterValues("product_number");
		List<String[]> list = null;
		if (request.getSession().getAttribute("product") == null) { 
			//현재 세션에 장바구니가 저장되어있는지 체크
			list = new ArrayList<String[]>();	
		}else {
			list = (List<String[]>)request.getSession().getAttribute("product"); 
			// 저장되어있다면 list 변수에 들고옴
		} 
		list.add(recipe_number); // 장바구니 리스트에 현재 장바구니 추가
		
		
		request.getSession().setAttribute("product", list); // 컬렉션안에 배열이 저장된형태
		
		request.getRequestDispatcher("/buy/cart.jsp").forward(request, response);
		
	}

}
