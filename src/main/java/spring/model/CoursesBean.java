package spring.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CoursesBean implements Serializable{

	public CoursesBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	private int courseId;
	private String coursePrefix;
	private String courseName;
	private String courseIntroduction;
	private String courseDescription;
	private String courseImagePath;
	private String courseStatus;
	private int isActive;
	MultipartFile courseImage;
	
	
}
