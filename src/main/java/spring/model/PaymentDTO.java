package spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private Integer paymentId;
	private Integer userId;
	private Integer subscriptionId;
	private String paymentMethod;
	private Date startDate;
	private Date endDate;

}
