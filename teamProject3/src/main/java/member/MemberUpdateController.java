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
		MemberVO resultVO = new MemberVO();
		
//		try {//컬럼이 몇개가 됐던 파라미터를 읽어서 vo에 담아 준다.
//			BeanUtils.copyProperties(memberVO, request.getParameterMap());
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		String passVal = request.getParameter("member_pass");
		String page = "";
		
		if(passVal=="") {
			memberVO.setMember_id(request.getParameter("member_id"));
			memberVO.setMember_pass((String)request.getSession().getAttribute("pass"));
			memberVO.setMember_name(request.getParameter("member_name"));
			memberVO.setMember_tel(request.getParameter("member_tel"));
			memberVO.setMember_birth(request.getParameter("member_birth"));
			memberVO.setMember_gender(request.getParameter("member_gender"));
			memberVO.setMember_address(request.getParameter("member_roadAddress"));
			memberVO.setMember_type(request.getParameter("member_type"));
			
			//resultVO = MemberDAO.getInstance().selectOne(memberVO);
			System.out.println("memberVO 1 : " + memberVO);
			
			int cnt = MemberDAO.getInstance().update(memberVO);
			request.setAttribute("cnt", cnt);
			
			request.getSession().setAttribute("login", memberVO);
			request.getSession().setAttribute("pass", memberVO.getMember_pass());
			page = "memberUpdateOutput.jsp";
		} else if (passVal!="") {
			if (!passVal.equals(request.getSession().getAttribute("pass"))) {
				request.setAttribute("errormsg", "현재 비밀번호가 일치 하지 않습니다");
				page = "memberUpdate.jsp";
			} else {
				if (request.getParameter("member_newPass")=="") {
					request.setAttribute("errormsg", "새 비밀번호를 입력하세요");
					page = "memberUpdate.jsp";
				} else {
				memberVO.setMember_id(request.getParameter("member_id"));
				memberVO.setMember_pass(request.getParameter("member_newPass"));
				memberVO.setMember_name(request.getParameter("member_name"));
				memberVO.setMember_tel(request.getParameter("member_tel"));
				memberVO.setMember_birth(request.getParameter("member_birth"));
				memberVO.setMember_gender(request.getParameter("member_gender"));
				memberVO.setMember_address(request.getParameter("member_roadAddress"));
				memberVO.setMember_type(request.getParameter("member_type"));
				
				
				//resultVO = MemberDAO.getInstance().selectOne(memberVO);
				System.out.println("memberVO 2 : " + memberVO);
				
				int cnt = MemberDAO.getInstance().update(memberVO);
				request.setAttribute("cnt", cnt);
				
				request.getSession().setAttribute("login", memberVO);
				request.getSession().setAttribute("pass", memberVO.getMember_pass());
				page = "memberUpdateOutput.jsp";
				}
			}
		}
		
		//System.out.println("담기기 전 : " + memberVO);
		
//		int cnt = MemberDAO.getInstance().update(memberVO);
//		request.setAttribute("cnt", cnt);
		
		//System.out.println("담긴 후 : " + memberVO);
		
		//System.out.println("수정 전 : " + request.getSession().getAttribute("login")); 
		//System.out.println("수정후 : " + request.getSession().getAttribute("updatedMember"));
		request.getRequestDispatcher(page).forward(request, response);
	}

}
