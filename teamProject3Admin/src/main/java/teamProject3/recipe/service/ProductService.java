package teamProject3.recipe.service;

import java.util.ArrayList;


import teamProject3.recipe.ProductVO;
import teamProject3.recipe.RecipeVO;

public interface ProductService {

	boolean productStatus(ProductVO productVO);

	int productInsert(ProductVO productVO);

	ArrayList<ProductVO> productSelectAll(ProductVO productVO);

	ArrayList<ProductVO> productSelectOne(RecipeVO recipeVO);

	void productUpdate(ProductVO productVO);
	
	void productAccept(ProductVO productvo);
	
	void productDelete(ProductVO productvo);
}