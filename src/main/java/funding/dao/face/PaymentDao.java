package funding.dao.face;

import java.util.List;

import funding.dto.Delivery;
import funding.dto.Order;
import funding.dto.Reward;

public interface PaymentDao {

	/**
	 * reward를 조회하는 쿼리문 실행
	 * @return - rewardList
	 */
	public List<Reward> selectReward();
	
	/**
	 * rewardNo를 통해 reward를 조회하는 쿼리문 실행
	 * @param rewardNo 
	 * @return - reward
	 */
	public Reward selectByRewardNo(Reward rewardNo);
	
	/**
	 * 주문 테이블에 주문정보 삽입 
	 * @param order - 입력한 주문정보가 들어있는 DTO 객체
	 */
	public void insertOrder(Order order);

	/**
	 * 리워드 주문 매핑 테이블에 리워드 번호, 수량, 주문 번호 삽입!
	 * @param rewardNoArr - 선택한 여러 리워드 배열 
	 * @param rewardCountArr - 여러 리워드에 대한 수량 
	 */
	public void insertRewardOrder(Order order);

	/**
	 * 배송지 정보를 배송지 테이블에 삽입
	 * @param delivery - 주문번호가 들어있는 DTO객
	 */
	public void insertDelivery(Delivery delivery);

}
