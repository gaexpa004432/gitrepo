package teamProject3.recipe.service;

import java.util.ArrayList;

import teamProject3.recipe.RecipeVO;

public interface RecipeService {

	int recipeInsert(RecipeVO recipeVO);

	ArrayList<RecipeVO> selectAll(RecipeVO Recipe);

	int count(RecipeVO Recipe);

	RecipeVO selectOne(RecipeVO Recipe);

}