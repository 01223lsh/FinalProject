package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.SearchDao;
import funding.dto.Project;
import funding.service.face.SearchService;
import funding.util.Paging;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDao searchDao;

	@Override
	public List<Project> list(Paging paging) {

		return searchDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {

		// 총 게시글 수 조회
		int totalCount = searchDao.selectCntAll(paramData);

		// 페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

	@Override
	public Project view(Project viewProject) {

		// 상세보기 조회 결과 리턴
		return searchDao.select(viewProject);
	}

}
