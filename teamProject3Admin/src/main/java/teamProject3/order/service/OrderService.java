package teamProject3.order.service;

import java.util.ArrayList;

import teamProject3.order.OrderVO;

public interface OrderService {

	ArrayList<OrderVO> getOrderoutput(OrderVO vo);
	
	ArrayList<OrderVO> dailySales(OrderVO vo);
	
	int Insertoutput(OrderVO vo);

	int InsertDetail(OrderVO vo);
	
	void insertChat(OrderVO vo);
	
	ArrayList<OrderVO> selectChat();
	
	ArrayList<OrderVO> selectDay(OrderVO vo);
	
	ArrayList<OrderVO> selectMonth(OrderVO vo);
	
}