package spring.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class CoursesBean implements Serializable{

	public CoursesBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	private int courseId;
	private String coursePrefix;
	private String courseName;
	private String courseDescription;
	private String courseImagePath;
	private String courseStatus;
	private int isActive;
	MultipartFile courseImage;
	
	
}
