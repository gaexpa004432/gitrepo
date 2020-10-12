package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberVO;
import model.SellDAO;
import model.SellVO;
import net.sf.json.JSONArray;

public class AjaxSellListController implements Controller {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO login = (MemberVO)request.getSession().getAttribute("login");
		int seller_code = login.getSeller_code();
		
		SellVO sellVO = new SellVO();
		sellVO.setSeller_code(seller_code);
		
		ArrayList<SellVO> list = SellDAO.getInstance().sellRecipe(sellVO);
		String result = JSONArray.fromObject(list).toString();
		System.out.println(result); 
		response.getWriter().print(result);
	}

}
