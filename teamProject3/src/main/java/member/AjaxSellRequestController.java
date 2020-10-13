package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SellDAO;
import model.SellVO;
import net.sf.json.JSONObject;

public class AjaxSellRequestController implements Controller {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int order_number = Integer.parseInt(request.getParameter("order_number"));
		String order_reason = request.getParameter("order_reason");

		SellVO sellVO = new SellVO();
		sellVO.setOrder_number(order_number);
		sellVO.setOrder_reason(order_reason);
		
		if(sellVO.getOrder_reason() == null) {
			SellDAO.getInstance().updateStatusOa(sellVO);
		} else {			
			SellDAO.getInstance().updateStatusOr(sellVO);
		}
		
		response.setCharacterEncoding("utf-8");//db에 들어갈때는 한글이 인코딩 되어서 들어가는데 나올때 인코딩 되지 않고 나와서 response로 보내줄때 인코딩해서 보내주기
		response.getWriter().print( JSONObject.fromObject(sellVO) );
	}

}
