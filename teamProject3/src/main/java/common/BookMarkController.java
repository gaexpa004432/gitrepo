package common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;

public class BookMarkController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteVO favorite = new FavoriteVO(); 
		String res_no = request.getParameter("no");
		String bookmark = request.getParameter("bookmark");
		String favorite_code= request.getParameter("code");
		HttpSession session = request.getSession();
		favorite.setMember_id((String) session.getAttribute("id"));
		favorite.setFavorite_no(Integer.parseInt(res_no));
		favorite.setFavorite_code(favorite_code);
		
		
		if(bookmark.equals("insert")) {
		FavoriteDAO.getInstance().insert(favorite);
		}else{
		FavoriteDAO.getInstance().delete(favorite);
		}
		
	}

}
