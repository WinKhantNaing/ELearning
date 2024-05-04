package spring.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class unit implements Serializable {
	
	private Integer unitId;
	private String unitName;
	private Integer lessonId;
	private Integer quizId;
	private Integer workoutId;
	private String content;

}
