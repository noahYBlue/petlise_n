package admin.notice;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface AdminNoticeService {
	public void insertNotice(AdminNoticeRequestDTO dto);
	public List<AdminNoticeResponseDTO> findAllNotice(AdminFindAllNoticeRequestDTO dto);
	public AdminNoticeRequestDTO findNotice (String notice_id);
	public void updateNotice(AdminEditNoticeRequestDTO dto);
	public void deleteNotice(String notice_id);
	
	public List<AdminQnAResponseDTO> findAllQnA(String keyword, int page);
	public void deleteQnA(String notice_id);
}
