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
import model.RecipeReviewDAO;
import model.RecipeReviewVO;
import model.RestaurantReviewDAO;
import model.RestaurantReviewVO;

public class RecipeReviewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeReviewVO recipe = new RecipeReviewVO();

		recipe.setRecipe_review_content(request.getParameter("recipe_reivew_content"));
		int no = Integer.parseInt(request.getParameter("recipe_no"));
		recipe.setRecipe_number(no);
		HttpSession session =  request.getSession();
		recipe.setMember_id((String) session.getAttribute("id"));

		Part part1 = request.getPart("recipe_review_file");
		String fileName1 =getFileName(part1);// Long.toString(System.currentTimeMillis());
		String path1 = request.getServletContext().getRealPath("/images"); // "c:/upload";
		 if(fileName1 != null && !fileName1.isEmpty()) {
			 
			 
		// 파일명 중복체크
		File renameFile1=common.FileRenamePolicy.rename(new File(path1, fileName1));
		part1.write(path1 + "/" + renameFile1.getName());
		recipe.setRecipe_review_file(renameFile1.getName());
		
		 }
		RecipeReviewDAO.getInstance().insert(recipe);
		 
		response.sendRedirect("recipeView.do?recipe_number="+no);

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