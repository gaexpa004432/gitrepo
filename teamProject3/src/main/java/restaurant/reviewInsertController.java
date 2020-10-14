package restaurant;

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
import model.RestaurantReviewDAO;
import model.RestaurantReviewVO;

public class reviewInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RestaurantReviewVO restaurant = new RestaurantReviewVO();

		restaurant.setRes_review_content(request.getParameter("res_review_content"));
		int no = Integer.parseInt(request.getParameter("res_no"));
		restaurant.setRes_no(no);
		HttpSession session = ((HttpServletRequest) request).getSession();
		restaurant.setMember_id((String) session.getAttribute("id"));

		Collection<Part> fileList = request.getParts(); // 모든 파라미터를 파트타입으로 불러옴
		List<String> renameArray = new ArrayList<String>();
		for (Part part : fileList) { // 파트수만큼 반복
			if (getFileName(part) != null) { // 파일타입으로 받아온 파라미터만 값을 가지고 있음

				String filename = getFileName(part);
				
				String path = request.getServletContext().getRealPath("/images");
				System.out.println(path);
				// 중복체크
				File renamefile = FileRenamePolicy.rename(new File(path, filename));
				if (!renamefile.getName().equals("images1")) { // 파일이없을경우 저장 방지
					part.write(path + "/" + renamefile.getName());

				}
		
				renameArray.add(renamefile.getName());
			}
		}

		int res_no = RestaurantReviewDAO.getInstance().insert(restaurant);
		
		for (String file : renameArray) {
			if (!file.equals("images1")) { // 파일이 없을경우 실행 안함

				restaurant = new RestaurantReviewVO();
				restaurant.setRes_no(res_no);
				restaurant.setRes_review_content(file);
				RestaurantReviewDAO.getInstance().insert_res_pic(restaurant);
			}
		}
	
		response.sendRedirect("restaurantView.do?res_no="+no+"&focus=0");

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
