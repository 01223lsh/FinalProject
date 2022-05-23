package funding.dao.face;

import java.util.List;

import funding.dto.Alert;

public interface AlertDao {

	/**
	 * 안읽은 알림 리스트 불러오기
	 * 
	 * @param memberNo
	 * @return
	 */
	public List<Alert> alertSelect(int memberNo);
	
	
	/**
	 * 선택한 알림 읽기
	 * 
	 * @param alertNo
	 */
	public void alertRead(int alertNo);

	
	/**
	 * 안읽은 알림 수 불러오기
	 * 
	 * @param memberNo
	 * @return
	 */
	public int unreadAlertAllCnt(int memberNo);

	
	/**
	 * 모든 알림 읽기
	 * 
	 * @param alertNo
	 */
	public void alertReadAll(int memberNo);
	
	
}
