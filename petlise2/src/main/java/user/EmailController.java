package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {
	@Autowired
	EmailService service;

	@PostMapping("/sendemail")
	@ResponseBody
	public String sendEmail(String email) {
		int number = service.sendEmail(email);
		String num = "" + number;

		return num;
	}
}