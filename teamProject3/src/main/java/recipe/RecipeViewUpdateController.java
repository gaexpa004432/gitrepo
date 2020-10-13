package recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProductDAO;
import model.ProductVO;
import model.RecipeDAO;
import model.RecipeVO;

public class RecipeViewUpdateController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/recipe/recipeUpdate.jsp";

		RecipeDAO dao = new RecipeDAO();
		RecipeVO vo = new RecipeVO();
		vo.setRecipe_number(Integer.parseInt(request.getParameter("recipe_number")));
		vo = dao.recipeSelectOne(vo);

//		ProductDAO pdao = new ProductDAO();
//		ProductVO pvo = new ProductVO();
//		pvo.setProduct_number(Integer.parseInt(request.getParameter("product_number")));
//		pvo = pdao.productSelectOne(pvo);
		 
		String content = vo.getRecipe_content().replaceAll("\r\n", "<br>");
		vo.setRecipe_content(content);
		request.setAttribute("recipe", vo);
//		request.setAttribute("product", pvo);
		request.getRequestDispatcher(url).forward(request, response);

	}
}
