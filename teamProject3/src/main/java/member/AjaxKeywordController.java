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
		
		String keyword = request.getParameter("keyword"); 
		JSONArray arrayObj=new JSONArray(); 
		JSONObject jsonObj = null;

		ArrayList<String> list1 = SearchDAO.getInstance().resName(keyword);
		ArrayList<String> list2 = SearchDAO.getInstance().recipeName(keyword);
		 
		ArrayList<String> joined = new ArrayList<String>(); 
		joined.addAll(list1);
		joined.addAll(list2); 
		System.out.println(joined.toString());
		
		for(String str : joined) { 
			jsonObj = new JSONObject(); 
			jsonObj.put("data", str); 
			arrayObj.add(jsonObj); 
		}
		
//		String result = JSONArray.fromObject(joined).toString();
		
		PrintWriter pw = response.getWriter();
		pw.print(arrayObj);
		pw.flush();
		pw.close();
		
	}
}
