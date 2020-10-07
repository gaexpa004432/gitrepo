package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DeleteDAO;
import model.MemberVO;

public class MemberDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String member_id = request.getParameter("member_id"); //JSP에서 가져오기 
	String member_pass = request.getParameter("member_pass");
	//사용자가 입력하는 아이디,비밀번호
	MemberVO memberVO = new MemberVO(); //membervo 초기화 
	memberVO = (MemberVO)request.getSession().getAttribute("login");//세션에 있는 로그인정보를 membervo타입의 membervo변수에 담는다
	memberVO.getMember_id(); //memberVO에서 ID랑 패스워드 가져오기
	memberVO.getMember_pass();
	//session의 아이디,비밀번호

	if(member_id.equals(memberVO.getMember_id())&&member_pass.equals(memberVO.getMember_pass())) { //아이디와 비밀번호가 맞다면 탈퇴
		DeleteDAO deleteDAO = new DeleteDAO();
		deleteDAO.delete(member_id);
		request.getSession().invalidate(); //session에 있는 로그인정보를 삭제
		response.sendRedirect("/teamProject3/member/memberLogin.jsp");
		
	}else {
		request.setAttribute("error","아이디와 비밀번호를 다시 확인해주세요");
		request.getRequestDispatcher("/member/memberDelete.jsp").forward(request, response);
		
		//탈퇴하면 게시물까지 다 지울건지 결정하기 나중에 	
	}
  }

}
