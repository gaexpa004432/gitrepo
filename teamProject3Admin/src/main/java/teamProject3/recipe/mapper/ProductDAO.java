package teamProject3.recipe.mapper;

import java.util.ArrayList;

import teamProject3.recipe.ProductVO;
import teamProject3.recipe.RecipeVO;

public interface ProductDAO {

	//select * from product where product_name = ;
	boolean productStatus(ProductVO productVO);

	int productInsert(ProductVO productVO);

	ArrayList<ProductVO> productSelectAll(ProductVO productVO);

	ArrayList<ProductVO> productSelectOne(RecipeVO recipeVO);

}