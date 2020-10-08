package teamProject3;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainContorller {

	@RequestMapping(value = "/", method = RequestMethod.GET) //servlet mapping
	public String home(Model model) {
	
		
		model.addAttribute("serverTime", "gg" );
		
		return "manager/managerMain";
	}
	
}
