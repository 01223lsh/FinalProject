package funding.service.face;

import java.util.List;

import funding.dto.Qna;
import funding.util.Paging;

public interface QnaService {

	public Paging getPaging(Paging pagingParam);

	public List<Qna> list(Paging paging);

	public Qna qnaview(Qna viewqna);

	public void qnawrite(Qna qna);

	public void qnaupdate(Qna qna);

	public void delete(Qna qna);

	public void qnarewrite(Qna qna);

	public int qnaReCnt(Qna viewqna);

	public Qna qnareview(Qna qnaview);

}
