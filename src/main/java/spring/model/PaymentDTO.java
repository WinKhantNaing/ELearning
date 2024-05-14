package spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private Integer paymentId;
	private Integer userId;
	private Integer subId;
	private String paymentMethod;
	private String startDate;
	private String endDate;

}
