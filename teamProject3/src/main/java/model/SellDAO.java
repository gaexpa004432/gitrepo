package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class SellDAO {
	Connection conn;
	PreparedStatement pstmt;	
	
	
	//싱글톤
	static SellDAO instance;
	public static SellDAO getInstance() {
		if(instance == null)
			instance = new SellDAO();
			return instance;
	}
	
	
	public ArrayList<SellVO> sellRecipe(SellVO sellVO) {
		SellVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SellVO> list = new ArrayList<SellVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select o.order_number, o.order_date, sum(d.product_price), o.member_id, " + 
					"o.order_status, o.order_reason, p.seller_code, r.recipe_name " + 
					"from orderlist o, order_detail d, product p, recipe r " + 
					"where o.order_number=d.order_number " + 
					"and d.product_number=p.product_number " + 
					"and p.recipe_number=r.recipe_number " + 
					"and p.seller_code = ? " + 
					"group by o.order_number, o.order_date, o.member_id, " + 
					"p.seller_code, o.order_status, o.order_reason, r.recipe_name " + 
					"order by order_date desc" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sellVO.getSeller_code());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SellVO();
				resultVO.setOrder_number(rs.getInt(1));
				resultVO.setOrder_date(rs.getString(2));
				resultVO.setOrder_total(rs.getInt(3));
				resultVO.setMember_id(rs.getString(4));
				resultVO.setOrder_status(rs.getString(5));
				resultVO.setOrder_reason(rs.getString(6));
				resultVO.setSeller_code(rs.getInt(7));
				resultVO.setRecipe_name(rs.getString(8));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	public SellVO sellRecipeOne(SellVO sellVO) {
		SellVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select o.order_number, o.order_date, sum(d.product_price), o.member_id, " + 
					"o.order_status, o.order_reason, p.seller_code, r.recipe_name, " +
					"o.member_postcode, o.member_roadaddress, o.member_detailaddress, o.member_extraaddress " + 
					"from orderlist o, order_detail d, product p, recipe r, member m " + 
					"where o.order_number=d.order_number " + 
					"and d.product_number=p.product_number " + 
					"and p.recipe_number=r.recipe_number " +
					"and o.member_id=m.member_id " + 
					"and p.seller_code = ? " + 
					"and o.order_number = ? " + 
					"group by o.order_number, o.order_date, o.member_id, " + 
					"p.seller_code, o.order_status, o.order_reason, r.recipe_name, " + 
					"o.member_postcode, o.member_roadaddress, o.member_detailaddress, o.member_extraaddress " + 
					"order by order_date desc" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sellVO.getSeller_code());
			pstmt.setInt(2, sellVO.getOrder_number());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new SellVO();
				resultVO.setOrder_number(rs.getInt(1));
				resultVO.setOrder_date(rs.getString(2));
				resultVO.setOrder_total(rs.getInt(3));
				resultVO.setMember_id(rs.getString(4));
				resultVO.setOrder_status(rs.getString(5));
				resultVO.setOrder_reason(rs.getString(6));
				resultVO.setSeller_code(rs.getInt(7));
				resultVO.setRecipe_name(rs.getString(8));
				resultVO.setMember_postcode(rs.getString(9));
				resultVO.setMember_roadAddress(rs.getString(10));
				resultVO.setMember_detailAddress(rs.getString(11));
				resultVO.setMember_extraAddress(rs.getString(12));
			} else {
				System.out.println("no data");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return resultVO;
	}
	
	//order에서만 리스트 불러오기 (일단보류)
	/*public ArrayList<SellVO> sellRecipe(SellVO sellVO) {
		SellVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SellVO> list = new ArrayList<SellVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					"select * from order1 " + 
					"where seller_code = ? " + 
					"order by order_date desc" ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sellVO.getSeller_code());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SellVO();
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setOrder_date(rs.getString("order_date"));
				resultVO.setOrder_total(rs.getInt("order_total"));
				resultVO.setOrder_status(rs.getString("order_status"));
				resultVO.setOrder_reason(rs.getString("order_reason"));
				resultVO.setSeller_code(rs.getInt("seller_code"));
				resultVO.setOrder_number(rs.getInt("order_number"));
				list.add(resultVO);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}*/
		
		
	//sellList.jsp에 쓰일 count DAO
	public int count(SellVO sellVO) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String where = " where 1=1 ";
			if(sellVO.getOrder_status() != null) {
				where += " where order_status like '%' || ? || '%'";
			}
			String sql = "select count(*) from( " + 
					"select r.recipe_name, o.member_id, o.order_date, sum(d.product_price), " + 
					"o.order_status, o.order_reason, r.recipe_number, p.seller_code " + 
					"m.member_postcode, m.member_roadaddress, m.member_detailaddress, m.member_extraaddress" + 
					"from orderlist o, order_detail d, product p, recipe r " + 
					"where o.order_number=d.order_number  " + 
					"and d.product_number=p.product_number " + 
					"and p.recipe_number=r.recipe_number  " + 
					"and p.seller_code = 558881 " + 
					"group by  r.recipe_name, o.member_id, o.order_date, o.order_number, " + 
					"o.order_status, o.order_reason, r.recipe_number, p.seller_code" + 
					"order by order_date desc)" + where;
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			if(sellVO.getOrder_status() != null) {
				pstmt.setString(pos++, sellVO.getOrder_status());
			}
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}
	
	
	public int updateStatusOa(SellVO sellVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update order1 set order_status = 'oa' where order_number = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sellVO.getOrder_number());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	
	public int updateStatusOr(SellVO sellVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update orderlist set order_status = 'or', order_reason = ? where order_number = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellVO.getOrder_reason());
			pstmt.setInt(2, sellVO.getOrder_number());
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	public ArrayList<SellVO> sellSelectOne(SellVO sellVO) {
		SellVO resultVO = null;
		ResultSet rs = null;
		ArrayList<SellVO> list = new ArrayList<SellVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select d.order_detail_number, d.product_number, p.product_name, " + 
					"d.product_price, d.product_quantity, p.product_unit, p.recipe_number " + 
					"from order_detail d, product p " + 
					"where d.product_number=p.product_number " + 
					"and d.order_number = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sellVO.getOrder_number());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new SellVO();
				resultVO.setOrder_detail_number(rs.getInt(1));
				resultVO.setProduct_number(rs.getInt(2));
				resultVO.setProduct_name(rs.getString(3));
				resultVO.setProduct_price(rs.getInt(4));
				resultVO.setProduct_quantity(rs.getInt(5));
				resultVO.setProduct_unit(rs.getString(6));
				resultVO.setRecipe_number(rs.getInt(7));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
		}
		return list;
	}
	
	
	
	//판매자에게 걸려 있는 판매에 대한 디테일
