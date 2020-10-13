package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Paging;
import controller.Controller;
import model.ProductDAO;
import model.RecipeDAO;
import model.RecipePhotoDAO;
import model.RecipeReviewDAO;
import model.RecipeReviewVO;
import model.RecipeVO;

public class RecipeViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeVO recipe = new RecipeVO();
		
		
		
		HttpSession session = ((HttpServletRequest) request).getSession(); // member id 가져오기
		recipe.setMember_id((String) session.getAttribute("id"));
		int recipe_number = Integer.parseInt(request.getParameter("recipe_number"));
		recipe.setRecipe_number(recipe_number);
		RecipeDAO.getInstance().recipeSelectOne(recipe);
		request.getSession().setAttribute("recipe_number", recipe);
		RecipeVO VO = RecipeDAO.getInstance().recipeSelectOne(recipe);
		RecipeReviewVO reviewvo = new RecipeReviewVO();
		
		 String p = request.getParameter("p");
			
			//유효성 체크
			int page = 1;
			if(p != null) {
				page = Integer.parseInt(p);
			}
			Paging paging = new Paging();
			paging.setPageUnit(5); //들고 올 레코드 개수
			paging.setPageSize(5); //페이징 번호 개수
			paging.setPage(page);
			
			reviewvo.setRecipe_number(recipe_number);
			paging.setTotalRecord(RecipeReviewDAO.getInstance().count(reviewvo));
			reviewvo.setFirst(paging.getFirst());
			reviewvo.setLast(paging.getLast());
			
		request.getSession().setAttribute("cart", reviewvo);
		
		request.setAttribute("paging", paging);
		request.setAttribute("reviewlist", RecipeReviewDAO.getInstance().selectAllReview(reviewvo));
		request.setAttribute("recipe", RecipeDAO.getInstance().recipeSelectOne(recipe));
		request.setAttribute("photo", RecipePhotoDAO.getInstance().selectOne(recipe));
		request.setAttribute("product", ProductDAO.getInstance().productSelectOne(recipe));
		request.setAttribute("member_id", RecipeDAO.getInstance().recipeSelectOne(recipe));
		request.getRequestDispatcher("/recipe/recipeView.jsp").forward(request, response);
	
		
	} 

}
