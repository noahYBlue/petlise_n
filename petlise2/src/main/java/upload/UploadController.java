package upload;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
public class UploadController {

	@Value("${spring.cloud.gcp.storage.bucket}")
	private String bucketName;

	@Autowired
	UploadService upload;

	@ResponseBody
	@RequestMapping(value = "/api/image-upload", method = RequestMethod.POST)
	public String imageUpload(MultipartFile image, HttpSession session) throws IOException {
		String imageUrl = upload.uploadFile(image);

		return bucketName + "/" + imageUrl;
	}
}