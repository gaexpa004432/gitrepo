package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import controller.Controller;
import model.MemberVO;
import model.SellerDAO;
import model.SellerVO;

public class MemberAddUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SellerVO sellerVO = new SellerVO();
		
		try {
			BeanUtils.copyProperties(sellerVO, request.getParameterMap());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		int cnt = SellerDAO.getInstance().update(sellerVO);
		
		MemberVO resultVO = (MemberVO) request.getSession().getAttribute("login");
		
		resultVO.setSeller_roadAddress(sellerVO.getSeller_roadAddress());
		resultVO.setSeller_postcode(sellerVO.getSeller_postcode());
		resultVO.setSeller_detailAddress(sellerVO.getSeller_detailAddress());
		resultVO.setSeller_extraAddress(sellerVO.getSeller_extraAddress());
		resultVO.setSeller_tel(sellerVO.getSeller_tel());
		resultVO.setSeller_store(sellerVO.getSeller_store());
		
		request.setAttribute("cnt", cnt);
		request.getSession().setAttribute("login", resultVO);
		
		request.getRequestDispatcher("memberAddUpdateOutput.jsp").forward(request, response);
	}

}
