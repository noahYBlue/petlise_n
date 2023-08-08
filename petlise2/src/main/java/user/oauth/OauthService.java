package user.oauth;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletResponse;
import user.UserDAO;
import user.UserDTO;

@Service
public class OauthService {
	@Autowired
	UserDAO dao;
	
	private GoogleOauth googleOauth;
	private HttpServletResponse response;

	public OauthService(GoogleOauth googleOauth, HttpServletResponse response) {
		this.googleOauth = googleOauth;
		this.response = response;
	}

	public void request(String socialLoginType) throws IOException {
		String redirectURL = googleOauth.getOauthRedirectURL();

		response.sendRedirect(redirectURL);
	}

	public GoogleUserDTO oAuthLogin(String socialLoginPath, String code) throws IOException {
		ResponseEntity<String> accessTokenResponse = googleOauth.requestAccessToken(code);

		GoogleOAuthTokenDTO oAuthToken = googleOauth.getAccessToken(accessTokenResponse);

		ResponseEntity<String> userInfoResponse = googleOauth.requestUserInfo(oAuthToken);

		GoogleUserDTO googleUser = googleOauth.getUserInfo(userInfoResponse);
		
		return googleUser;
	}
	
	public void joinGoogle(UserDTO dto) {
		dao.insertUser(dto);
	}

	public UserDTO loginGoogle(String email) {
		return dao.checkUserInfo(email);
	}
}
