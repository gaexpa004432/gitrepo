package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;

public class CommentUpdateController implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentVO comment = new CommentVO();
		comment.setComment_no(comment_no);
		CommentDAO DAO = new CommentDAO();
		DAO.update(comment);
	}
	
}
