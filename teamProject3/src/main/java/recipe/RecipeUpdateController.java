package recipe;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.Controller;
import model.ProductVO;
import model.RecipeDAO;
import model.RecipePhotoVO;
import model.RecipeVO;

public class RecipeUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recipe_name = request.getParameter("recipe_name");
		
		RecipeVO recipeboard = new RecipeVO();
		recipeboard.setRecipe_name(recipe_name);
		recipeboard.setRecipe_content(request.getParameter("recipe_content"));
		recipeboard.setRecipe_number(Integer.parseInt(request.getParameter("recipe_number")));
		recipeboard.setCooking_time(request.getParameter("cooking_time"));
		recipeboard.setCooking_level(request.getParameter("cooking_level"));
		
		Part part1 = request.getPart("main_img");
		String fileName = getFileName(part1);
		String path = request.getServletContext().getRealPath("images");
		System.out.println(path); 
		File renameFile = common.FileRenamePolicy.rename(new File(path, fileName));
		part1.write(path +"/"+ renameFile.getName());
		recipeboard.setMain_img(renameFile.getName());
		
		
		ProductVO product = new ProductVO();
		product.setProduct_name(request.getParameter("product_name"));
		product.setProduct_unit(request.getParameter("product_unit"));
		product.setProduct_price(Integer.parseInt(request.getParameter("product_price")));

		
		
		
		RecipePhotoVO photo = new RecipePhotoVO();
		photo.setCooking_content(request.getParameter("cooking_content"));
		photo.setCooking_photo_name(request.getParameter("cooking_photo_name"));
		

		RecipeDAO DAO = new RecipeDAO();
		DAO.recipeUpdate(recipeboard);
				
		request.getRequestDispatcher("recipeBoard.do").forward(request, response);

	}
	
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
