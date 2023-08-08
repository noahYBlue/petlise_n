package upload;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import jakarta.servlet.http.HttpServlet;

@Service
public class UploadService extends HttpServlet {

	@Value("${spring.cloud.gcp.storage.bucket}")
	private String bucketName;
	
	@Value("${spring.cloud.gcp.storage.credentials.location}")
	private String location;

	private static Storage storage = null;

	public String uploadFile(MultipartFile image) throws IOException {
		String uuid = UUID.randomUUID().toString();
		String ext = image.getContentType();
		
		InputStream keyFile = ResourceUtils.getURL(location).openStream();

		StorageOptions storageOptions = StorageOptions.newBuilder().setProjectId(bucketName)
				.setCredentials(GoogleCredentials.fromStream(keyFile)).build();

		storage = storageOptions.getService();

		BlobId blobId = BlobId.of(bucketName, uuid);
		BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType(ext).build();

		storage.create(blobInfo, image.getBytes());
		
		return blobInfo.getName();
	}
}
