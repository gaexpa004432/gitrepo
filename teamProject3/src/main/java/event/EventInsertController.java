package event;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.Controller;
import model.EventDAO;
import model.FreeBoardVO;

public class EventInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		FreeBoardVO eventboard = new FreeBoardVO();
		
		eventboard.setBoard_sub(request.getParameter("board_sub"));
		eventboard.setBoard_content(request.getParameter("board_content"));
		eventboard.setBoard_groupcode("pe");
		
		// 첨부파일 처리
		Part part1 = request.getPart("board_file");
		String fileName = getFileName(part1);// Long.toString(System.currentTimeMillis());
		String path = request.getServletContext().getRealPath("/food"); // "c:/upload";
		System.out.println(path); 
		File renameFile = common.FileRenamePolicy.rename(new File(path, fileName));
		part1.write(path +"/"+ renameFile.getName());
		eventboard.setBoard_file(renameFile.getName());

		//서비스 db처리
		int r  = EventDAO.getInstance().eventInsert(eventboard);
		
		// 결과 저장
		request.setAttribute("cnt", r);

		// 페이지 이동
		request.getRequestDispatcher("/eventBoardList.do").forward(request, response);
	}
 
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
