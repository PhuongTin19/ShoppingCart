package com.tin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@EnableAutoConfiguration(exclude = {SecurityAutoConfiguration.class})
@SpringBootApplication
public class Ps18888NguyenphuongtinAsmApplication {

	public static void main(String[] args) {
		SpringApplication.run(Ps18888NguyenphuongtinAsmApplication.class, args);
	}

}
