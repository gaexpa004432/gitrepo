package teamProject3.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamProject3.member.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/memberList")
	public String memberList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println(memberService.selectAll(null));
		return "";
	}
}
