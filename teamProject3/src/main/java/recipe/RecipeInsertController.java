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
import model.MemberVO;
import model.ProductDAO;
import model.ProductVO;
import model.RecipeDAO;
import model.RecipePhotoDAO;
import model.RecipePhotoVO;
import model.RecipeVO;

public class RecipeInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recipe_name = request.getParameter("recipe_name");
		String recipe_content = request.getParameter("recipe_content");
		String cooking_time = request.getParameter("cooking_time");
		String cooking_level = request.getParameter("cooking_level");

		RecipePhotoVO photo = new RecipePhotoVO();
		RecipeVO recipe = new RecipeVO();
		HttpSession session = ((HttpServletRequest) request).getSession(); // member id 가져오기
		recipe.setMember_id((String) session.getAttribute("id"));
		recipe.setRecipe_name(recipe_name);
		recipe.setRecipe_content(recipe_content);
		recipe.setCooking_time(cooking_time);
		recipe.setCooking_level(cooking_level);

		// 첨부파일 처리
		Part part1 = request.getPart("main_img");
		String fileName1 =getFileName(part1);// Long.toString(System.currentTimeMillis());
		String path1 = request.getServletContext().getRealPath("/images"); // "c:/upload";
		System.out.println(fileName1); 
		 if(fileName1 != null && !fileName1.isEmpty()) {
		// 파일명 중복체크
		File renameFile1=common.FileRenamePolicy.rename(new File(path1, fileName1));
		part1.write(path1 + "/" + renameFile1.getName());
		recipe.setMain_img(renameFile1.getName());
		 }

		String[] product_name = request.getParameterValues("product_name");
		String[] product_price = request.getParameterValues("product_price");
		String[] product_unit = request.getParameterValues("product_unit");

		// 서비스 처리 db처리
		System.out.println(recipe.toString());
		int r = RecipeDAO.getInstance().recipeInsert(recipe); // 글번호가 반환
		MemberVO membervo = (MemberVO) request.getSession().getAttribute("login");
		// int sellerCode = membervo.getSeller_code();
		for (int a = 0; a < product_name.length; a++) {
			ProductVO product = new ProductVO();
			// product.setSeller_code(sellerCode);
			product.setRecipe_number(r);
			product.setProduct_name(product_name[a]);
			boolean productStatus = ProductDAO.getInstance().productStatus(product);
			if (productStatus == true) {
				product.setProduct_status("Y");
			} else {
				product.setProduct_status("N");
			}
			product.setProduct_price(Integer.parseInt(product_price[a]));
			product.setProduct_unit(product_unit[a]);

			ProductDAO.getInstance().productInsert(product);
		}

		// 레시피 과정
		String[] cooking_step = request.getParameterValues("cooking_step");

		int cnt = 0;
		int ignore = 0;
		Collection<Part> fileList = request.getParts(); // 모든 파라미터를 파트타입으로 불러옴

		List<RecipePhotoVO> renameArray = new ArrayList<RecipePhotoVO>();

		for (Part part : fileList) { // 파트수만큼 반복

			if (getFileName(part) != null) { // 파일타입으로 받아온 파라미터만 값을 가지고 있음
				if (ignore == 0) {
					ignore++;
					continue;
				}
				String filename = getFileName(part);
				String path = request.getServletContext().getRealPath("/images");
				System.out.println(path);
				File renamefile = FileRenamePolicy.rename(new File(path, filename));
				
				part.write(path + "/" + renamefile.getName());
				
				photo.setCooking_photo_name(renamefile.getName());
				photo.setCooking_content(cooking_step[cnt++]);
				photo.setRecipe_number(r);
				RecipePhotoDAO.getInstance().recipe_photoInsert(photo);
			}

		}

		// 결과 저장
		

		// 페이지 이동
		response.sendRedirect("recipeBoard.do"); 
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
