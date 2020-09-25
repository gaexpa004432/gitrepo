package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class MemberUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO memberVO = new MemberVO();
		
//		try {//컬럼이 몇개가 됐던 파라미터를 읽어서 vo에 담아 준다.
//			BeanUtils.copyProperties(memberVO, request.getParameterMap());
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pass(request.getParameter("member_newPass"));
		memberVO.setMember_name(request.getParameter("member_name"));
		memberVO.setMember_tel(request.getParameter("member_tel"));
		memberVO.setMember_birth(request.getParameter("member_birth"));
		memberVO.setMember_gender(request.getParameter("member_gender"));
		memberVO.setMember_address(request.getParameter("member_roadAddress"));
		memberVO.setMember_type(request.getParameter("member_type"));
		
		int cnt = MemberDAO.getInstance().update(memberVO);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("memberUpdateOutput.jsp").forward(request, response);
	}

}
