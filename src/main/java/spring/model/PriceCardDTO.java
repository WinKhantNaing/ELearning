package spring.model;
import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class PriceCardDTO implements Serializable{

	private int subId;
	private double price;
	private String plan;
	private String duration;
}
