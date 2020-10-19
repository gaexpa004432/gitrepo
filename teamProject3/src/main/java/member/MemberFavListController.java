package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.MemberDAO;
import model.MemberFavoriteVO;

public class MemberFavListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = (String)request.getSession().getAttribute("id");
		String p = request.getParameter("p");
		String fav = request.getParameter("fav");
		
		//페이징 처리
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(4);//한페이지에 보일 건수
		paging.setPageSize(5);//페이지 번호수
		paging.setPage(page);

		MemberFavoriteVO mfVO = new MemberFavoriteVO();
		mfVO.setMember_id(member_id);
		
		if (fav.equals("fs")) {
			paging.setTotalRecord(MemberDAO.getInstance().fsCount(mfVO));			
		} else if (fav.equals("fr")){
			paging.setTotalRecord(MemberDAO.getInstance().frCount(mfVO));
		}
		
		mfVO.setFirst(paging.getFirst());
		mfVO.setLast(paging.getLast());
		
		request.setAttribute("paging", paging);

		
		//dao(조회)실행
		if (fav.equals("fs")) {
			ArrayList<MemberFavoriteVO> fs = MemberDAO.getInstance().selectFavoriteResAll(mfVO);
			request.setAttribute("fs", fs);
			request.setAttribute("fav", fav);
			request.getRequestDispatcher("/member/memberFavRes.jsp").forward(request, response);
		} else if (fav.equals("fr")){
			ArrayList<MemberFavoriteVO> fr = MemberDAO.getInstance().selectFavoriteRecipeAll(mfVO);			
			request.setAttribute("fr", fr);
			request.setAttribute("fav", fav);
			request.getRequestDispatcher("/member/memberFavRecipe.jsp").forward(request, response);
		}
		
		
	}

}
