package teamProject3.qaboard.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamProject3.member.MemberVO;
import teamProject3.qaboard.BoardVO;
import teamProject3.qaboard.service.BoardService;

@Controller
public class BoardController {
	@Autowired BoardService boardservice;
	
	@RequestMapping("/boardList")
	public String memberList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		BoardVO boardvo = new BoardVO();
		 list = boardservice.selectAll(null);
		 for(BoardVO all : list) {
			 boardvo.setBoard_no(all.getBoard_no());
			 
		 }
		model.addAttribute("list", boardservice.selectAll(null));
		model.addAttribute("index",5);
		return "manager/qaBoard";
	}
}