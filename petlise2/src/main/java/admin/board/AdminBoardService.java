package admin.board;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface AdminBoardService {
	public List<AdminBoardResponseDTO> findAllBoard(String keyword, int page);
	public List<AdminBoardReportResponseDTO> findAllBoardReport(String keyword, int page);
	public List<AdminCommentReportResponseDTO> findAllCommentReport(String keyword, int page);
	public void deleteBoard(Date deleted_at, String board_id);
	public void updateBoardCommentDeleted(Date deleted_at, String comment_id);
	
	public List<AdminBoardResponseDTO> findAllPetplace(String keyword, int page);
	public List<AdminBoardReportResponseDTO> findAllPetplaceReport(String keyword, int page);
	public List<AdminCommentReportResponseDTO> findAllPetplaceCommentReport(String keyword, int page);
	public void deletePetplace(Date deleted_at, String board_id);
	public void updatePetplaceCommentDeleted(Date deleted_at, String comment_id);
}
