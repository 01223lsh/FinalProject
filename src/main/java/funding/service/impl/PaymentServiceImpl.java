package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.PaymentDao;
import funding.dto.Delivery;
import funding.dto.Order;
import funding.dto.Reward;
import funding.service.face.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDao paymentDao;
	
	@Override
	public List<Reward> rewardList() {
		return paymentDao.selectReward();
	}

	@Override
	public Reward detailReward(Reward rewardNo) {
		return paymentDao.selectByRewardNo(rewardNo);
	}
	
	@Override
	public void addOrder(Order order, Delivery delivery, int[] rewardNoArr, int[] rewardCountArr) {
		//주문테이블에 주문정보 삽입 
		paymentDao.insertOrder(order);
		
		//배송지 테이블에 배송지 정보 삽입
		delivery.setOrderNo(order.getOrderNo());
		paymentDao.insertDelivery(delivery);
		
		//리워드 주분 테이블에 리워드 수량, 리워드 번호, 주문 번호 삽입
		for (int i = 0; i < rewardNoArr.length; i++) {
			order.setRewardNo(rewardNoArr[i]);
			order.setRewardCount(rewardCountArr[i]);
			paymentDao.insertRewardOrder(order);
		}
	}
}
