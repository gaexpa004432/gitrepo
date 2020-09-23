package recipe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProductDAO;
import model.ProductVO;
import model.RecipeVO;

public class ProductListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_name = request.getParameter("product_name");
		System.out.println(product_name);
		
		ProductVO prod = new ProductVO();
		prod.setProduct_name(product_name);
		
		//서비스 처리
		ArrayList<ProductVO> list = ProductDAO.getInstance().productSelectAll(null);
		
		//결과 저장
		request.setAttribute("list", list);
		
		//페이지 이동
		request.getRequestDispatcher("/recipe/recipeInsert.jsp").forward(request, response);
	}

}
