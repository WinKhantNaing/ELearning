package spring.model;

import java.io.Serializable;

public class CourseStatusTDO implements Serializable{

	private String status;
	private int courseId;

	public CourseStatusTDO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
}
