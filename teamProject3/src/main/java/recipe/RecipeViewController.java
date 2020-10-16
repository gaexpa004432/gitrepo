package recipe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Paging;
import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;
import model.ProductDAO;
import model.RecipeDAO;
import model.RecipePhotoDAO;
import model.RecipeReviewDAO;
import model.RecipeReviewVO;
import model.RecipeVO;

public class RecipeViewController implements Controller {

   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RecipeVO recipe = new RecipeVO();
      FavoriteVO favorite = new FavoriteVO(); 
      List<FavoriteVO> list = new ArrayList<FavoriteVO>();
      String bookMark = "false";
      HttpSession session = (request).getSession(); // member id 가져오기
      recipe.setMember_id((String) session.getAttribute("id"));
      int recipe_number = Integer.parseInt(request.getParameter("recipe_number"));
      recipe.setRecipe_number(recipe_number);
      String seller_code =(String) request.getParameter("seller_code");
      recipe.setSeller_code(seller_code);
      RecipeVO resultVO = RecipeDAO.getInstance().recipeSelectOne(recipe);
      favorite.setMember_id((String) session.getAttribute("id"));
      
      list = FavoriteDAO.getInstance().selectAll(favorite);
      for (FavoriteVO fav : list) {
         if (fav.getFavorite_code().equals("fr") && fav.getFavorite_no() == (recipe.getRecipe_number())) {
            bookMark = "true";
         }
      }
      
      request.getSession().setAttribute("resultVO", resultVO);
    
      RecipeReviewVO reviewvo = new RecipeReviewVO();
      
       String p = request.getParameter("p");
         
         //유효성 체크
         int page = 1;
         if(p != null) {
            page = Integer.parseInt(p);
         }
         Paging paging = new Paging();
         paging.setPageUnit(5); //들고 올 레코드 개수
         paging.setPageSize(5); //페이징 번호 개수
         paging.setPage(page);
         
         reviewvo.setRecipe_number(recipe_number);
         paging.setTotalRecord(RecipeReviewDAO.getInstance().count(reviewvo));
         reviewvo.setFirst(paging.getFirst());
         reviewvo.setLast(paging.getLast());
         
         
      request.setAttribute("paging", paging);
      request.setAttribute("focus", request.getParameter("focus"));
      request.setAttribute("favorite", bookMark);
      request.setAttribute("reviewlist", RecipeReviewDAO.getInstance().selectAllReview(reviewvo));
      request.setAttribute("recipe", RecipeDAO.getInstance().recipeSelectOne(recipe));
      request.setAttribute("photo", RecipePhotoDAO.getInstance().selectOne(recipe));
      request.setAttribute("product", ProductDAO.getInstance().productSelectOne(recipe));
      request.setAttribute("member_id", RecipeDAO.getInstance().recipeSelectOne(recipe));
      request.getRequestDispatcher("/recipe/recipeView.jsp").forward(request, response);
   
      
   } 

}
