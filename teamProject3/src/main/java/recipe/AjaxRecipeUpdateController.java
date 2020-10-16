package recipe;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import controller.Controller;
import model.RecipeDAO;
import model.RecipePhotoDAO;
import model.RecipePhotoVO;
import model.RecipeVO;

public class AjaxRecipeUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RecipePhotoVO recipeup = new RecipePhotoVO();
		recipeup.setCooking_content(request.getParameter("content"));
		recipeup.setRecipe_number(Integer.parseInt(request.getParameter("number")));
		
		Part part1 = request.getPart("photo_name");
		String fileName = getFileName(part1);
		System.out.println(request.getParameter("number"));
		String path = request.getServletContext().getRealPath("images");
		File renameFile = common.FileRenamePolicy.rename(new File(path, fileName));
		part1.write(path +"/"+ renameFile.getName());		
		recipeup.setCooking_photo_name(renameFile.getName());

		RecipeDAO DAO = new RecipeDAO();
		DAO.recipePhotoUpdate(recipeup);
		
		
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
