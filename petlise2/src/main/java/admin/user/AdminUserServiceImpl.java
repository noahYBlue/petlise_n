package admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	AdminUserDAO dao;

	public List<AdminUserResponseDTO> findAllUser(String keyword, int page){
		return dao.findAllUser(keyword, page);
	}
	public List<AdminUserResponseDTO> findJoinUser(){
		return dao.findJoinUser();
	}
	public void updateUserPoint(int point, String id) {
		dao.updateUserPoint(point, id);
	}
	public int findTodayOrder() {
		return dao.findTodayOrder();		
	}
	public int findTodayRecipe() {
		return dao.findTodayRecipe();
	}
	public int findTodayBoard() {
		return dao.findTodayBoard();
	}
	public int findTodayPetplace() {
		return dao.findTodayPetplace();
	}
}
