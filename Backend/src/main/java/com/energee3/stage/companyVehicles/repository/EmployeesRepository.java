package com.energee3.stage.companyVehicles.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.energee3.stage.companyVehicles.model.Employees;

public interface EmployeesRepository extends CrudRepository<Employees, Integer>, JpaRepository<Employees, Integer> {
	public Optional<Employees> findByEmail(String email);
}
