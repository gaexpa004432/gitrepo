package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;
import model.SellerDAO;
import model.SellerVO;

public class MemberAddInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seller_code = Integer.parseInt(request.getParameter("seller_code"));
		String seller_roadAddress = request.getParameter("seller_roadAddress");
		String seller_store = request.getParameter("seller_store");
		String seller_tel = request.getParameter("seller_tel");
		String seller_postcode = request.getParameter("seller_postcode");
		String seller_detailAddress = request.getParameter("seller_detailAddress");
		String seller_extraAddress = request.getParameter("seller_extraAddress");
		
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) request.getSession().getAttribute("login");	
		memberVO.setMember_id((String)request.getSession().getAttribute("id"));
		memberVO.setSeller_code(seller_code);
		System.out.println(request.getSession().getAttribute("id"));
		
		SellerVO sellerVO = new SellerVO();
		sellerVO.setSeller_code(seller_code);
		sellerVO.setSeller_roadAddress(seller_roadAddress);
		sellerVO.setSeller_store(seller_store);
		sellerVO.setSeller_tel(seller_tel);
		sellerVO.setSeller_postcode(seller_postcode);
		sellerVO.setSeller_detailAddress(seller_detailAddress);
		sellerVO.setSeller_extraAddress(seller_extraAddress);
		
		memberVO.setSeller_roadAddress(seller_roadAddress);
		memberVO.setSeller_store(seller_store);
		memberVO.setSeller_tel(seller_tel);
		memberVO.setSeller_postcode(seller_postcode);
		memberVO.setSeller_detailAddress(seller_detailAddress);
		memberVO.setSeller_extraAddress(seller_extraAddress);
		
		//참조 무결성(외래키참조)에 의해서 먼저 부모테이블인 seller 테이블에 등록 된 후에 member테이블에 업데이트 되도록 해야 함
		int r = SellerDAO.getInstance().insert(sellerVO);
		int n = MemberDAO.getInstance().updateSellerCode(memberVO);
		
		request.setAttribute("cnt", r);
		request.getSession().setAttribute("login", memberVO);
		request.setAttribute("sellerStore", sellerVO.getSeller_store());
		
		request.getRequestDispatcher("/member/memberAddInsertOutput.jsp").forward(request, response);
	}

}
