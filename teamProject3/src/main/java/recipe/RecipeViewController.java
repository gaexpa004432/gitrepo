package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProductDAO;
import model.RecipeDAO;
import model.RecipePhotoDAO;
import model.RecipeVO;

public class RecipeViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeVO recipe = new RecipeVO();
		int recipe_number = Integer.parseInt(request.getParameter("recipe_number"));
		recipe.setRecipe_number(recipe_number);
		RecipeDAO.getInstance().selectOne(recipe);
		System.out.println(recipe_number);
		
		
		request.setAttribute("recipe", RecipeDAO.getInstance().selectOne(recipe));
		request.setAttribute("photo", RecipePhotoDAO.getInstance().selectOne(recipe));
		request.setAttribute("product", ProductDAO.getInstance().productSelectOne(recipe));
		request.getRequestDispatcher("/recipe/recipeView.jsp").forward(request, response);
	
		
	} 

}
