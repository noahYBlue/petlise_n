package user;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserDAO {
	public int insertUser(UserDTO userDTO);
	public int checkEmail(String email);
	public UserDTO loginUser(String email);
	public String searchUser(String name, String email);
	public void newPassword(String password, String email);	
	public UserDTO checkUserInfo(String email);	
}
