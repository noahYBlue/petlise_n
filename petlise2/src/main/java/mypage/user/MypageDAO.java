package mypage.user;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MypageDAO {
	public MypageDTO userInfo(String id);
	public void updateUser(String name, String address, String profile_image, String pet_type, String pet_name,
			String pet_age, String id);
	public void updateDelete(Date deleted_at, String id);
	public String checkPw(String id);
	public void updatePw(String password, String id);
	
	public int orderCount(String id);
	public int productCommentsCount(String id);
	public int qnaCount(String id);
	public int recipeCount(String id);
	public int recipeCommentsCount(String id);
	public int boardCount(String id);
	public int boardCommentsCounts(String id);
}
