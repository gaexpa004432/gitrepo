package teamProject3.recipe.mapper;

import java.util.ArrayList;

import teamProject3.recipe.RecipeVO;

public interface RecipeDAO {

	int recipeInsert(RecipeVO recipeVO);

	ArrayList<RecipeVO> selectAll(RecipeVO Recipe);

	int count(RecipeVO Recipe);

	RecipeVO selectOne(RecipeVO Recipe);

}