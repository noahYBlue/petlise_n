package mypage.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDAO dao;

	public MypageDTO userInfo(String id) {
		return dao.userInfo(id);
	}

	public void updateUser(String name, String address, String profile_image, String pet_type, String pet_name,
			String pet_age, String id) {
		dao.updateUser(name, address, profile_image, pet_type, pet_name, pet_age, id);
	}
	
	public void updateDelete (Date deleted_at, String id) {
		dao.updateDelete(deleted_at, id);
		
	}

	public String checkPw(String id) {
		return dao.checkPw(id);
	}

	public void updatePw(String password, String id) {
		dao.updatePw(password, id);
	}

	@Override
	public int orderCount(String id) {
		return dao.orderCount(id);
	}

	@Override
	public int productCommentsCount(String id) {
		return dao.productCommentsCount(id);
	}

	@Override
	public int qnaCount(String id) {
		return dao.qnaCount(id);
	}

	@Override
	public int recipeCount(String id) {
		return dao.recipeCount(id);
	}

	@Override
	public int recipeCommentsCount(String id) {
		return dao.recipeCommentsCount(id);
	}

	@Override
	public int boardCount(String id) {
		return dao.boardCount(id);
	}

	@Override
	public int boardCommentsCounts(String id) {
		return dao.boardCommentsCounts(id);
	}

}
