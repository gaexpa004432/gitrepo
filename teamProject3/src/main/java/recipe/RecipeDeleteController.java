package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.RecipeDAO;
import model.RecipeVO;

public class RecipeDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recipe_number=Integer.parseInt(request.getParameter("recipe_number"));
		RecipeVO recipeboard = new RecipeVO();
		recipeboard.setRecipe_number(recipe_number);
		RecipeDAO DAO = new RecipeDAO();
		DAO.recipeDelete(recipeboard);
		
		//forward
	    request.getRequestDispatcher("recipeBoard.do").forward(request, response);
	}

}
