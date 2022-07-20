package com.energee3.stage.companyVehicles;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.energee3.stage.companyVehicles.repository")
public class CompanyVehiclesApplication {

	public static void main(String[] args) {
		SpringApplication.run(CompanyVehiclesApplication.class, args);

	}

}
