package teamProject3.recipe.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamProject3.recipe.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	@RequestMapping("/recipeList")
	public String memberList(Model model ,HttpServletRequest request,HttpServletResponse response) {
		
		model.addAttribute("list", productService.productSelectAll(null));
		model.addAttribute("index",4);
		return "manager/recipe";
	}
}
