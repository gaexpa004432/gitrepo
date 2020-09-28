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
		String favorite_code= request.getParameter("code");
		System.out.println(res_no + favorite_code);
		HttpSession session = ((HttpServletRequest) request).getSession();
		favorite.setMember_id((String) session.getAttribute("id"));
		favorite.setFavorite_no(res_no);
		favorite.setFavorite_code(favorite_code);
		//FavoriteDAO.getInstance().insert(favorite);
		
	}

}
