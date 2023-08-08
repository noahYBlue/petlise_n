package com.example.demo;

import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
@ComponentScan(basePackages = {"mypage", "shop", "user", "recipe", "admin", "upload", "board", "home", "notice"})
@MapperScan(basePackages = {"mypage", "shop", "user", "recipe", "admin","board", "home", "notice"})

public class PetliseApplication {

	@PostConstruct
    public void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
    }
	
	public static void main(String[] args) {
		SpringApplication.run(PetliseApplication.class, args);
	}

}
