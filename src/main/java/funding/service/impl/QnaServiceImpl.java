package funding.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import funding.dao.face.QnaDao;
import funding.dto.Qna;
import funding.service.face.QnaService;
import funding.util.Paging;

@Service
public class QnaServiceImpl implements QnaService{

	private static final Logger logger = LoggerFactory.getLogger(QnaServiceImpl.class);
	
	@Autowired
	QnaDao qnaDao;
	
	@Override
	public List<Qna> list(Paging paging) {
		return qnaDao.selectList(paging);
	}
	
	@Override
	public Paging getPaging(Paging pagingParam) {
		
		//전체 총 게시글 수 조회
		int totalCount = qnaDao.selectCntAll(pagingParam);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, pagingParam.getCurPage() );
		
		//검색
		paging.setSelect(pagingParam.getSelect());
		paging.setSearch(pagingParam.getSearch());
		
		logger.info("두번째 페이징 내용물 : {} " , paging);
		
		return paging;
	}
	
	@Override
	public Qna qnaview(Qna viewqna) {
		Qna qna = qnaDao.selectByQnaNo(viewqna);
		
		return qna;
	}
	
	@Override
	public void qnawrite(Qna qna) {

		//게시글 번호 알아오기
		int qnaNo = qnaDao.getQnaNo();
		qna.setQnaNo(qnaNo);
		
		
		//회원 번호 알아오기
//		int member_no = qnaDao.getMember_no();
//		qna.setMember_no(member_no);
		
		if("".equals(qna.getQnaTitle())){
			qna.setQnaTitle("(제목없음)");
		}
		qnaDao.insertQna(qna);
		
	}
	
	@Override
	public void qnaupdate(Qna qna) {

		logger.info("수정할 게시글 번호 : {}", qna.getQnaNo());
		
		if("".equals(qna.getQnaTitle())){
			qna.setQnaTitle("(제목없음)");
		}
		qnaDao.updateQna(qna);
		
		
	}
	
	@Transactional
	@Override
	public void qnarewrite(Qna qna) {
		
//		게시글 번호 알아오기
//		int qnaNo = qnaDao.getQnaNo();
//		qna.setQnaNo(qnaNo);
		
		if("".equals(qna.getQnaTitle())){
			qna.setQnaTitle("(제목없음)");
		}
		
		//답글 하나만 쓰게 할거니까 안만들거임.. 하긴 해야할까.. 귀찮은데..
		qnaDao.updateQnaAll(qna);
		
		qnaDao.insertQnare(qna);
		
	}
	
	
	
	
	@Override
	public void delete(Qna qna) {

		logger.info("삭제하려는 글 번호 : {}", qna.getQnaNo());

		qnaDao.deleteQna(qna);

	}
	
	@Override
	public int qnaReCnt(Qna viewqna) {
		return qnaDao.selectCntQnare(viewqna);
	}
	
	
	
	
}
