package spring.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseBean implements Serializable {
	int courseId;
	String prefix;
	String courseName;
	String courseDescription;
	String courseImagePath;
	MultipartFile courseImage;
	String courseStatus;
}
