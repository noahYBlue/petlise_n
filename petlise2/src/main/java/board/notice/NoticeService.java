package board.notice;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;



@Service
public class NoticeService {
	@Autowired
	NoticeDAO dao;

	public int insertNotice(NoticeDTO dto) {
		return dao.insertNotice(dto);
	}

	public int maxNoticeNum() {
		return dao.maxNoticeNum();
	}

	public int countTotalNoticeNum() {
		return dao.countTotalNoticeNum();
	}
	
	public List<NoticeDTO> getAllNotice() {
		return dao.getAllNotice();
	}
	
	public NoticeDTO getNoticeById(String Notice_id) {
		return dao.getNoticeById(Notice_id);
	};
	
	public int deleteNotice(String Notice_id) {
		return dao.deleteNotice(Notice_id);
	};
	
	public int updateNotice(NoticeDTO dto) {
		return dao.updateNotice(dto);
	};
	
	public UserDTO getUserInfoNoticeboard(String user_id) {
		return dao.getUserInfoNoticeboard(user_id);
	}
	
	public NoticeDTO findnotice (String noitce_id) {
		return dao.findnotice(noitce_id);
	}
	
	
	
	//Pagination
	public PagingResponse<NoticeDTO> getAllNoticePaging(SearchDTO dto) {

        // 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<NoticeDTO> list = dao.getAllNoticePaging(dto);
        return new PagingResponse<>(list, pagination);
    }
	

}
