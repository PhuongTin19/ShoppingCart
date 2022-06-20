package com.tin.dto;

import java.io.Serializable;
import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDto implements Serializable{

	private static final long serialVersionUID = 7383352793847277132L;
	
	private Long username;
	private String address;
	private String phone;
	private Integer totalQuantity = 0;
	private Double totalPrice = 0.0;
	private HashMap<Long,CartDetailDto> listDetail = new HashMap<>();
	
}
