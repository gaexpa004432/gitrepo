package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberFavoriteVO;

public class MemberFavListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = (String)request.getSession().getAttribute("id");
		
		MemberFavoriteVO mfVO = new MemberFavoriteVO();
		mfVO.setMember_id(member_id);
		
		ArrayList<MemberFavoriteVO> fr = MemberDAO.getInstance().selectFavoriteRecipeAll(mfVO);
		ArrayList<MemberFavoriteVO> fs = MemberDAO.getInstance().selectFavoriteResAll(mfVO);
		request.setAttribute("fs", fs);
		request.setAttribute("fr", fr);
		
		request.getRequestDispatcher("/member/memberFavRes.jsp").forward(request, response);
	}

}
