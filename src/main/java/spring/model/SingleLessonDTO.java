package spring.model;

import lombok.Data;

@Data
public class SingleLessonDTO {
	
	private Integer lessonId;
	private String name;
	private String description;
	private String purStatus;
	private String image;

}
