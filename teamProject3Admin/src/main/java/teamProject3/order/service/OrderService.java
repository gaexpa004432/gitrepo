package teamProject3.order.service;

import java.util.ArrayList;

import teamProject3.order.OrderVO;

public interface OrderService {

	ArrayList<OrderVO> getOrderoutput(OrderVO vo);
	
	ArrayList<OrderVO> dailySales(OrderVO vo);
	
	int Insertoutput(OrderVO vo);

	int InsertDetail(OrderVO vo);
	


}