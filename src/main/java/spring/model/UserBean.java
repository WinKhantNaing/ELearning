package spring.model;

public class UserBean {
private boolean isLogin;
private Integer userId;
private String useremail;
private String userpassword;
public boolean isLogin() {
	return isLogin;
}
public void setLogin(boolean isLogin) {
	this.isLogin = isLogin;
}
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public String getUseremail() {
	return useremail;
}
public void setUseremail(String useremail) {
	this.useremail = useremail;
}
public String getUserpassword() {
	return userpassword;
}
public void setUserpassword(String userpassword) {
	this.userpassword = userpassword;
}

}
