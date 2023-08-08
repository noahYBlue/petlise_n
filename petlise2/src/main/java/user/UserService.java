package user;

public interface UserService {
	public int insertUser(UserDTO userDTO);
	public int checkEmail(String email);
	public UserDTO loginUser(String email);
	public String searchUser(String name, String email);
	public void newPassword(String password, String email);
}
