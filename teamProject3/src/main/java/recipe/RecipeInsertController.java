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
		
		RecipePhotoVO photo = new RecipePhotoVO();
		RecipeVO recipe = new RecipeVO();
		HttpSession session = ((HttpServletRequest) request).getSession(); // member id 가져오기
		recipe.setMember_id((String) session.getAttribute("id"));
		recipe.setRecipe_name(request.getParameter("recipe_name"));
		recipe.setRecipe_content(request.getParameter("recipe_content"));
		recipe.setCooking_time(request.getParameter("cooking_time"));
		recipe.setCooking_level(request.getParameter("cooking_level"));
		
		
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
		//판매재료 받기
		String[] product_name = request.getParameterValues("product_name");
		String[] product_price = request.getParameterValues("product_price");
		String[] product_unit = request.getParameterValues("product_unit");
		//비판매재료 받기
		String[] non_product_name = request.getParameterValues("non_product_name");
		String[] non_product_unit = request.getParameterValues("non_product_unit");
		
		// 서비스 처리 db처리
		System.out.println(recipe.toString());
		int r = RecipeDAO.getInstance().recipeInsert(recipe); // 글번호가 반환
		MemberVO membervo = (MemberVO) request.getSession().getAttribute("login");
		 int sellerCode = membervo.getSeller_code();
		
		
		for (int a = 0; a < product_name.length; a++) {
			ProductVO product = new ProductVO();
			product.setSeller_code(sellerCode);
			product.setRecipe_number(r);
			product.setProduct_name(product_name[a]);
			boolean productStatus = ProductDAO.getInstance().productStatus(product);
			if (productStatus == true) {
				product.setProduct_status("Y");
			} else {
				product.setProduct_status("N");
			}
			product.setProduct_code("prod");
			product.setProduct_price(Integer.parseInt(product_price[a]));
			product.setProduct_unit(product_unit[a]);

			ProductDAO.getInstance().productInsert(product);
		}

		//상품 코드 분류~~db 처리
		sellerCode = membervo.getSeller_code();
		for (int a = 0; a < non_product_name.length; a++) {
			ProductVO product1 = new ProductVO();
			product1.setSeller_code(sellerCode);
			product1.setRecipe_number(r);
			product1.setProduct_name(non_product_name[a]);
			boolean product_code = ProductDAO.getInstance().productStatus(product1);
			if (product_code == true) {
				product1.setProduct_status("Y");
			} else {
				product1.setProduct_status("N");
			}
			product1.setProduct_code("non_prod");
			
			product1.setProduct_unit(non_product_unit[a]);

			ProductDAO.getInstance().productInsert(product1);
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
