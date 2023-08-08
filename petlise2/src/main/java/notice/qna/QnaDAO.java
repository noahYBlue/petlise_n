package notice.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QnaDAO {
	public List<QnAResponseDTO> findAllQna(String keyword, int page);
	public void insertQna(QnaRequestDTO dto);
	public QnaRequestDTO findQna(String notice_id);
	public void updateQna(EditQnaRequestDTO dto);
	public void updateViewCount(String notice_id);
	public void deleteQna(String notice_id);
	public List<CommentResponseDTO> findAllComment(String notice_id);
	public void insertComment(String notice_id, String content);	
	public void deleteComment(String comment_id);
}
