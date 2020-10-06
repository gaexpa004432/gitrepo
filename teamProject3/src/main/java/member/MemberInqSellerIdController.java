package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class MemberInqSellerIdController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//판매자의 member_id
		String member_id = request.getParameter("member_id");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		
		MemberVO resultVO = MemberDAO.getInstance().selectOne(memberVO);
		
		request.setAttribute("sellerInfo", resultVO);
		
		request.getRequestDispatcher("/member/inqInsert.jsp").forward(request, response);
	}

}
