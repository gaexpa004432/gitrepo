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

		list.put("/member/login.do", new member.MemberLoginController());
		list.put("/member/logout.do", new member.MemberLogoutController());
		list.put("/member/insert.do", new member.MemberInsertController()); 
		list.put("/member/addInsert.do", new member.MemberAddInsertController());
		list.put("/member/select.do", new member.MemberSelectController());
		list.put("/member/update.do", new member.MemberUpdateController());
		list.put("/member/addUpdate.do", new member.MemberAddUpdateController());
		
		
		
		
		
		
		
		
		
		
		
		//김성남
		list.put("/save_product.do", new recipe.ProductInsertController());
		list.put("/productList.do", new recipe.ProductListController());
		list.put("/recipeInsert.do", new recipe.RecipeInsertController());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//진인석
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//서송미
		list.put("/freeBoardWrite.do", new board.FreeBoardWriteController());
		list.put("/freeBoardList.do", new board.FreeBoardListController());
		list.put("/freeBoardView.do",new board.FreeBoardViewController());
		list.put("/freeBoardUpdate.do",new board.FreeBoardUpdateController());
		list.put("/freeBoardUpdate2.do",new board.FreeBoardUpdate2Controller());
		list.put("/freeBoardDelete.do",new board.FreeBoardDeleteController());
		list.put("/commentInsert.do",new board.CommentInsertController());
		list.put("/qaBoardWrite.do",new board.QaBoardWriteController());
		list.put("/qaBoardList.do", new board.QaBoardListController());
		list.put("/commentList.do", new board.CommentListController());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//백승엽
		list.put("/restaurantWrite.do", new restaurant.RestaurantWriteController());
		list.put("/restaurantBoard.do", new restaurant.RestaurantBoardController());
		list.put("/restaurantView.do", new restaurant.RestaurantViewController());
		list.put("/reviewInsert.do", new restaurant.reviewInsertController());
		list.put("/bookMark.do", new common.BookMarkController());
		list.put("/reviewDelete.do",new restaurant.ReviewDeleteController());
		
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
