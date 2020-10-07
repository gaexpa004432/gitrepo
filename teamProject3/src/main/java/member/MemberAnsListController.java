package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.InqDAO;
import model.InqVO;
import model.MemberVO;

public class MemberAnsListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO login = (MemberVO)request.getSession().getAttribute("login");
		
		int seller_code = login.getSeller_code();
		
		InqVO inqVO = new InqVO();
		inqVO.setSeller_code(seller_code);
		
		ArrayList<InqVO> list = InqDAO.getInstance().selectAnsList(inqVO);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/member/ansList.jsp").forward(request, response);
	}

}
