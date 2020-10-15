package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.RecipeReviewDAO;
import model.RecipeReviewVO;

public class RecipeReviewDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RecipeReviewVO reviewVO = new RecipeReviewVO(); 
		int recipe_review_no = Integer.parseInt(request.getParameter("recipe_review_no"));
		int recipe_no = Integer.parseInt(request.getParameter("recipe_number"));
		reviewVO.setRecipe_review_no(recipe_review_no);
		RecipeReviewDAO.getInstance().delete(reviewVO);
		request.setAttribute("recipe_number", recipe_no);
		request.getRequestDispatcher("/recipeView.do").forward(request, response);

		
	}

}
