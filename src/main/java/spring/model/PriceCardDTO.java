package spring.model;
import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
public class PriceCardDTO implements Serializable{

	private int subId;
	private double price;
	private String plan;
	private String duration;
	private int isActive;
}
