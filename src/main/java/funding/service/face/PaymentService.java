package funding.service.face;

import java.util.List;

import funding.dto.Reward;

public interface PaymentService {
	
	/**
	 * reward 목록을 조회한다.
	 * 
	 * @return - rewardList
	 */
	public List<Reward> rewardList();

}
