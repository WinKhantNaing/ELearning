package spring.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

public class UserBean implements Serializable {
	private Integer userId;
	private String userName;
	private String userEmail;
	private String password;
	private String conPassword;
	private String gender;
	private String userRole;
	private boolean isLogin;
	private MultipartFile file;
	private String filePath;
 

}
