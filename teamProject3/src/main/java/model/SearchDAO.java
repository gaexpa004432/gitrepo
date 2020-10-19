package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class SearchDAO {
	Connection conn;
	PreparedStatement pstmt;	
	
	
	//싱글톤
	static SearchDAO instance;
	public static SearchDAO getInstance() {
		if(instance == null)
			instance = new SearchDAO();
			return instance;
	}
	
	public ArrayList<SearchVO> searchRes(SearchVO searchVO) {
		SearchVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select res_no, res_name, res_content, res_date from res " + 
					"where res_name like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchVO.getRes_name());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SearchVO();
				resultVO.setRes_no(rs.getInt(1));
				resultVO.setRes_name(rs.getString(2));
				resultVO.setRes_content(rs.getString(3));
				resultVO.setRes_date(rs.getString(4));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<SearchVO> searchRecipe(SearchVO searchVO) {
		SearchVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select recipe_number, recipe_name, recipe_content, recipe_date, member_id from recipe " + 
					"where recipe_name like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchVO.getRecipe_name());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SearchVO();
				resultVO.setRecipe_number(rs.getInt(1));
				resultVO.setRecipe_name(rs.getString(2));
				resultVO.setRecipe_content(rs.getString(3));
				resultVO.setRecipe_date(rs.getString(4));
				resultVO.setMember_id(rs.getString(5));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<SearchVO> searchResCon(SearchVO searchVO) {
		SearchVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select res_no, res_name, res_content, res_date from res " + 
					"where res_content like '%' || ? || '%'";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchVO.getRes_content());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SearchVO();
				resultVO.setRes_no(rs.getInt(1));
				resultVO.setRes_name(rs.getString(2));
				resultVO.setRes_content(rs.getString(3));
				resultVO.setRes_date(rs.getString(4));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<SearchVO> searchRecipeCon(SearchVO searchVO) {
		SearchVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select recipe_number, recipe_name, recipe_date, recipe_content, member_id from recipe " + 
					"where recipe_content like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchVO.getRecipe_content());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SearchVO();
				resultVO.setRecipe_number(rs.getInt(1));
				resultVO.setRecipe_name(rs.getString(2));
				resultVO.setRecipe_content(rs.getString(3));
				resultVO.setRecipe_date(rs.getString(4));
				resultVO.setMember_id(rs.getString(5));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<SearchVO> searchProduct(SearchVO searchVO) {
		SearchVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select p.product_name, r.recipe_number, r.recipe_name from recipe r join product p " + 
					"on (r.recipe_number=p.recipe_number) " + 
					"where p.product_name like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchVO.getProduct_name());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SearchVO();
				resultVO.setProduct_name(rs.getString(1));
				resultVO.setRecipe_number(rs.getInt(2));
				resultVO.setRecipe_name(rs.getString(3));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<SearchVO> searchArea(SearchVO searchVO) {
		SearchVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select res_no, res_name, res_si, res_gu from res " + 
					"where res_gu like '%' || ? || '%' " + 
					"or res_si like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchVO.getRes_address());
			pstmt.setString(2, searchVO.getRes_address());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SearchVO();
				resultVO.setRes_no(rs.getInt(1));
				resultVO.setRes_name(rs.getString(2));
				resultVO.setRes_si(rs.getString(3));
				resultVO.setRes_gu(rs.getString(4));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<String> recipeName(String keyWord) {
		String result = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select recipe_name from recipe where recipe_name like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
				list.add(result);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public ArrayList<String> resName(String keyWord) {
		String result = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select res_name from res where res_name like '%' || ? || '%'" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
				list.add(result);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
}
