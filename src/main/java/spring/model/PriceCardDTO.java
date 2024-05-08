package spring.model;

import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PriceCardDTO implements Serializable {
	
	private double price;
	private String plan;
	private String duration;

}
