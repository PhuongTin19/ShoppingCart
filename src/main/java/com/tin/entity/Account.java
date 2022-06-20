package com.tin.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity 
@Table(name = "Accounts")
public class Account  implements Serializable{
	@Id
	String username;
	
	String password;
	
	String fullname;
	
	@Email
	String email;
	
	String image;
	
	Boolean admin;
	
	String address;
	String phone;
	
	Boolean isdeleted=false;

	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
