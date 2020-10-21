package buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BuyMileageDAO;
import model.MemberVO;
import model.cartDAO;
import model.orderDetailDAO;
import model.orderVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class orderDetailController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
orderVO VO = new orderVO();
		
		String member_id = (String) request.getSession().getAttribute("id");
		String recipe_number = request.getParameter("recipe_number");
		String[] product_number =request.getParameterValues("product_number");
		
		String arr = (String) request.getParameter("arr");	
		ArrayList<orderVO> list = new ArrayList<orderVO>();
		
		try {
            JSONArray nameArray = (JSONArray) JSONSerializer.toJSON(arr);
            System.out.println(nameArray.size());
            for(Object js : nameArray){
            	JSONObject json = (JSONObject) js;
            	orderVO vo = new orderVO();
            	VO.setMember_id(member_id);
            	vo.setMember_id(member_id);
                vo.setProduct_quantity((String) json.get("product_quantity"));
                vo.setProduct_price((String) json.get("product_price"));
                vo.setProduct_name((String) json.get("product_name"));
                vo.setRecipe_name((String) json.get("recipe_name"));
                vo.setMain_img((String) json.get("main_img"));
                list.add(vo);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
		
		MemberVO vo = (MemberVO) request.getSession().getAttribute("login");
		request.getSession().setAttribute("vo", vo);
		
	//	ArrayList<orderVO> array = cartDAO.getInstance().order_detail(product_number);
		orderVO mil = BuyMileageDAO.getInstance().selectOne(VO);
//		System.out.println(array);
		request.setAttribute("mil", mil);
		request.setAttribute("array", list);

		request.getRequestDispatcher("/buy/buyDetail.jsp").forward(request, response);
		}
	}
