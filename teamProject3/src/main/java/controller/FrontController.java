package controller;

import java.io.IOException;
import java.io.PipedInputStream;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buy.CartSelectContoller;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet(name = "front",urlPatterns = "*.do",initParams = {@WebInitParam(name="charset",value="UTF-8")})
@MultipartConfig(location = "c:/upload")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
  
	String charset = null;
	HashMap<String,Controller> list = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset"); 
		list = new HashMap<String, Controller>();
		list.put("/test.do", new test.TestController());  // 1번째 파라미터는 경로, 2번째 파라미터는 패키지명.클래스이름

		//박호일

		list.put("/login.do", new member.MemberLoginController());
		list.put("/logout.do", new member.MemberLogoutController());
		list.put("/insert.do", new member.MemberInsertController()); 
		list.put("/addInsert.do", new member.MemberAddInsertController());
		list.put("/select.do", new member.MemberSelectController());
		list.put("/update.do", new member.MemberUpdateController());
		list.put("/addUpdate.do", new member.MemberAddUpdateController());
		list.put("/inqInsert.do", new member.MemberInqInsertController());
		list.put("/inqList.do", new member.MemberInqListController());
		list.put("/inqSelect.do", new member.MemberInqSelectController());
		list.put("/inqSellerId.do", new member.MemberInqSellerIdController());
		list.put("/ansList.do", new member.MemberAnsListController());
		list.put("/ansSelect.do", new member.MemberAnsSelectController());
		list.put("/ansUpdate.do", new member.MemberAnsUpdateController());
		list.put("/favList.do", new member.MemberFavListController());
		
		
		
		
		
		
		
		
		
		
		//김성남
		list.put("/save_product.do", new recipe.ProductInsertController());
		list.put("/productList.do", new recipe.ProductListController());
		list.put("/recipeInsert.do", new recipe.RecipeInsertController());
		list.put("/recipeDelete.do", new recipe.RecipeDeleteController());
		list.put("/recipeViewUpdate.do", new recipe.RecipeViewUpdateController());
		list.put("/recipeUpdate.do", new recipe.RecipeUpdateController());
		list.put("/recipeView.do", new recipe.RecipeChoiceBoardController());
		
		list.put("/eventInsert.do", new event.EventInsertController());
		list.put("/eventBoardList.do", new event.EventListController());
		list.put("/eventView.do", new event.EventViewController());
		list.put("/eventDelete.do", new event.EventDeleteController());
		list.put("/eventViewUpdate.do", new event.EventViewUpdateController());
		list.put("/eventUpdate.do", new event.EventUpdateController());
		
		
		
		
		
		
		
		
		
		
		
		
		
		//진인석
		
		
		list.put("/cartController.do", new buy.CartSelectContoller());
		list.put("/CartSelectContoroller.do", new buy.CartSelectContoller());
		list.put("/orderDetailController.do", new buy.orderDetailController());
		list.put("/orderOutput.do", new buy.orderOutputController());
		list.put("/orderOutputInsert.do", new buy.orderOutputInsertController());
		list.put("/mileageController.do", new buy.mileageCotroller());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//서송미
		list.put("/freeBoardWrite.do", new board.FreeBoardWriteController());
		list.put("/freeBoardList.do", new board.FreeBoardListController());
		list.put("/freeBoardView.do",new board.FreeBoardViewController());
		list.put("/freeBoardUpdate.do",new board.FreeBoardUpdateController());
		list.put("/freeBoardUpdate2.do",new board.FreeBoardUpdate2Controller());
		list.put("/freeBoardDelete.do",new board.FreeBoardDeleteController());
		list.put("/ajaxcommentInsert.do",new board.CommentInsertController());
		list.put("/qaBoardWrite.do",new board.QaBoardWriteController());
		list.put("/qaBoardList.do", new board.QaBoardListController());
		list.put("/ajaxcommentList.do", new board.CommentListController());
		list.put("/qaBoardView.do", new board.qaBoardViewController());
		list.put("/member/memberDelete.do", new member.MemberDeleteController());
		list.put("/ajaxCommentdelete.do",new board.CommentDeleteController());
		list.put("/ajaxCommentUpdate.do",new board.CommentUpdateController());
		list.put("/qaBoardUpdate.do",new board.QaBoardUpdateController());
		list.put("/qaBoardUpdate2.do",new board.QaBoardUpdate2Controller());
		list.put("/qaBoardDelete.do",new board.QaBoardDeleteController());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//백승엽
		list.put("/restaurantWrite.do", new restaurant.RestaurantWriteController());
		list.put("/restaurantBoard.do", new restaurant.RestaurantBoardController());
		list.put("/restaurantView.do", new restaurant.RestaurantViewController());
		list.put("/reviewInsert.do", new restaurant.reviewInsertController());
		list.put("/bookMark.do", new common.BookMarkController());
		list.put("/reviewDelete.do",new restaurant.ReviewDeleteController());
		list.put("/recipeBoard.do",new recipe.RecipeBoardController());
		list.put("/recipeView.do",new recipe.RecipeViewController());
		list.put("/cart.do",new buy.CartController());
		list.put("/recipeReview.do",new recipe.RecipeReviewController());
		list.put("/recipeReviewDel.do",new recipe.RecipeReviewDeleteController());
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath(); 
		String path = uri.substring(contextPath.length()); 
		Controller subController = list.get(path);
		if(subController == null) {
			System.out.println("NULL: " + path);
		}
		else {
			subController.execute(request, response);
		}
		
	}


}
