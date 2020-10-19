package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SearchDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AjaxKeywordController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String keyword = request.getParameter("keyword"); 
		JSONArray arrayObj=new JSONArray(); 
		JSONObject jsonObj = null;

		ArrayList<String> list1 = SearchDAO.getInstance().resName(keyword);
		ArrayList<String> list2 = SearchDAO.getInstance().recipeName(keyword);
		ArrayList<String> list3 = SearchDAO.getInstance().productName(keyword);
		 
		ArrayList<String> joined = new ArrayList<String>(); 
		joined.addAll(list1);
		joined.addAll(list2); 
		joined.addAll(list3);
		System.out.println(joined.toString());
		
		for(String str : joined) { 
			jsonObj = new JSONObject(); 
			jsonObj.put("data", str); //jsp페이지로 값들을 넘겨 주는데 , 중괄호 안에서 필드명을 여기서 정해줄수 있음. [{"data":"토마토스파게티"},{"data":"마토마토토마토"}]
			arrayObj.add(jsonObj); 
		}
		
//		String result = JSONArray.fromObject(joined).toString();
		
		PrintWriter pw = response.getWriter();
		pw.print(arrayObj);
		pw.flush();
		pw.close();
		
	}
}
