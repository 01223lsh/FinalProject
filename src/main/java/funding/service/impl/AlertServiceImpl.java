package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.AlertDao;
import funding.dto.Reward;
import funding.service.face.AlertService;

@Service
public class AlertServiceImpl implements AlertService{
	
	@Autowired
	AlertDao alertDao;
	
	@Override
	public List<Reward> alertSelect(int memberNo) {
		//알림 리스트 불러오기

		return alertDao.alertSelect(memberNo);
	}
}
