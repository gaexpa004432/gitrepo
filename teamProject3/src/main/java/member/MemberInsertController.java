package member;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class MemberInsertController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("member_id");
		String member_pass = request.getParameter("member_pass");
		String member_name = request.getParameter("member_name");
		String member_tel = request.getParameter("member_tel");
		String member_gender = request.getParameter("member_gender");
		String member_birth = request.getParameter("member_birth");
		String member_roadAddress = request.getParameter("member_roadAddress");
		String member_postcode = request.getParameter("member_postcode");
		String member_detailAddress = request.getParameter("member_detailAddress");
		String member_extraAddress = request.getParameter("member_extraAddress");
		String member_type = request.getParameter("member_type");
		String member_email = request.getParameter("member_email");
		String member_image = request.getParameter("member_image");
		
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		memberVO.setMember_pass(member_pass);
		memberVO.setMember_name(member_name);
		memberVO.setMember_tel(member_tel);
		memberVO.setMember_gender(member_gender);
		memberVO.setMember_birth(member_birth);
		memberVO.setMember_roadAddress(member_roadAddress);
		memberVO.setMember_type(member_type);
		memberVO.setMember_postcode(member_postcode);
		memberVO.setMember_detailAddress(member_detailAddress);
		memberVO.setMember_extraAddress(member_extraAddress);
		memberVO.setMember_email(member_email);
		memberVO.setMember_image(member_image);
		
		
		//첨부파일 처리
		Part part = request.getPart("member_image");
		String fileName = getFileName(part);//원래 파일이름을 가져옴
		String path = request.getServletContext().getRealPath("/images");
		System.out.println(path);
		//파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, fileName));
		part.write(path + "/" + renameFile.getName());
		memberVO.setMember_image(renameFile.getName());
		
		
		
		int r = MemberDAO.getInstance().insert(memberVO);
		System.out.println(r+"건이 실행됨");
		
		MemberVO memberOne = MemberDAO.getInstance().selectOne(memberVO);
		
		request.setAttribute("cnt", r);
		request.setAttribute("memberOne", memberOne);
		
		
		request.getRequestDispatcher("/member/memberInsertOutput.jsp").forward(request, response);
	}
	
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}

}
