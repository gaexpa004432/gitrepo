package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.InqDAO;
import model.InqVO;

public class MemberAnsSelectController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inq_no = Integer.parseInt(request.getParameter("inq_no"));
		
		InqVO inqVO = new InqVO();
		inqVO.setInq_no(inq_no);
		
		InqVO resultVO = InqDAO.getInstance().selectOne(inqVO);
		
		request.setAttribute("inqOne", resultVO);
		
		request.getRequestDispatcher("/member/ansSelect.jsp").forward(request, response);
	}

}
