package spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommentDto {
	
	private String userName;
	private MultipartFile file;
	private String filePath;
	private String comments;
	private String date;
	private Integer rating;

}
