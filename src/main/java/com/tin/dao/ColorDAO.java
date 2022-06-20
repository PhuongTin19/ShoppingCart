package com.tin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tin.entity.Color;

public interface ColorDAO extends JpaRepository<Color, Integer> {

}
