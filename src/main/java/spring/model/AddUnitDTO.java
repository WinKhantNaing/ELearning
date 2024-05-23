package spring.model;

import lombok.Data;

@Data
public class AddUnitDTO {
	
	private String unitName;
	private String content;
	private String workOut;
	private String hint;
	private String quiz;
	private String option1;
	private String option2;
	private int answer;

}
