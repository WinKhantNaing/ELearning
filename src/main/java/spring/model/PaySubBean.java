package spring.model;

import java.io.Serializable;

public class PaySubBean implements Serializable{

	private String subPlan;
	private String duration;
	private String startDate;
	private String endDate;
	public PaySubBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSubPlan() {
		return subPlan;
	}
	public void setSubPlan(String subscriptionPlan) {
		this.subPlan = subscriptionPlan;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
