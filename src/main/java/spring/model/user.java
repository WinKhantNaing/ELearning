package spring.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class user implements Serializable{
	
	private Integer userId;
	private String userName;
	private String email;
	private String password;
	private String gender;
	private String role;
	private String userImagePath;
	
}
