package teamProject3.order.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import teamProject3.order.OrderVO;
import teamProject3.order.service.OrderService;

@RestController
public class OrderController {

	@Autowired OrderService orderService;
	
	@RequestMapping("/ajaxDay")
	public ArrayList<OrderVO> Daily(OrderVO orderVO ,HttpServletRequest request,HttpServletResponse response) {
		System.out.println(orderVO.getOrder_date());
		System.out.println(orderVO.getOrder_total());
			return orderService.selectDay(orderVO);
		}
	
	@RequestMapping("/ajaxMonth")
	public ArrayList<OrderVO> Month(OrderVO orderVO ,HttpServletRequest request,HttpServletResponse response) {
			
		System.out.println(orderVO.getOrder_date());
		System.out.println(orderVO.getOrder_total());
			return orderService.selectMonth(orderVO);
		}
}


