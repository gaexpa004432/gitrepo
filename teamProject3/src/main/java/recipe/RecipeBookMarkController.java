package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;

public class RecipeBookMarkController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteVO favorite = new FavoriteVO();
		String recipe_no = request.getParameter("recipe_no");
		String bookmark = request.getParameter("bookmark");
		String favorite_recipe_code = request.getParameter("recipe_code");
		HttpSession session = ((HttpServletRequest) request).getSession();
		favorite.setMember_id((String) session.getAttribute("id"));
		favorite.setFavorite_no(Integer.parseInt(recipe_no));
		favorite.setFavorite_code(favorite_recipe_code);

		if (bookmark.equals("insert")) {
			FavoriteDAO.getInstance().insert(favorite);
		} else {
			FavoriteDAO.getInstance().delete(favorite);
		}
	}
}
