package spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProfileDto {
	
	private Integer userId;
	private String userName;
	private String userEmail;
	private String password;
	private String userRole;
	private MultipartFile file;
	private String filePath;
	
}
