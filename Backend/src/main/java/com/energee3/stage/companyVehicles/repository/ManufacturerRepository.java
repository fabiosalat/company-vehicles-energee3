package com.energee3.stage.companyVehicles.repository;

import org.springframework.data.repository.CrudRepository;

import com.energee3.stage.companyVehicles.model.Manufacturer;

public interface ManufacturerRepository extends CrudRepository<Manufacturer, Integer> {
	public Manufacturer findManufacturerByName(String name);
}
