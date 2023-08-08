package user.oauth;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import user.BCryptService;
import user.UserDTO;

@RestController
@RequestMapping(value = "/login/oauth2", produces = "application/json")
public class OauthController {

	@Autowired
	OauthService service;

	@Autowired
	private BCryptService bCryptService;

	@Value("${spring.bcrypt.number}")
	private int bcryptNum;

	@GetMapping("/{socialLoginPath}")
	public void googleLogin(@PathVariable String socialLoginPath) throws IOException {

		service.request(socialLoginPath);
	}

	@GetMapping("/code/{socialLoginPath}")
	public ModelAndView googleLoginResult(@RequestParam String code, @PathVariable String socialLoginPath, HttpSession session)
			throws IOException {
		ModelAndView mv = new ModelAndView();

		GoogleUserDTO googleUserInfo = service.oAuthLogin(socialLoginPath, code);
		UserDTO dto = service.loginGoogle(googleUserInfo.getEmail());

		if (dto == null) {
			UserDTO user = new UserDTO();
			String hashPassword = bCryptService.encodeBcrypt(googleUserInfo.getId(), bcryptNum);

			user.setEmail(googleUserInfo.getEmail());
			user.setName(googleUserInfo.getName());
			user.setPassword(hashPassword);
			user.setAddress("");
			
			service.joinGoogle(user);
			dto = service.loginGoogle(googleUserInfo.getEmail());
			
			session.setAttribute("user_id", dto.getUser_id());
			session.setAttribute("role", dto.getRole());
			
			mv.setViewName("redirect:/");
		} else if (dto != null) {
			session.setAttribute("user_id", dto.getUser_id());
			session.setAttribute("role", dto.getRole());
			
			mv.setViewName("redirect:/");
		}
		

		return mv;
	}
}
