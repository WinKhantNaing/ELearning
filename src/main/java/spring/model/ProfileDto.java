package spring.model;

import lombok.Data;

@Data
public class ProfileDto {
	
	private Integer userId;
	private String userName;
	private String userEmail;
	private String password;
	private String gender;
	
}
