package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SearchDAO;
import model.SearchVO;

public class SearchController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchWord = request.getParameter("searchWord");
		String category = request.getParameter("categories");
		String page="";
		SearchVO searchVO = new SearchVO();
		
		
		
		if(category.equals("")) { 
			page="/member/searchRs.jsp"; 
		} else if(category.equals("rs")) { //식당 이름 검색
			if(searchWord.equals("")) {
				page="/member/searchRs.jsp";
			} else {
				System.out.println("rs실행");
				ArrayList<SearchVO> listRs = new ArrayList<SearchVO>();
				searchVO.setRes_name(searchWord);
				listRs = SearchDAO.getInstance().searchRes(searchVO);
				page = "/member/searchRs.jsp";
				request.setAttribute("category", category);
				request.setAttribute("listRs", listRs);
			}
		} else if(category.equals("rc")) { //레시피 이름 검색
			if(searchWord.equals("")) {
				page="/member/searchRc.jsp";
			} else {
				System.out.println("rc실행");
				ArrayList<SearchVO> listRc = new ArrayList<SearchVO>();
				searchVO.setRecipe_name(searchWord);
				listRc = SearchDAO.getInstance().searchRecipe(searchVO);
				page = "/member/searchRc.jsp";
				request.setAttribute("category", category);
				request.setAttribute("listRc", listRc);
			}
		} else if(category.equals("rsc")) { //식당 내용 검색
			if(searchWord.equals("")) {
				page="/member/searchRsc.jsp";
			} else {
				System.out.println("rsc실행");
				ArrayList<SearchVO> listRsc = new ArrayList<SearchVO>();
				searchVO.setRes_content(searchWord);
				listRsc = SearchDAO.getInstance().searchResCon(searchVO);
				page = "/member/searchRsc.jsp";
				request.setAttribute("category", category);
				request.setAttribute("listRsc", listRsc);
			}
		} else if(category.equals("rcc")) { //레시피 내용 검색
			if(searchWord.equals("")) {
				page="/member/searchRcc.jsp";
			} else {
				System.out.println("rcc실행");
				ArrayList<SearchVO> listRcc = new ArrayList<SearchVO>();
				searchVO.setRecipe_content(searchWord);
				listRcc = SearchDAO.getInstance().searchRecipeCon(searchVO);
				page = "/member/searchRcc.jsp";
				request.setAttribute("category", category);
				request.setAttribute("listRcc", listRcc);
			}
		} else if(category.equals("p")) { //재료 검색
			if(searchWord.equals("")) {
				page="/member/searchP.jsp";
			} else {
				System.out.println("p실행");
				ArrayList<SearchVO> listP = new ArrayList<SearchVO>();
				searchVO.setProduct_name(searchWord);
				listP = SearchDAO.getInstance().searchProduct(searchVO);
				page = "/member/searchP.jsp";
				request.setAttribute("category", category);
				request.setAttribute("listP", listP);
			}
		} else if(category.equals("a")) { //지역 검색
			if(searchWord.equals("")) {
				page="/member/searchA.jsp";
			} else {
				System.out.println("a실행");
				System.out.println(searchWord);
				ArrayList<SearchVO> listA = new ArrayList<SearchVO>();
				searchVO.setRes_address(searchWord);
				listA = SearchDAO.getInstance().searchArea(searchVO);
				page = "/member/searchA.jsp";
				request.setAttribute("category", category);
				request.setAttribute("listA", listA);
			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
