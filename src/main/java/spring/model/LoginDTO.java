package spring.model;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class LoginDTO implements Serializable{
	
	private String email;
	private String password;

}