//	public SellVO sellAllDetail(SellVO sellVO) {
//		SellVO resultVO = null;
//		ResultSet rs = null;
//		try {
//			conn = ConnectionManager.getConnnect();
//			String sql = "select a.* from( select b.* , rownum rn    from(" +
//					"select * from order1 o, order_detail d, product p, recipe r " + 
//					"where o.order_number=d.order_number " + 
//					"and d.product_number=p.product_number " + 
//					"and p.recipe_number=r.recipe_number " + 
//					"and p.seller_code = ?;";
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, sellVO.getSeller_code());
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				resultVO = new SellVO();
//				resultVO.setSeller_code(rs.getInt("seller_code"));
//				resultVO.setMember_id(rs.getString("member_id"));
//				resultVO.setOrder_date(rs.getString("order_date"));
//				resultVO.setOrder_number(rs.getInt("order_number"));
//				resultVO.setOrder_reason(rs.getString("order_reason"));
//				resultVO.setOrder_status(rs.getString("order_status"));
//				resultVO.setOrder_total(rs.getInt("order_total"));
//				resultVO.setProduct_name(rs.getString("product_name"));
//				resultVO.setProduct_price(rs.getInt("product_price"));
//				resultVO.setProduct_quantity(rs.getInt("product_quantity"));
//				resultVO.setRecipe_name(rs.getString("recipe_name"));
//				resultVO.setRecipe_number(rs.getInt("recipe_number"));
//			} else {
//				System.out.println("no data");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
//		}
//		return resultVO;
//	}
	
	
//	//sellList.jsp에 쓰일 paging DAO 
//	public ArrayList<SellVO> sellRecipe(SellVO sellVO) {
//		SellVO resultVO = null;
//		ResultSet rs = null;
//		ArrayList<SellVO> list = new ArrayList<SellVO>();
//		try {
//			conn = ConnectionManager.getConnnect();
//			String and = " and 1=1 ";
//			if(sellVO.getOrder_status() != null) { //검색을 위해서 존재
//				and += " and order_status like '%' || ? || '%'";
//			}
//			String sql = "select a.* from( select b.* , rownum rn    from(" + 
//					"select r.recipe_name, o.member_id, o.order_date, sum(d.product_price), " + 
//					"o.order_status, o.order_reason, r.recipe_number, p.seller_code " + 
//					"from order1 o, order_detail d, product p, recipe r " + 
//					"where o.order_number=d.order_number " + 
//					"and d.product_number=p.product_number " + 
//					"and p.recipe_number=r.recipe_number " + 
//					"and p.seller_code = ?" +
//					and + 
//					"group by o.order_number, o.order_date, o.member_id, " + 
//					"p.seller_code, o.order_status, o.order_reason, r.recipe_name, r.recipe_number " + 
//					"order by order_date desc" +
//					") b )a where rn between ? and ?";
//			pstmt=conn.prepareStatement(sql);
//			int pos = 1;
//			pstmt.setInt(pos++, sellVO.getSeller_code());
//			if(sellVO.getOrder_status() != null) {
//				pstmt.setString(pos++, sellVO.getOrder_status());
//			}
//			pstmt.setInt(pos++, sellVO.getFirst());
//			pstmt.setInt(pos++, sellVO.getLast());
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				resultVO = new SellVO();
//				resultVO.setRecipe_name(rs.getString(1));
//				resultVO.setMember_id(rs.getString(2));
//				resultVO.setOrder_date(rs.getString(3));
//				resultVO.setProduct_price(rs.getInt(4));
//				resultVO.setOrder_status(rs.getString(5));
//				resultVO.setOrder_reason(rs.getString(6));
//				resultVO.setRecipe_number(rs.getInt(7));
//				resultVO.setSeller_code(rs.getInt(8));
//				list.add(resultVO);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
//		}
//		return list;
//	}
	
	
	//sellList.jsp에 쓰일 DAO (페이징 생기기전 임시)
