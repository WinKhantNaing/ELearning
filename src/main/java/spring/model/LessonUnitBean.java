package spring.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class LessonUnitBean implements Serializable{
	private String lessonName;
	private String unitName;
	private String lessonIntroduction;
	private int unitId;
}
