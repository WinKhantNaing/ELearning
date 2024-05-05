package spring.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class LoginDTO implements Serializable{
	
	private String userName;
	private String email;
	private String password;

}
