package funding.service.face;

import java.util.List;

import funding.dto.Alert;

public interface AlertService {
	
	/**
	 * 알림 리스트 불러오기
	 * 
	 * @param memberNo 맴버 번호
	 * 
	 * @return 
 	 */
	public List<Alert> alertSelect(int memberNo);
	
	/**
	 * 선택한 알림 읽기
	 * 
	 * @param alertNo 알림 번호
	 */
	public void alertRead(int alertNo);
	
	/**
	 * 모든 알림 읽음처리
	 * 
	 */
	public void alertReadAll(int memberNo);

	/**
	 * 안읽은 알림 수 불러오기
	 * 
	 * @param memberNo
	 * @return
	 */
	public int alertUnread(int memberNo);

	
	
}