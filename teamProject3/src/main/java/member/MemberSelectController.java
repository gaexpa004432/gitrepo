package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class MemberSelectController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getSession().getAttribute("id");
		
		MemberVO member = new MemberVO();
		member.setMember_id(id);
		
		//MemberVO resultVO = MemberDAO.getInstance().selectOne(member);
		MemberVO resultVO = (MemberVO) request.getSession().getAttribute("login");
		
		request.setAttribute("member", resultVO);

		request.getSession().setAttribute("login", resultVO);

		
		request.getRequestDispatcher("/member/memberUpdate.jsp").forward(request, response);
	}

}
