package board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pagination.SearchDTO;
import user.UserDTO;
@Mapper
@Repository
public interface BoardDAO {
  
   
    // Pagination
    List<BoardDTO> getAllBoardPaging(SearchDTO dto);
    List<BoardCommentDTO> getAllCommentPaging(SearchDTO dto);
    int getCount(SearchDTO dto);
    int getCCount(SearchDTO dto);
    int deleteBcomment(String comment_id);
    
    int insertBoard(BoardDTO dto);
    int insertBcomment(BoardCommentDTO dto) ;
	public BoardDTO findboard (int seq);
	
	public int viewCnt(int seq);
	
	
	public void updateboard(BoardDTO dto);
	
	public void deleteboard(int seq);
	UserDTO getUserInfoBoard(String user_id);
	int deleteAllComment(String board_id);


}
