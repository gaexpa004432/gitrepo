package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.ProductDAO;
import model.ProductVO;
import model.RecipeDAO;
import model.RecipeVO;

public class RecipeInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recipe_name = request.getParameter("recipe_name");
		String recipe_content = request.getParameter("recipe_content");
		
		RecipeVO recipe = new RecipeVO();
		HttpSession session = ((HttpServletRequest) request).getSession();  //member id 가져오기
		recipe.setMember_id((String) session.getAttribute("id"));
		recipe.setRecipe_name(recipe_name);
		recipe.setRecipe_content(recipe_content);
		
		
		String[] product_name = request.getParameterValues("product_name");
		String[] product_price = request.getParameterValues("product_price");
		String[] product_unit = request.getParameterValues("product_unit");
		String seller_code = request.getParameter("seller_code");
		//System.out.println(product_name + product_price + product_unit + seller_code);

		
		//서비스 처리   db처리
		int r = RecipeDAO.getInstance().recipeInsert(recipe); // 글번호가 반환
		
		for(int a = 0; a < product_name.length; a++) {
			ProductVO product = new ProductVO();
			product.setRecipe_number(r);
			product.setProduct_name(product_name[a]);
			boolean productStatus = ProductDAO.getInstance().productStatus(product);
			if(productStatus == true) {
				product.setProduct_status("Y");
			}else {
				product.setProduct_status("N");
			}
			product.setProduct_price(Integer.parseInt(product_price[a]));
			product.setProduct_unit(product_unit[a]);
			
			ProductDAO.getInstance().productInsert(product);
			
		}
		
		//결과 저장
		request.setAttribute("cnt", r);
		
		//페이지 이동
		request.getRequestDispatcher("/recipe/recipeInsert.jsp").forward(request, response);
	}

}
