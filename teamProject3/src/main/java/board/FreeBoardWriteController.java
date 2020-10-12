package board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import controller.Controller;
import model.FreeBoardDAO;
import model.FreeBoardVO;
import model.FreeBoardDAO;   

public class FreeBoardWriteController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FreeBoardVO freeboard = new FreeBoardVO();
		System.out.println("ㄷㅌㄷ쳣ㄷ");
		/* freeboard.setMember_name(request.getParameter("member_name")); */
		freeboard.setBoard_sub(request.getParameter("board_sub"));
		freeboard.setBoard_content(request.getParameter("board_content"));
		freeboard.setBoard_groupcode("pf");
		
		
		Part part = request.getPart("board_file");//파일 들고와서 변수 part에 담음
		String fileName = getFileName(part); //파일 이름을 가져와서 filename변수에 담음
		String path = request.getServletContext().getRealPath("/images"); // 저장경로를  path변수에 담음
		System.out.println(path);
		File renameFile = FileRenamePolicy.rename(new File(path,fileName)); // 저장될 파일이름이 같을경우 파일이름을 변경
		part.write(path + "/" + renameFile.getName()); // 파일을 저장, 저장경로 path 에 변경된 이름(renameFile.getName())으로 저장
		if(renameFile.getName().equals("images1")){ 
			
		}else { 
			freeboard.setBoard_file(renameFile.getName()); // freeboard board_file 변수에 저장된 파일이름 저장
			
		}
		
		
		HttpSession session = ((HttpServletRequest)request).getSession();
	      freeboard.setMember_id((String)session.getAttribute("id"));//로그인된 아이디를 들고옴
	      
	      
	      
	    FreeBoardDAO DAO = new FreeBoardDAO();
		DAO.insert(freeboard);
		
		response.sendRedirect("freeBoardList.do");
	}
	
	// 파일의 이름을 가져오는 메서드
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {		// filename으로 시작되는거 찾아서 
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;

	}
	
}
