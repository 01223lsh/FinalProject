package funding.service.face;

import java.util.HashMap;
import java.util.List;

import funding.dto.Order;
import funding.dto.Payment;
import funding.dto.Reward;

/**
 * @author youngjae
 *
 */
/**
 * @author youngjae
 *
 */
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
	 * @param order - 주문 정보가 있는 객체
	 * @param rewardNoArr - 리워드 번호 배열 
	 * @param rewardCountArr - 리워드 개수의 배열 
	 */
	public void addOrder(Order order, int[] rewardNoArr, int[] rewardCountArr);
	
	/**
	 * 주문번호에 해당하는 선택한 리워드, 리워드 갯수
	 * @param order - 주문번호 있는 객체
	 * @return order
	 */
	public List<Order> detailRewardOrder(Order order);
	
	/**
	 * 받아온 json데이터를 map으로 받아 payment DTO에 저장하여 DB 저장
	 * @param map - 결제 api를 통해 받아온 json 데이터
	 * @return  
	 */
	public void addPayment(HashMap<String, String> map);
	
	/**
	 * 받아온 json데이터를 map으로 받아 delivery DTO에 저장하여 DB 저장
	 * @param map - 결제 api를 통해 받아온 json 데이터
	 */
	public void addDelivery(HashMap<String, String> map);

	/** 
	 * orderNo를 통하여 남은재고를 감소 시킨다.
	 * @param parseInt
	 */
	public void decreaseAmount(int orderNo);

	/**
	 * orderNo를 통하여 결제 상태를 결제 완료로 변경
	 * 
	 * @param orderNo
	 */
	public void changeStatus(int orderNo);
}
