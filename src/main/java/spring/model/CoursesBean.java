
package spring.model;

import java.io.Serializable;

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
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCoursePrefix() {
		return coursePrefix;
	}
	public void setCoursePrefix(String coursePrefix) {
		this.coursePrefix = coursePrefix;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseDescription() {
		return courseDescription;
	}
	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}
	public String getCourseImagePath() {
		return courseImagePath;
	}
	public void setCourseImagePath(String courseImagePath) {
		this.courseImagePath = courseImagePath;
	}
	public String getCourseStatus() {
		return courseStatus;
	}
	public void setCourseStatus(String courseStatus) {
		this.courseStatus = courseStatus;
	}
	
	
}
