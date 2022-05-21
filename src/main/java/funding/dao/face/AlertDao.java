package funding.dao.face;

import java.util.List;

import funding.dto.Reward;

public interface AlertDao {

	/**
	 * 안읽은 알림 리스트 불러오기
	 * 
	 * @param memberNo
	 * @return
	 */
	public List<Reward> alertSelect(int memberNo);
	
	
}
