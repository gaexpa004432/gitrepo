package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class MemberUpdateController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO memberVO = new MemberVO();
		
		try {//컬럼이 몇개가 됐던 파라미터를 읽어서 vo에 담아 준다.
			BeanUtils.copyProperties(memberVO, request.getParameterMap());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		int cnt = MemberDAO.getInstance().update(memberVO);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("memberUpdateOutput.jsp").forward(request, response);
	}

}
