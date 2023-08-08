package board;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
     BoardDAO dao;

    public PagingResponse<BoardDTO> getAllBoardPaging(SearchDTO dto) {
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        List<BoardDTO> list = dao.getAllBoardPaging(dto);
        return new PagingResponse<>(list, pagination);
    }
    public PagingResponse<BoardCommentDTO> getAllCommentPaging(SearchDTO dto) {
        int count = dao.getCCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        List<BoardCommentDTO> list = dao.getAllCommentPaging(dto);
        return new PagingResponse<>(list, pagination);
    }

   
    @Override
    public int insertBoard(BoardDTO dto) {
        // Your logic to insert the pet place into the database

        // Assuming you have a method in the mapper to insert the pet place
        dao.insertBoard(dto);

        // Get the generated seq after insertion and set it in the DTO
        int generatedPlaceId = dto.getSeq();
        dto.setSeq(generatedPlaceId);
		return generatedPlaceId;
    }




	public int viewCnt(int seq) {
		// TODO Auto-generated method stub
		return dao.viewCnt(seq);
	}

	
	public BoardDTO findboard(int seq) {
		return dao.findboard(seq);
	}




	@Override
	public int updateboard(BoardDTO dto) {
		dao.updateboard(dto);
		 int generatedPlaceId = dto.getSeq();
	        dto.setSeq(generatedPlaceId);
			return generatedPlaceId;
		
	}




	public void deleteboard(int seq) {
		dao.deleteboard(seq);
	}
	@Override
	public int insertBcomment(BoardCommentDTO dto) {
		 return dao.insertBcomment(dto);	}
	
	@Override
	public int deleteBcomment(String comment_id) {
		return dao.deleteBcomment(comment_id);
	}
	@Override
	public UserDTO getUserInfoBoard(String user_id) {
		return dao.getUserInfoBoard(user_id);
	}

	




	
}
