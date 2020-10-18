package teamProject3.order.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject3.order.OrderVO;
import teamProject3.order.mapper.OrderDAO;
import teamProject3.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired OrderDAO orderDAO;
	
	@Override
	public ArrayList<OrderVO> getOrderoutput(OrderVO vo) {
		return orderDAO.getOrderoutput(null);
	}

	@Override
	public ArrayList<OrderVO> dailySales(OrderVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.dailySales(null);
	}

	@Override
	public int Insertoutput(OrderVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int InsertDetail(OrderVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
