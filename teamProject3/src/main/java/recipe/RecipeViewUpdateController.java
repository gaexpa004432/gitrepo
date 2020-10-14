package recipe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProductDAO;
import model.ProductVO;
import model.RecipeDAO;
import model.RecipePhotoDAO;
import model.RecipePhotoVO;
import model.RecipeVO;

public class RecipeViewUpdateController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/recipe/recipeUpdate.jsp";

		RecipeDAO dao = new RecipeDAO();
		RecipeVO vo = new RecipeVO();
		vo.setRecipe_number(Integer.parseInt(request.getParameter("recipe_number")));
		vo = dao.recipeSelectOne(vo);

		ProductDAO pdao = new ProductDAO();
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO pvo = new ProductVO();
		pvo.setRecipe_number(Integer.parseInt(request.getParameter("recipe_number")));
		list = pdao.productSelectAll(pvo);
		 
		RecipePhotoDAO pdao1 = new RecipePhotoDAO();
		List<RecipePhotoVO> list1 = new ArrayList<RecipePhotoVO>();
		RecipePhotoVO pvo1 = new RecipePhotoVO();
		pvo1.setRecipe_number(Integer.parseInt(request.getParameter("recipe_number")));
		list1 = pdao1.selectOne(vo);
		
		
		String content = vo.getRecipe_content().replaceAll("\r\n", "<br>");
		vo.setRecipe_content(content);
		request.setAttribute("recipe", vo);
		request.setAttribute("product", list);
		request.setAttribute("photo", list1);
		request.getRequestDispatcher(url).forward(request, response);

	}
}
