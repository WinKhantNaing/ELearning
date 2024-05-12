package spring.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class QuizOption implements Serializable{
	private int quizId;
	private String quizQuestion;
	private int optionId;
	private String selection;
	private int isCorrect;
	private int unitId;
}
