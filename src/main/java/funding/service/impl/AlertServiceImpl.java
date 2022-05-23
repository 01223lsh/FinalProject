package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.AlertDao;
import funding.dto.Alert;
import funding.service.face.AlertService;

@Service
public class AlertServiceImpl implements AlertService{
	
	@Autowired
	AlertDao alertDao;
	
	@Override
	public List<Alert> alertSelect(int memberNo) {
		
		//알림 리스트 불러오기
		return alertDao.alertSelect(memberNo);
	}
	
	@Override
	public void alertRead(int alertNo) {
		
		//선택한 알림 읽기
		alertDao.alertRead(alertNo);
		
	}
	
	@Override
	public void alertReadAll(int memberNo) {
		
		//모든 알림 읽기
		alertDao.alertReadAll(memberNo);
		
	}
	
	@Override
	public int alertUnread(int memberNo) {

		return alertDao.unreadAlertAllCnt(memberNo);
	}
	
	
	
}
