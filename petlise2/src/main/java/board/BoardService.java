package board;

import org.springframework.stereotype.Service;


import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

@Service
public interface BoardService {
    


    PagingResponse<BoardDTO> getAllBoardPaging(SearchDTO dto);
	PagingResponse<BoardCommentDTO> getAllCommentPaging(SearchDTO dto);
	public int insertBoard(BoardDTO dto);

	public int insertBcomment(BoardCommentDTO comment);
	public BoardDTO findboard (int seq);
	public int viewCnt(int seq);
	public int updateboard(BoardDTO dto);
	int deleteBcomment(String comment_id);
	UserDTO getUserInfoBoard(String user_id);
	
	public void deleteboard(int seq);
}
