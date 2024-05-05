package spring.model;

import lombok.Data;

@Data
public class UserDTO {
	
	private Integer userId;
	private String userName;
	private String email;
	private String gender;
	private String role;
	private String image;

}
