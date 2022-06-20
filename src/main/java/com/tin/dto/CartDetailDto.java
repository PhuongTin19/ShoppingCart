package com.tin.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDetailDto implements Serializable {
	
	private static final long serialVersionUID = -7864376668131312145L;
	
	private Long orderId;
	private Long productId;
	private Double price;
	private Integer quantity;
	private String name;
	private String image;
}
