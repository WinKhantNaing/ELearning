package spring.model;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoginDTO implements Serializable{
	
	private String email;
	private String password;

}
