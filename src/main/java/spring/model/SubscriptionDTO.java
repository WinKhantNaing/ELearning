package spring.model;

import java.io.Serializable;

import lombok.Data;
@Data
public class SubscriptionDTO implements Serializable{

	private int subId;
	private String subPlan;
	private String duration;
	private double price;
}
