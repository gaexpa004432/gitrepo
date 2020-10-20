package teamProject3;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamProject3.order.service.OrderService;

@Controller
public class MainContorller {
	
	@Autowired OrderService orderService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET) //servlet mapping
	public String home(Model model,HttpServletRequest request,HttpServletResponse response) {
	
		request.getSession().setAttribute("id", "vegan");
		model.addAttribute("chatList",orderService.selectChat());
		model.addAttribute("index", "1" );
		
		return "manager/managerMain";
	}
	
}