//	public ArrayList<SellVO> sellRecipe(SellVO sellVO) {
//		SellVO resultVO = null;
//		ResultSet rs = null;
//		ArrayList<SellVO> list = new ArrayList<SellVO>();
//		try {
//			conn = ConnectionManager.getConnnect();
//			String sql = 
//					"select r.recipe_name, o.member_id, o.order_date, sum(d.product_price), " + 
//					"o.order_status, o.order_reason, r.recipe_number, p.seller_code " + 
//					"from order1 o, order_detail d, product p, recipe r " + 
//					"where o.order_number=d.order_number " + 
//					"and d.product_number=p.product_number " + 
//					"and p.recipe_number=r.recipe_number " + 
//					"and p.seller_code = ?" +
//					"group by o.order_number, o.order_date, o.member_id, " + 
//					"p.seller_code, o.order_status, o.order_reason, r.recipe_name, r.recipe_number " + 
//					"order by order_date desc" ;
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, sellVO.getSeller_code());
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				resultVO = new SellVO();
//				resultVO.setRecipe_name(rs.getString(1));
//				resultVO.setMember_id(rs.getString(2));
//				resultVO.setOrder_date(rs.getString(3));
//				resultVO.setProduct_price(rs.getInt(4));
//				resultVO.setOrder_status(rs.getString(5));
//				resultVO.setOrder_reason(rs.getString(6));
//				resultVO.setRecipe_number(rs.getInt(7));
//				resultVO.setSeller_code(rs.getInt(8));
//				list.add(resultVO);
//			} 
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ConnectionManager.close(rs, pstmt, conn);//rs를 try안에서 선언하면 지역 변수 이기 때문에 try안에서만 사용 됨 , 그러니까 변수를 try밖으로 빼주고 초기값 null을 주면 에러없이 사용 가능
//		}
//		return list;
//	}
}
