package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.InqDAO;
import model.InqVO;

public class MemberInqInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = (String) request.getSession().getAttribute("id");
		int seller_code = Integer.parseInt(request.getParameter("seller_code"));
		String inq_title = request.getParameter("inq_title");
		String inq_content = request.getParameter("inq_content");
		
		InqVO inqVO = new InqVO();
		inqVO.setMember_id(member_id);
		inqVO.setSeller_code(seller_code);
		inqVO.setInq_title(inq_title);
		inqVO.setInq_content(inq_content);
		
		int r = InqDAO.getInstance().insert(inqVO);
		System.out.println(r+"건이 실행됨");
		
		request.setAttribute("cnt", r);
		
		request.getRequestDispatcher("/member/inqInsertOutput.jsp").forward(request, response);
	}

}
