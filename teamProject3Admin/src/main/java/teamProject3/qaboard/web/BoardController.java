package teamProject3.qaboard.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamProject3.qaboard.service.BoardService;

@Controller
public class BoardController {
	@Autowired BoardService boardservice;
	
	@RequestMapping("/boardList")
	public String memberList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		model.addAttribute("list", boardservice.selectAll(null));
		model.addAttribute("index",5);
		return "manager/qaBoard";
	}
}
