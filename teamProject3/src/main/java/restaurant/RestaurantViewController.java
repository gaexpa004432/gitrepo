package restaurant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Paging;
import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;
import model.MemberVO;
import model.RestaurantDAO;
import model.RestaurantReviewDAO;
import model.RestaurantReviewVO;
import model.RestaurantVO;

public class RestaurantViewController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RestaurantVO restaurant =new RestaurantVO();
		RestaurantReviewVO restaurantReview = new RestaurantReviewVO();
		FavoriteVO favorite = new FavoriteVO(); 
		List<FavoriteVO> list =new ArrayList<FavoriteVO>();
		
		String bookMark = "false";
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		System.out.println(res_no);
		restaurant.setRes_no(res_no);
		restaurantReview.setRes_no(res_no);
		
	// 페이징
		String p = request.getParameter("p");
		// 유효성 체크
		int page = 1;
		if (p != null) {
			page = Integer.parseInt(p);
		}
		
		Paging paging = new Paging();
		paging.setPageUnit(5); // 한페이지에 출력할 레코드 건수 설정
		paging.setPageSize(10); // 페이지 번호 수 설정
		paging.setPage(page); // paging 반영되게 해주기
		
		paging.setTotalRecord(RestaurantReviewDAO.getInstance().count(restaurantReview)); // dao.count() 쓰면 first,last paging에서 알아서 계산다해주고
		// 카운트에도 넘김
		restaurantReview.setFirst(paging.getFirst());
		restaurantReview.setLast(paging.getLast());
	
		restaurant = RestaurantDAO.getInstance().selectOne(restaurant);
		HttpSession session = ((HttpServletRequest) request).getSession();
		favorite.setMember_id((String) session.getAttribute("id"));
		
		
		list = FavoriteDAO.getInstance().selectAll(favorite);
		for(FavoriteVO fav : list) {
			if(fav.getFavorite_code().equals("fs") && fav.getFavorite_no() == (restaurant.getRes_no())) {
				bookMark = "true";
			}
		}
		
		request.setAttribute("favorite", bookMark);
		request.setAttribute("paging", paging);
		request.setAttribute("res", restaurant);
		request.setAttribute("review", RestaurantReviewDAO.getInstance().selectAllReview(restaurantReview));
		
		request.getRequestDispatcher("/restaurant/restaurantView.jsp").forward(request, response);
	}

}
