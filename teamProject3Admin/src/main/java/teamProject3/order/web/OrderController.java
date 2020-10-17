package teamProject3.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import teamProject3.order.service.OrderService;

@Controller
public class OrderController {

	@Autowired OrderService orderService;
	
	
}

