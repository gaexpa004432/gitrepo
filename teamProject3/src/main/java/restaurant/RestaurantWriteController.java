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
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import controller.Controller;
import model.RestaurantDAO;
import model.RestaurantVO;

public class RestaurantWriteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RestaurantVO restaurant = new RestaurantVO();
		restaurant.setRes_name(request.getParameter("res_name"));
		restaurant.setRes_content(request.getParameter("res_content"));
		String tel = request.getParameter("res_tel");
		System.out.println(tel);
		String transTel = tel.substring(0, 3)+"-"+tel.substring(3, tel.length()-4)+"-"+tel.substring(tel.length()-4, tel.length());
		restaurant.setRes_tel(transTel);
		restaurant.setRes_si(request.getParameter("res_si"));
		restaurant.setRes_gu(request.getParameter("res_gu"));
		String startM = request.getParameter("startM");
		String endM = request.getParameter("endM");
		if(startM.length()== 1) {
			startM = "0" + startM;
		}
		if(endM.length()== 1) {
			endM = "0"+ endM;
		}
		String res_time = request.getParameter("startH")+" : "+ startM +" ~ "+request.getParameter("endH")+" : "+endM;
		restaurant.setRes_time(res_time);
		restaurant.setRes_extra(request.getParameter("extra"));
		
		
		
		
		Collection<Part> fileList = request.getParts(); // 모든 파라미터를 파트타입으로 불러옴

		List<String> renameArray = new ArrayList<String>(); 
		for(Part part: fileList) {  //파트수만큼 반복
			if(getFileName(part) != null) { // 파일타입으로 받아온 파라미터만 값을 가지고 있음 
				
				
				String filename = getFileName(part); 
				String path = request.getServletContext().getRealPath("/images");
				System.out.println(path); 
				//중복체크
				File renamefile = FileRenamePolicy.rename(new File(path,filename));
				if(!renamefile.getName().equals("images1")) { //파일이없을경우 저장 방지
					part.write(path + "/" + renamefile.getName());
					
				}
				
				renameArray.add(renamefile.getName());
			}
			
			
			}
		
		
		
		
		int res_no = RestaurantDAO.getInstance().insert(restaurant); //글등록과 동시에 글번호 리턴
		for(String file : renameArray) {
			if(!file.equals("images1")) { //파일이 없을경우 실행 안함
				
				restaurant = new RestaurantVO();
				restaurant.setRes_no(res_no);
				restaurant.setRes_name(file);
				RestaurantDAO.getInstance().insert_pic(restaurant);
			}
		}
		
		response.sendRedirect("restaurantBoard.do");
		
		
		
		
		
		
		
		
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

