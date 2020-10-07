package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProductDAO;
import model.ProductVO;

public class ProductInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] product_name = request.getParameterValues("product_name");
		String[] product_price = request.getParameterValues("product_price");
		String[] product_unit = request.getParameterValues("product_unit");
		String seller_code = request.getParameter("seller_code");
		//System.out.println(product_name + product_price + product_unit + seller_code);
		
		
		
		
		
		
		
		
		
		
		for(int a = 0; a < product_name.length; a++) {
			ProductVO product = new ProductVO();
			 product.setProduct_name(product_name[a]);
			 product.setProduct_price(Integer.parseInt(product_price[a]));
			 product.setProduct_unit(product_unit[a]);
			 
			 int r = ProductDAO.getInstance().productInsert(product);
			 
		}
		
	
		
		// product.setProduct_name(product_name);
		/*
		 * product.setProduct_price(Integer.parseInt(product_price));
		 * product.setProduct_unit(product_unit);
		 * product.setSeller_code(Integer.parseInt(seller_code));
		 */
		
		//서비스 처리   db처리
		
		//결과 저장
		//request.setAttribute("cnt", r);
		
		//페이지 이동
		request.getRequestDispatcher("/recipe/productInsert.jsp").forward(request, response);
	}

}
