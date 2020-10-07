package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.InqDAO;
import model.InqVO;

public class MemberInqListController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = (String) request.getSession().getAttribute("id");
		
		InqVO inqVO = new InqVO();
		inqVO.setMember_id(member_id);
		
		ArrayList<InqVO> list = InqDAO.getInstance().selectList(inqVO);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/member/inqList.jsp").forward(request, response);
	}

}
