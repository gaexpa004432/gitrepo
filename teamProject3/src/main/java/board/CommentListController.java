package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import net.sf.json.JSONArray;

public class CommentListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("post_no"));//jsp페이지의 post_no 가져오기
		CommentVO comment = new CommentVO();
		comment.setPost_no(Integer.parseInt(request.getParameter("post_no")));
		ArrayList<CommentVO>  list = CommentDAO.getInstance().selectOne(comment);
		String result = JSONArray.fromObject(list).toString();
		System.out.println(result);
	      response.getWriter().print(result);
		
	}

}
