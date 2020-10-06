package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.InqDAO;
import model.InqVO;
import model.MemberDAO;
import model.MemberVO;

public class MemberInqSelectController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inq_no = Integer.parseInt(request.getParameter("inq_no"));
		
		InqVO inqVO = new InqVO();
		inqVO.setInq_no(inq_no);
		
		InqVO resultVO = InqDAO.getInstance().selectOne(inqVO);
		
		int seller_code = resultVO.getSeller_code();
		
		MemberVO memberVO = new MemberVO();
		memberVO.setSeller_code(seller_code);
		
		MemberVO resultVO2 = MemberDAO.getInstance().selectSellerId(memberVO);
		
		request.setAttribute("inqOne", resultVO);
		request.setAttribute("sellerInfo", resultVO2);
		
		request.getRequestDispatcher("/member/inqSelect.jsp").forward(request, response);
	}

}
