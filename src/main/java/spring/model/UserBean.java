package spring.model;

import lombok.Data;

@Data
public class UserBean {
	private boolean isLogin;
	private int userId;
	private String useremail;
	private String userpassword;
}
