package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;
import model.SellerDAO;
import model.SellerVO;

public class MemberLoginController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 파라미터 받기
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pass(request.getParameter("member_pass"));
		
		//2. 서비스처리
		//2-1 일반회원 정보 가져오기
		MemberVO resultVO = MemberDAO.getInstance().selectOne(memberVO);
		
		
		//request.setAttribute("resultVO", resultVO);
		
		//3. 결과저장
		String page = "";
		
		if(resultVO == null) {//일치하는 아이디가 없으면 에러메시지를 띄우면서 login페이지에 머무르기
			request.setAttribute("errormsg", "아이디를 다시 입력해 주세요");
			page = "memberLogin.jsp";	
		} else {
			if(memberVO.getMember_pass().equals(resultVO.getMember_pass())) { //로그인 성공
				
				//2-2 일반회원 정보에서 소상공인 번호 있으면 새로 resultVO 담기
				if(resultVO.getSeller_code() != 0) {
					SellerVO sellerVO = new SellerVO();
					sellerVO.setSeller_code(resultVO.getSeller_code());
					
					sellerVO = SellerDAO.getInstance().selectOne(sellerVO);
					
					//resultVO.setSeller_code(sellerVO.getSeller_code()); //다른 데이터값들 resultVO에 더 담기
					resultVO.setSeller_roadAddress(sellerVO.getSeller_roadAddress());
					resultVO.setSeller_postcode(sellerVO.getSeller_postcode());
					resultVO.setSeller_detailAddress(sellerVO.getSeller_detailAddress());
					resultVO.setSeller_extraAddress(sellerVO.getSeller_extraAddress());
					resultVO.setSeller_tel(sellerVO.getSeller_tel());
					resultVO.setSeller_store(sellerVO.getSeller_store());
					System.out.println(resultVO.toString());
					//request.getSession().setAttribute("sellerInfo", sellerVO);
				}
				
				request.getSession().setAttribute("login", resultVO);//세션에 로그인 정보 저장
				request.getSession().setAttribute("id", memberVO.getMember_id());//사용자의 id를 준다
				request.getSession().setAttribute("pass", memberVO.getMember_pass());
				request.getSession().setAttribute("birth", resultVO.getMember_birth().substring(0, 10));
				System.out.println("비번 담기 : " + memberVO.getMember_pass());
				System.out.println("생년월일 : " + resultVO.getMember_birth());
				System.out.println("판매자 코드: " + resultVO.getSeller_code());				
				
				page = "memberLoginOutput.jsp";
			} else { //패스워드 불일치
				request.setAttribute("resultVO", resultVO);
				request.setAttribute("errormsg", "패스워드가 맞지 않습니다"); //패스워드 맞지 않으면 에러 메시지
				page = "memberLogin.jsp";
			}
		}
		
		//4. 뷰페이지 이동(redirect, forward) 또는 뷰페이지 직접 출력
		request.getRequestDispatcher(page).forward(request, response);
	}

}
