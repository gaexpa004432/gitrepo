package member;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import common.FileRenamePolicy;
import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class MemberUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) request.getSession().getAttribute("login");
//		System.out.println(memberVO.toString());
//		MemberVO resultVO = new MemberVO();
		
//		try {//컬럼이 몇개가 됐던 파라미터를 읽어서 vo에 담아 준다.
//			BeanUtils.copyProperties(memberVO, request.getParameterMap());
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		String passVal = request.getParameter("member_pass");
		String page = "";
		System.out.println(request.getSession().getAttribute("pass"));
		
		//현재비밀번호 입력시(비밀번호를 수정하겠다는 의미)
		if(passVal.equals("")) {
			//수정페이지에서 담긴 value들을 VO에 담기
			
			try {//컬럼이 몇개가 됐던 파라미터를 읽어서 vo에 담아 준다.
				BeanUtils.copyProperties(memberVO, request.getParameterMap());
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
			memberVO.setMember_pass((String)request.getSession().getAttribute("pass"));
			memberVO.setMember_roadAddress(request.getParameter("member_roadAddress"));
			memberVO.setMember_birth(request.getParameter("member_birth").substring(0,10));
			
			
			//첨부파일 처리
			Part part = request.getPart("member_image");
			String fileName = getFileName(part);//원래 파일이름을 가져옴
			
			//사진만 수정하거나 사진과 내용 둘다 수정할때
			if(!fileName.equals("")) {
				String path = request.getServletContext().getRealPath("/images");
				System.out.println(path);
				//파일명 중복체크
				File renameFile = FileRenamePolicy.rename(new File(path, fileName));
				part.write(path + "/" + renameFile.getName());
				memberVO.setMember_image(renameFile.getName());
			} else { //사진 수정하지 않고 내용만 수정할때
				String curImage = memberVO.getMember_image();
				memberVO.setMember_image(curImage);
			}
			
			
			//새로운 VO를 가지고 update문 실행
			int cnt = MemberDAO.getInstance().update(memberVO);
			request.setAttribute("cnt", cnt);
			
			//세션에 수정된 정보를 담는다
			request.getSession().setAttribute("login", memberVO);
			request.getSession().setAttribute("pass", memberVO.getMember_pass());
			request.getSession().setAttribute("birth", memberVO.getMember_birth().substring(0,10));
			//System.out.println(request.getParameter("member_birth").substring(0,10));
			System.out.println(memberVO.toString());
			//작업을 완수하고 이동할 페이지 지정
			page = "/member/memberUpdateOutput.jsp";
			
		} else if (!passVal.equals("")) {
			if (!passVal.equals(request.getSession().getAttribute("pass"))) {
				request.setAttribute("errormsg", "현재 비밀번호가 일치 하지 않습니다");
				page = "/member/memberUpdate.jsp";
			} else {
				if (request.getParameter("member_newPass")=="") {
					request.setAttribute("errormsg", "새 비밀번호를 입력하세요");
					page = "/member/memberUpdate.jsp";
				} else {
					
				try {//컬럼이 몇개가 됐던 파라미터를 읽어서 vo에 담아 준다.
					BeanUtils.copyProperties(memberVO, request.getParameterMap());
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				//memberVO.setMember_pass((String)request.getSession().getAttribute("pass"));
				memberVO.setMember_pass(request.getParameter("member_newPass"));
				memberVO.setMember_roadAddress(request.getParameter("member_roadAddress"));
				memberVO.setMember_birth(request.getParameter("member_birth").substring(0,10));
				
				//첨부파일 처리
				Part part = request.getPart("member_image");
				String fileName = getFileName(part);//원래 파일이름을 가져옴
				//사진만 수정하거나 사진과 내용 둘다 수정할때
				if(!fileName.equals("")) {
					String path = request.getServletContext().getRealPath("/images");
					System.out.println(path);
					//파일명 중복체크
					File renameFile = FileRenamePolicy.rename(new File(path, fileName));
					part.write(path + "/" + renameFile.getName());
					memberVO.setMember_image(renameFile.getName());
				} else { //사진 수정하지 않고 내용만 수정할떄
					String curImage = memberVO.getMember_image();
					memberVO.setMember_image(curImage);
				}
				
				int cnt = MemberDAO.getInstance().update(memberVO);
				request.setAttribute("cnt", cnt);
				
				request.getSession().setAttribute("login", memberVO);
				request.getSession().setAttribute("pass", memberVO.getMember_pass());
				request.getSession().setAttribute("birth", memberVO.getMember_birth().substring(0,10));
				
				page = "/member/memberUpdateOutput.jsp";
				}
			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);

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
