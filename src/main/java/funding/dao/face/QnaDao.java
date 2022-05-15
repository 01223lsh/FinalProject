package funding.dao.face;

import java.util.List;

import funding.dto.Qna;
import funding.util.Paging;

public interface QnaDao {

	public List<Qna> selectList(Paging paging);

	public int selectCntAll(Paging pagingParam);

	public Qna selectByQnaNo(Qna viewqna);

	public int getQnaNo();

	public int getMemberNo();
	
	public void insertQna(Qna qna);

	public void updateQna(Qna qna);

	public void deleteQna(Qna qna);

	public void updateQnaAll(Qna qna);

	public void insertQnare(Qna qna);

	public int selectCntQnare(Qna viewqna);

	
	
	
	
	
	
	

}
