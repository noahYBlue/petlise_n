package board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import board.petplace.PetPlaceDTO;
import pagination.SearchDTO;
import user.UserDTO;



@Mapper
@Repository
public interface NoticeDAO {
	int insertNotice(NoticeDTO dto);
	int maxNoticeNum();
	int countTotalNoticeNum();
	List<NoticeDTO> getAllNotice();
	int deleteNotice(String _id);	
	NoticeDTO getNoticeById(String Notice_id);
	int updateNotice(NoticeDTO dto);
	UserDTO getUserInfoNoticeboard(String user_id);
	//Pagination
	List<NoticeDTO> getAllNoticePaging(SearchDTO dto);
	int getCount(SearchDTO dto);
	//윤승민 작업
	public NoticeDTO findnotice (String noitce_id);
	
	
	
	
}
