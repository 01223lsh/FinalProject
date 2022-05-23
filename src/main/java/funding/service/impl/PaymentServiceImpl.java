package funding.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import funding.dao.face.PaymentDao;
import funding.dto.Delivery;
import funding.dto.Order;
import funding.dto.Payment;
import funding.dto.Project;
import funding.dto.Reward;
import funding.service.face.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDao paymentDao;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentService.class);
	
	@Override
	public List<Reward> rewardListByProjectNo(int projectNo) {
		return paymentDao.selectRewardByProjectNo(projectNo);
	}
	
	@Override
	public Reward detailReward(Reward rewardNo) {
		return paymentDao.selectByRewardNo(rewardNo);
	}
	
	@Override
	@Transactional
	public void addOrder(Order order, int[] rewardNoArr, int[] rewardCountArr) {
		//주문테이블에 주문정보 삽입 
		paymentDao.insertOrder(order);
		
		//리워드 주분 테이블에 리워드 수량, 리워드 번호, 주문 번호 삽입
		for (int i=0; i<rewardNoArr.length; i++) {
			order.setRewardNo(rewardNoArr[i]);
			order.setRewardCount(rewardCountArr[i]);
			paymentDao.insertRewardOrder(order);
		}
	}
	
	@Override
	public List<Order> detailRewardOrder(Order order) {
		return paymentDao.selectRewardOrderByOrderNo(order);
	}
	
	@Override
	public void addPayment(HashMap<String, String> map) {
		//payment DTO 생성 
		//json 데이터 받아서 넣기
		Payment payment = new Payment();
		payment.setOrderNo(Integer.parseInt(map.get("orderNo")));
		payment.setProjectNo(Integer.parseInt(map.get("projectNo")));
		payment.setPaymentCode(map.get("paymentCode"));
		payment.setPaymentMethod(map.get("paymentMethod"));
		payment.setPaymentTotal(map.get("paymentTotal"));
		
		logger.info("결제 DTO 확인~~~~~~~~~~~~~ : {}", payment);
		
		paymentDao.insertPayment(payment);
		
	}
	
	@Override
	public void addDelivery(HashMap<String, String> map) {
		//delivery DTO 생성
		//json 데이터 받아서 넣기
		Delivery delivery = new Delivery();
		delivery.setOrderNo(Integer.parseInt(map.get("orderNo")));
		delivery.setPostalCode(map.get("postalCode"));
		delivery.setAddress(map.get("address"));
		delivery.setAddressDetail(map.get("addressDetail"));
		delivery.setAddressExtra(map.get("addressExtra"));
		delivery.setPrecautions(map.get("precautions"));
		delivery.setRecipientName(map.get("recipientName"));
		delivery.setRecipientPhone(map.get("recipientPhone"));
		
		paymentDao.insertDelivery(delivery);
		
	}
	
	@Override
	@Transactional
	public void decreaseAmount(int orderNo) {
		Order order = new Order();
		order.setOrderNo(orderNo);
		//orderNo와 일치하는 매핑 테이블의 데이터 조회 
		List<Order> rewardOrderList = paymentDao.selectRewardOrderByOrderNo(order);
		
		//조회된 행 만큼 반복한다.
		for (int i=0; i<rewardOrderList.size(); i++) {
			
			//rewardNo와 주문 갯수를 reward DTO객체에 넣어서 주문한 재고만큼 줄여주는 쿼리문 실행
			Reward reward = new Reward();
			
			reward.setRewardNo(rewardOrderList.get(i).getRewardNo());
			
			reward = paymentDao.selectByRewardNo(reward);
			
			//rewardno를통해 리워드 테이블의 남은 재고 컬럼값에서 리워드 주문 매핑 테이블의 주문 갯수를 빼준 뒤
			//그 값을 update 해주는 쿼리문 실행 한다.
			reward.setRewardAmount(reward.getRewardAmount() - rewardOrderList.get(i).getRewardCount());
			
			paymentDao.updateRewardAmount(reward);
			
		}
	}
	
	@Override
	public void changeStatus(int orderNo) {
		paymentDao.updateOrderStatus(orderNo);
	}
	
	@Override
	public Project checkProjectTitle(Project project) {
		return paymentDao.selectProjectTitleByProjectNo(project);
	}
	@Override
	public Order detailOrder(Order order) {
		return paymentDao.selectByOrderNo(order);
	}

	@Override
	public int cntPayment(int projectNo) {
		return paymentDao.selectCntPaymentByProjectNo(projectNo);
	}
}
