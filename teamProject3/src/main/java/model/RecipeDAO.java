package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class RecipeDAO{
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	int r = 0;
	// 싱글톤
	static RecipeDAO instance;

	public static RecipeDAO getInstance() {
		if (instance == null)
			instance = new RecipeDAO();
		return instance;
	}
		
		public int recipeInsert(RecipeVO recipeVO) {
			
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "INSERT INTO recipe (recipe_number, recipe_name, recipe_date,"
						+ " recipe_content, member_id, cooking_time, cooking_level, main_img)" 
						+ " VALUES (recipe_no.NEXTVAL, ?, sysdate, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, recipeVO.getRecipe_name());
				pstmt.setString(2, recipeVO.getRecipe_content());
				pstmt.setString(3, recipeVO.getMember_id());
				pstmt.setString(4, recipeVO.getCooking_time());
				pstmt.setString(5, recipeVO.getCooking_level());
				pstmt.setString(6, recipeVO.getMain_img());
				pstmt.executeUpdate();
				
				sql = "select recipe_no.currval from dual"; //방금 쓰인 시퀀스 번호 들고옴
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
				r = rs.getInt(1);
				
				}
				return r;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
	}
		
		public ArrayList<RecipeVO> selectAll(RecipeVO Recipe) {
			conn = ConnectionManager.getConnnect();
			RecipeVO resultVO = new RecipeVO();
			ArrayList<RecipeVO> list = new ArrayList<RecipeVO>();
			try { 
	         String where = "";
	         if(Recipe.getRecipe_name() != null) {
	            where += " and Recipe_name like '%' || ? || '%'";
	         }
				 String sql = "select a.* from (select rownum rn,b.* from ( " + 
				 		"select r.recipe_number,r.recipe_name,r.RECIPE_DATE,r.RECIPE_CONTENT,r.MEMBER_ID,r.COOKING_TIME,r.COOKING_LEVEL,r.MAIN_IMG,(select member_image from member where member_id = r.member_id) as member_image from recipe r where not exists(select * from product p where p.recipe_number = r.recipe_number and PRODUCT_STATUS = 'N')"+where+" order by recipe_number desc" + 
				 		"           ) b) a where rn between ? and ?";
				 pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
		         int pos = 1;   // 물음표값 동적으로 하려고 변수선언
		         
		         if(Recipe.getRecipe_name() != null) {
		          
		            pstmt.setString(pos++, Recipe.getRecipe_name());// 물음표 부분이 pos++로 인해 동적으로 늘어남
		         }
		         pstmt.setInt(pos++, Recipe.getFirst());      // 물음표부분이 pos++로 인해 동적으로 늘어남
		         pstmt.setInt(pos++, Recipe.getLast());
	
				rs = pstmt.executeQuery();
				while(rs.next()) {
					resultVO = new RecipeVO();
					resultVO.setMain_img(rs.getString("main_img"));
					resultVO.setRecipe_name(rs.getString("recipe_name"));
					resultVO.setMember_id(rs.getString("member_id"));
					resultVO.setRecipe_number(rs.getInt("recipe_number"));
					resultVO.setRecipe_date(rs.getString("recipe_date").substring(0,10));
					resultVO.setMember_image(rs.getString("member_image"));
					list.add(resultVO);
				} 
			 }catch(Exception e) {
				 e.printStackTrace();		 
			 } finally {
				 ConnectionManager.close(rs, pstmt, conn);
			 }
			return list;
		}
		
		public int count(RecipeVO Recipe) {
			int cnt = 0;
		      try {
		         conn = ConnectionManager.getConnnect();
		         String where = "";
		         if(Recipe.getRecipe_name() != null) {
		            where += " and recipe_name like '%' || ? || '%'";
		         }
		         String sql = "select count(*) from recipe r where not exists(select * from product p where p.recipe_number = r.recipe_number and PRODUCT_STATUS = 'N')" + where;
		         
		         pstmt = conn.prepareStatement(sql);
		         int pos = 1;
		         if(Recipe.getRecipe_name() !=null) {
		            pstmt.setString(pos++,Recipe.getRecipe_name());
		            
		         }
		         rs = pstmt.executeQuery();
		         rs.next();
		         cnt = rs.getInt(1);
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         ConnectionManager.close(conn);
		      }
		      return cnt;
		}
		
		public RecipeVO recipeSelectOne(RecipeVO Recipe) {
			conn = ConnectionManager.getConnnect();
			RecipeVO resultVO = new RecipeVO();
			try { 
	         
				 String sql = "select r.main_img, r.recipe_name, r.member_id, r.recipe_number, r.cooking_level,"
				 		+ " r.cooking_time, r.recipe_content, r.recipe_date, m.seller_code ,m.member_image"
				 		+ " from recipe r, member m where r.member_id = m.member_id AND"
				 		+ " r.recipe_number = ?";
				 pstmt = conn.prepareStatement(sql); 
		         pstmt.setInt(1, Recipe.getRecipe_number());
				rs = pstmt.executeQuery();

				if(rs.next()) {
					resultVO = new RecipeVO();
					resultVO.setMain_img(rs.getString("main_img"));
					resultVO.setRecipe_name(rs.getString("recipe_name"));
					resultVO.setMember_id(rs.getString("member_id"));
					resultVO.setRecipe_number(rs.getInt("recipe_number"));
					resultVO.setCooking_level(rs.getString("cooking_level"));
					resultVO.setCooking_time(rs.getString("cooking_time"));
					resultVO.setRecipe_content(rs.getString("recipe_content"));
					resultVO.setRecipe_date(rs.getString("recipe_date"));
					resultVO.setSeller_code(rs.getString("seller_code"));
					resultVO.setMember_image(rs.getString("member_image"));
					
				} 
			 }catch(Exception e) {
				 e.printStackTrace();		 
			 } finally {
				 ConnectionManager.close(rs, pstmt, conn);
			 }
			return resultVO;
		}
		
		// 삭제
		public int recipeDelete(RecipeVO recipeVO) {
			int r = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "delete from recipe where recipe_number = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, recipeVO.getRecipe_number());
				r = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
		}

		// 수정
		public int recipeUpdate(RecipeVO recipeVO) {
			int r = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "UPDATE recipe SET  recipe_name=?,  "
						   + "recipe_content=?, member_id=?, cooking_time=?, cooking_level=?, main_img=? "
						   + "WHERE recipe_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, recipeVO.getRecipe_name());
				pstmt.setString(2, recipeVO.getRecipe_content());
				pstmt.setString(3, recipeVO.getMember_id());
				pstmt.setString(4, recipeVO.getCooking_time());
				pstmt.setString(5, recipeVO.getCooking_level());
				pstmt.setString(6, recipeVO.getMain_img());
				pstmt.setInt(7, recipeVO.getRecipe_number());
		
				r = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
		}
		
		public ArrayList<RecipeVO> choiceSelectAll(RecipeVO Recipe) { //재료 클릭시 재료포함 레시피 모두 출력
			conn = ConnectionManager.getConnnect();
			RecipeVO resultVO = new RecipeVO();
			ArrayList<RecipeVO> list = new ArrayList<RecipeVO>();
			try { 
				 String sql = "select a.* from (select rownum rn,b.* from ( " 
						 + "select r.recipe_number,r.recipe_name,r.RECIPE_DATE,r.RECIPE_CONTENT,r.MEMBER_ID,r.COOKING_TIME,r.COOKING_LEVEL,r.MAIN_IMG,(select member_image from member where member_id = r.member_id) as member_image from recipe r  JOIN product prod "
						 + "ON r.recipe_number = prod.recipe_number AND prod.product_name = ? and not exists(select * from product p where p.recipe_number = r.recipe_number and PRODUCT_STATUS = 'N')" 
						 + "  order by product_name desc" 
						 + "  ) b) a where rn between ? and ?";
				 pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
		         int pos = 1;   // 물음표값 동적으로 하려고 변수선언
		         pstmt.setString(pos++, Recipe.getMain_img());
		         if(Recipe.getRecipe_name() != null) {
		          
		            pstmt.setString(pos++, Recipe.getRecipe_name());// 물음표 부분이 pos++로 인해 동적으로 늘어남
		         }
		         pstmt.setInt(pos++, Recipe.getFirst());      // 물음표부분이 pos++로 인해 동적으로 늘어남
		         pstmt.setInt(pos++, Recipe.getLast());
	
				rs = pstmt.executeQuery();
				while(rs.next()) {
					resultVO = new RecipeVO();
					resultVO.setMain_img(rs.getString("main_img"));
					resultVO.setRecipe_name(rs.getString("recipe_name"));
					resultVO.setMember_id(rs.getString("member_id"));
					resultVO.setRecipe_number(rs.getInt("recipe_number"));
					resultVO.setMember_image(rs.getString("member_image"));
					list.add(resultVO);
				} 
			 }catch(Exception e) {
				 e.printStackTrace();		 
			 } finally {
				 ConnectionManager.close(rs, pstmt, conn);
			 }
			return list;
		}
		
		public int choiceCount(RecipeVO Recipe) {
			int cnt = 0;
		      try {
		         conn = ConnectionManager.getConnnect();
		     
		         String sql = "SELECT count(*) FROM recipe re JOIN product prod ON re.recipe_number = prod.recipe_number AND prod.product_name = ?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, Recipe.getMain_img());
		         
		         rs = pstmt.executeQuery();
		         rs.next();
		         cnt = rs.getInt(1);
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         ConnectionManager.close(conn);
		      }
		      return cnt;
		}
		
		public int recipePhotoUpdate(RecipePhotoVO recipephotoVO) {
			int r = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "UPDATE recipe_photo SET cooking_content=?, photo_name=? "
						   + "WHERE photo_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, recipephotoVO.getCooking_content());
				pstmt.setString(2, recipephotoVO.getCooking_photo_name());
				pstmt.setInt(3, recipephotoVO.getRecipe_number());
				
				
				r = pstmt.executeUpdate();
				System.out.println(r + " 건 입력 완료 ");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
		}
}
