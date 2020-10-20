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
import teamProject3.order.OrderVO;
import teamProject3.order.service.OrderService;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired OrderService orderService;
	
	
	@RequestMapping("/memberList")
	public String memberList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		model.addAttribute("list",memberService.selectAll(null));
		model.addAttribute("index",3);
		request.getSession().setAttribute("id", "manager");
		return "manager/mani";
	}
	
	@RequestMapping("/manager")
	public String member(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		request.getSession().setAttribute("id", "manager");
		model.addAttribute("chatList",orderService.selectChat());
		model.addAttribute("index", "1" );
		
		return "manager/managerMain";
	}
	
	@RequestMapping("/salesList")
	public String salesList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		List<OrderVO> list = orderService.dailySales(null);
		List<OrderVO> sales = orderService.getOrderoutput(null);
		List<String> date = new ArrayList<String>();
		List<String> total = new ArrayList<String>();
		
		int i = 0 ;
		for(OrderVO data: list) {
			date.add("'"+data.getOrder_date()+"'");
			total.add(data.getOrder_total());
		}
		
		model.addAttribute("date",date);
		model.addAttribute("data",total);
		model.addAttribute("index",2);
		model.addAttribute("sales",sales);
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
	
	@RequestMapping("/ajaxChatInsert")
	@ResponseBody
	public void chatInsert(OrderVO orderVO ,HttpServletRequest request,HttpServletResponse response) {
		
		orderService.insertChat(orderVO);
	}
	


}
