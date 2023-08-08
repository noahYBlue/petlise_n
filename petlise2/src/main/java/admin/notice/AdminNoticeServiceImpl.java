package admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	AdminNoticeDAO dao;

	public void insertNotice(AdminNoticeRequestDTO dto) {
		dao.insertNotice(dto);
	}

	public List<AdminNoticeResponseDTO> findAllNotice(AdminFindAllNoticeRequestDTO dto){
		return dao.findAllNotice(dto);
	}

	public AdminNoticeRequestDTO findNotice(String notice_id) {
		return dao.findNotice(notice_id);
	}

	public void updateNotice(AdminEditNoticeRequestDTO dto) {
		dao.updateNotice(dto);
	}

	public void deleteNotice(String notice_id) {
		dao.deleteNotice(notice_id);
		
	}
	
	public List<AdminQnAResponseDTO> findAllQnA(String keyword, int page){
		return dao.findAllQnA(keyword, page);
	}

	public void deleteQnA(String notice_id) {
		dao.deleteQnA(notice_id);
	}
	
}
