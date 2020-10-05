package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import controller.Controller;
import model.SellerDAO;
import model.SellerVO;

public class MemberAddUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SellerVO sellerVO = new SellerVO();
		
		try {
			BeanUtils.copyProperties(sellerVO, request.getParameterMap());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		int cnt = SellerDAO.getInstance().update(sellerVO);
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("memberAddUpdateOutput.jsp").forward(request, response);
	}

}
