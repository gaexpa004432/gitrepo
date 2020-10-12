package teamProject3.recipe.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject3.recipe.ProductVO;
import teamProject3.recipe.RecipeVO;
import teamProject3.recipe.mapper.ProductDAO;
import teamProject3.recipe.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired ProductDAO productdao;
	
	@Override
	public boolean productStatus(ProductVO productVO) {
		return false;
	}

	@Override
	public int productInsert(ProductVO productVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ProductVO> productSelectAll(ProductVO productVO) {
		// TODO Auto-generated method stub
		return productdao.productSelectAll(null);
	}

	@Override
	public ArrayList<ProductVO> productSelectOne(RecipeVO recipeVO) {
		// TODO Auto-generated method stub
		return null;
	}

}
