package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.InqDAO;
import model.InqVO;

public class MemberAnsUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inq_no = Integer.parseInt(request.getParameter("inq_no"));
		String inq_answer = request.getParameter("inq_answer");
		
		InqVO inqVO = new InqVO();
		inqVO.setInq_no(inq_no);
		inqVO.setInq_answer(inq_answer);
		
		int r = InqDAO.getInstance().answerRply(inqVO);
		
		request.setAttribute("cnt", r);
		
		request.getRequestDispatcher("/member/ansSelectOutput.jsp").forward(request, response);
	}

}
