package com.energee3.stage.companyVehicles.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.energee3.stage.companyVehicles.model.Manufacturer;
import com.energee3.stage.companyVehicles.model.Model;

public interface ModelRepository extends CrudRepository<Model, Integer> {
	public List<Model> findModelsByManufacturerId(Manufacturer manufacturerId);
}
