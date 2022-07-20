package com.energee3.stage.companyVehicles.repository;

import java.sql.Timestamp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import com.energee3.stage.companyVehicles.model.Vehicles;

public interface VehiclesRepository extends CrudRepository<Vehicles, String>, JpaRepository<Vehicles, String> {
	@Procedure("available")
	public Iterable<Vehicles> getAvailableVehicles(Timestamp start_d, Timestamp end_d);	
}
