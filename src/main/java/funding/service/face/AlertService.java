package funding.service.face;

import java.util.List;

import funding.dto.Reward;

public interface AlertService {
	
	/**
	 * 알림 리스트 불러오기
	 * 
	 * @param memberNo 맴버 번호
	 * 
	 * @return 
 	 */
	public List<Reward> alertSelect(int memberNo);
}