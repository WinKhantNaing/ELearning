package spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PhotoDto {
	
	private MultipartFile file;
	private String filepath;

}
