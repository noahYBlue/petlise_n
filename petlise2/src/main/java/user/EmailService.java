package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {
	@Autowired
	private JavaMailSender javaMailSender;
	private static final String senderEmail = "petlise13@gmail.com";
	private static int number;

	public static void createNumber() {
		number = (int) (Math.random() * (90000)) + 100000;
	}

	public int sendEmail(String email) {
		createNumber();

		MimeMessage message = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");

			helper.setFrom(senderEmail);
			helper.setTo(email);
			helper.setSubject("이메일 인증");

			String body = "";
			body += "<h3>" + "요청하신 인증 번호는" + "</h3>";
			body += "<h1>" + number + "</h1>";
			body += "<h3>" + "입니다. 감사합니다." + "</h3>";
			helper.setText(body, true);

			javaMailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return number;
	}
}