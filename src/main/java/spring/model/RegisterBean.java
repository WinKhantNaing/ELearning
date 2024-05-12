package spring.model;

public class RegisterBean {
private String uname;
private String uemail;
private String upassword;
private String conpassword;
public String getConpassword() {
	return conpassword;
}
public void setConpassword(String conpassword) {
	this.conpassword = conpassword;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getUemail() {
	return uemail;
}
public void setUemail(String uemail) {
	this.uemail = uemail;
}
public String getUpassword() {
	return upassword;
}
public void setUpassword(String upassword) {
	this.upassword = upassword;
}

}
