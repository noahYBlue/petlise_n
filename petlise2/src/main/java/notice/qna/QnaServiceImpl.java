package notice.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	QnaDAO dao;
	
	public List<QnAResponseDTO> findAllQna(String keyword, int page){
		return dao.findAllQna(keyword, page);
	}
	public void insertQna(QnaRequestDTO dto) {
		dao.insertQna(dto);
	}
	public QnaRequestDTO findQna (String notice_id) {
		return dao.findQna(notice_id);
	}
	public void updateQna(EditQnaRequestDTO dto) {
		dao.updateQna(dto);
	}
	public void updateViewCount(String notice_id) {
		dao.updateViewCount(notice_id);
	}
	public void deleteQna(String notice_id) {
		dao.deleteQna(notice_id);
	}
	public List<CommentResponseDTO> findAllComment(String notice_id){
		return dao.findAllComment(notice_id);
	}
	public void insertComment(String notice_id, String content) {
		dao.insertComment(notice_id, content);
	}
	public void deleteComment(String comment_id) {
		dao.deleteComment(comment_id);
	}
}
