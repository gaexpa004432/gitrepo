package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;

public class CommentUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String update = request.getParameter("update");
		int comment = Integer.parseInt(request.getParameter("comment_no"));
		CommentDAO commentdao = new CommentDAO();
		CommentVO commentvo = new CommentVO();
		commentvo.setComment_no(comment);
		commentvo.setComment_content(update);
		commentdao.update(commentvo);
	}

}
