package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.RecipeDAO;
import model.RecipeVO;

public class RecipeBoardController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  RecipeVO recipe = new RecipeVO();
	      
		 	String p = request.getParameter("p");
			String search = request.getParameter("recipe_search");
			
			//유효성 체크
			int page = 1;
			if(p != null) {
				page = Integer.parseInt(p);
			}
			Paging paging = new Paging();
			paging.setPageUnit(8); //들고 올 레코드 개수
			paging.setPageSize(5); //페이징 번호 개수
			paging.setPage(page);
			
			recipe.setRecipe_name(search);
			paging.setTotalRecord(RecipeDAO.getInstance().count(recipe));
			recipe.setFirst(paging.getFirst());
			recipe.setLast(paging.getLast());
			
		request.setAttribute("paging", paging);
		request.setAttribute("list", RecipeDAO.getInstance().selectAll(recipe));
		request.getRequestDispatcher("/recipe/recipeBoard.jsp").forward(request, response);
	}

}
