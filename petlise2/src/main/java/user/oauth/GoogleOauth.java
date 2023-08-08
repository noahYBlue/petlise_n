package user.oauth;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class GoogleOauth implements SocialOauth {
	@Value("${spring.OAuth2.google.url}")
	private String GOOGLE_SNS_LOGIN_URL;

	@Value("${spring.OAuth2.google.client-id}")
	private String GOOGLE_SNS_CLIENT_ID;

	@Value("${spring.OAuth2.google.redirect-uri}")
	private String GOOGLE_SNS_REDIRECT_URI;

	@Value("${spring.OAuth2.google.client-secret}")
	private String GOOGLE_SNS_CLIENT_SECRET;

	@Value("${spring.OAuth2.google.scope}")
	private String GOOGLE_DATA_ACCESS_SCOPE;

	@Autowired
	private ObjectMapper objectMapper;

	public GoogleOauth(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public String getOauthRedirectURL() {
		Map<String, Object> params = new HashMap();
		params.put("scope", GOOGLE_DATA_ACCESS_SCOPE);
		params.put("response_type", "code");
		params.put("client_id", GOOGLE_SNS_CLIENT_ID);
		params.put("redirect_uri", GOOGLE_SNS_REDIRECT_URI);

		String parameterString = params.entrySet().stream().map(x -> x.getKey() + "=" + x.getValue())
				.collect(Collectors.joining("&"));
		String redirectURL = GOOGLE_SNS_LOGIN_URL + "?" + parameterString;

		return redirectURL;
	}

	public ResponseEntity<String> requestAccessToken(String code) {
		String GOOGLE_TOKEN_REQUEST_URL = "https://oauth2.googleapis.com/token";
		RestTemplate restTemplate = new RestTemplate();
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("client_id", GOOGLE_SNS_CLIENT_ID);
		params.put("client_secret", GOOGLE_SNS_CLIENT_SECRET);
		params.put("redirect_uri", GOOGLE_SNS_REDIRECT_URI);
		params.put("grant_type", "authorization_code");

		ResponseEntity<String> responseEntity = restTemplate.postForEntity(GOOGLE_TOKEN_REQUEST_URL, params,
				String.class);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			return responseEntity;
		}
		return null;
	}

	public GoogleOAuthTokenDTO getAccessToken(ResponseEntity<String> response) throws JsonProcessingException {
		GoogleOAuthTokenDTO googleOAuthToken = objectMapper.readValue(response.getBody(), GoogleOAuthTokenDTO.class);

		return googleOAuthToken;
	}

	public ResponseEntity<String> requestUserInfo(GoogleOAuthTokenDTO oAuthToken) {
		String GOOGLE_USERINFO_REQUEST_URL = "https://www.googleapis.com/oauth2/v1/userinfo";

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + oAuthToken.getAccess_token());

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity(headers);

		RestTemplate restTemplate = new RestTemplate();

		ResponseEntity<String> response = restTemplate.exchange(GOOGLE_USERINFO_REQUEST_URL, HttpMethod.GET, request,
				String.class);
		return response;
	}
	
	public GoogleUserDTO getUserInfo(ResponseEntity<String> userInfoRes) throws JsonProcessingException{
		GoogleUserDTO googleUser = objectMapper.readValue(userInfoRes.getBody(),GoogleUserDTO.class);
		
        return googleUser;
    }

}