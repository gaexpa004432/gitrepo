package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet(name = "front",urlPatterns = "*.do",initParams = {@WebInitParam(name="charset",value="UTF-8")})

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	String charset = null;
	HashMap<String,Controller> list = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset"); 
		list = new HashMap<String, Controller>();
		list.put("/test.do", new test.TestController());  // 1번째 파라미터는 경로, 2번째 파라미터는 패키지명.클래스이름
		list.put("/member/login.do", new member.MemberLoginController());
		list.put("/member/logout.do", new member.MemberLogoutController());
		list.put("/freeBoardWrite.do", new board.freeBoardWriteController());
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
