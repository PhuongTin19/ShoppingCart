package com.tin.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity 
@Table(name = "Color")
public class Color {
	@Id
	int id;
	String name;
	@OneToMany(mappedBy = "color")
	List<Product> color;
	
}
