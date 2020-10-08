package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import model.FreeBoardDAO;
import model.FreeBoardVO;

public class CommentDeleteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comment_no=Integer.parseInt(request.getParameter("comment_no"));//jsp페이지 받아오기		
		CommentVO comment = new CommentVO();
		comment.setComment_no(comment_no);
		CommentDAO DAO = new CommentDAO();
		DAO.delete(comment);
		
		
	}

}
