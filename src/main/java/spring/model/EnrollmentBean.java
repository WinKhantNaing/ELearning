package spring.model;

import java.io.Serializable;

public class EnrollmentBean implements Serializable{

	private int enrollmentId;
	private int userId;
	private int unitId;
	private String unitStatus;
	public EnrollmentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getEnrollmentId() {
		return enrollmentId;
	}
	public void setEnrollmentId(int enrollmentId) {
		this.enrollmentId = enrollmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public String getUnitStatus() {
		return unitStatus;
	}
	public void setUnitStatus(String unitStatus) {
		this.unitStatus = unitStatus;
	}
	
}
