package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.RecipeDAO;
import model.RecipeVO;

public class RecipeInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recipe_name = request.getParameter("recipe_name");
		String recipe_content = request.getParameter("recipe_content");
		String member_id = request.getParameter("member_id");
		
		RecipeVO recipe = new RecipeVO();
		recipe.setRecipe_name(recipe_name);
		recipe.setRecipe_content(recipe_content);
//		recipe.setProduct_insert_content(product_insert_content);
//		recipe.setNew_prod(new_prod);
		System.out.println(recipe_name);
		
		
		HttpSession session = ((HttpServletRequest) request).getSession();  //member id 가져오기
		recipe.setMember_id((String) session.getAttribute("id"));
		
		
		//서비스 처리   db처리
		int r = RecipeDAO.getInstance().recipeInsert(recipe);
//		int r = RecipeDAO.getInstance().recipeInsert(recipe);
		
		//결과 저장
		request.setAttribute("cnt", r);
		
		//페이지 이동
		request.getRequestDispatcher("/recipe/recipeInsert.jsp").forward(request, response);
	}

}
