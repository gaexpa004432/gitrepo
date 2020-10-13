package teamProject3.member.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import teamProject3.member.MemberVO;
import teamProject3.member.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/memberList")
	public String memberList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		model.addAttribute("list",memberService.selectAll(null));
		model.addAttribute("index",3);
		return "manager/mani";
	}
	
	@RequestMapping("/salesList")
	public String salesList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		model.addAttribute("index",2);
		return "manager/sales";
	}
	
	@RequestMapping("/ajaxMemberDelete")
	@ResponseBody
	public void memberDel(MemberVO memberVO ,HttpServletRequest request,HttpServletResponse response) {
		
		memberService.delete(memberVO);
	}
	
	@RequestMapping("/ajaxMemberUpdate")
	@ResponseBody
	public void memberUpdate(MemberVO memberVO ,HttpServletRequest request,HttpServletResponse response) {
		
		memberService.updateMileage(memberVO);
	}
	

}
