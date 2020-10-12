package teamProject3.recipe.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import teamProject3.recipe.ProductVO;
import teamProject3.recipe.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	@RequestMapping("/recipeList")
	public String recipeList(Model model ) {
		
		model.addAttribute("list", productService.productSelectAll(null));
		model.addAttribute("index",4);
		return "manager/recipe";
	}
	
	@RequestMapping("/ajaxRecipeupdate")
	@ResponseBody
	public void recipeUpdate(Model model ,ProductVO productvo) {
		
		productService.productUpdate(productvo);
		
	}
	
	@RequestMapping("/ajaxRecipeAccept")
	@ResponseBody
	public void recipeAccept(ProductVO productvo) {
		productService.productAccept(productvo);
	}
	
	@RequestMapping("/ajaxRecipeDelete")
	@ResponseBody
	public void recipeDelete(ProductVO productvo) {
		productService.productDelete(productvo);
	}
	
}
