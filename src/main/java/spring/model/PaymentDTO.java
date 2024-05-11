package spring.model;

import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class PaymentDTO implements Serializable {

	private int userId;
	private int subId;
	private String method;
	private String startDate;
	private String endDate;
}
