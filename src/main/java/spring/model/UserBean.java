package spring.model;

import java.io.Serializable;

import lombok.Data;
@Data
public class UserBean implements Serializable {
	private int userId;
	private String userName;
	private String userEmail;
	private String password;
	private String conPassword;
	private String gender;
	private String userRole;
  private boolean isLogin;
 

}
