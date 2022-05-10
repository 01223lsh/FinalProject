package funding.service.face;

import java.util.List;

import funding.dto.Delivery;
import funding.dto.Order;
import funding.dto.Reward;

public interface PaymentService {
	
	/**
	 * reward 목록을 조회한다.
	 * 
	 * @return - rewardList
	 */
	public List<Reward> rewardList();
	
	/**
	 * rewardNo를 통해서 해당 reward의 정보를 조회 
	 * @param rewardNo - rewardNo가 있는 DTO
	 * @return - reward 정보
	 */
	public Reward detailReward(Reward rewardNo);

	/**
	 * 배송지 정보, 회원 정보, 리워드 정보를 주문 테이블과 주문 리워드 매핑 테이블에 삽입한다.
	 * 
	 * @param order - 주문 정보가 있는 객체
	 * @param rewardNoArr - 리워드 번호 배열 
	 * @param rewardCountArr - 리워드 개수의 배열 
	 */
	public void addOrder(Order order, Delivery delivery, int[] rewardNoArr, int[] rewardCountArr);

}
