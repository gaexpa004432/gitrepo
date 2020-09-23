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
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_unit = request.getParameter("product_unit");
		String seller_code = request.getParameter("seller_code");
		String product_img = request.getParameter("product_img");
		System.out.println(product_name + product_price + product_unit + seller_code);
		
		ProductVO product = new ProductVO();
		product.setProduct_name(product_name);
		product.setProduct_price(Integer.parseInt(product_price));
		product.setProduct_unit(product_unit);
		product.setSeller_code(Integer.parseInt(seller_code));
		product.setProduct_img(product_img);
		
		//서비스 처리   db처리
		int r = ProductDAO.getInstance().productInsert(product);
		
		//결과 저장
		request.setAttribute("cnt", r);
	}

}
