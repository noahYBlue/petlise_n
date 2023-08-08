package admin.board;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	@Autowired
	AdminBoardDAO dao;

	public List<AdminBoardResponseDTO> findAllBoard(String keyword, int page) {
		return dao.findAllBoard(keyword, page);
	}
	public List<AdminBoardReportResponseDTO> findAllBoardReport(String keyword, int page){
		return dao.findAllBoardReport(keyword, page);
	}
	public List<AdminCommentReportResponseDTO> findAllCommentReport(String keyword, int page){
		return dao.findAllCommentReport(keyword, page);
	}
	public void deleteBoard(Date deleted_at, String board_id) {
		dao.deleteBoard(deleted_at, board_id);
	}
	public void updateBoardCommentDeleted(Date deleted_at, String comment_id) {
		dao.updateBoardCommentDeleted(deleted_at, comment_id);
	}
	
	public List<AdminBoardResponseDTO> findAllPetplace(String keyword, int page){
		return dao.findAllPetplace(keyword, page);
	}
	public List<AdminBoardReportResponseDTO> findAllPetplaceReport(String keyword, int page){
		return dao.findAllPetplaceReport(keyword, page);
	}
	public List<AdminCommentReportResponseDTO> findAllPetplaceCommentReport(String keyword, int page){
		return dao.findAllPetplaceCommentReport(keyword, page);
	}
	public void deletePetplace(Date deleted_at, String board_id) {
		dao.deletePetplace(deleted_at, board_id);
	}
	public void updatePetplaceCommentDeleted(Date deleted_at, String comment_id) {
		dao.updatePetplaceCommentDeleted(deleted_at, comment_id);
	}
}
