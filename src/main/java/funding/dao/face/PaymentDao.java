package funding.dao.face;

import java.util.List;

import funding.dto.Reward;

public interface PaymentDao {

	/**
	 * reward를 조회하는 쿼리문 실행
	 * @return - rewardList
	 */
	public List<Reward> selectReward();

}
