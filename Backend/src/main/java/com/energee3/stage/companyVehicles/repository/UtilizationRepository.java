package com.energee3.stage.companyVehicles.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import com.energee3.stage.companyVehicles.model.Bookings;
import com.energee3.stage.companyVehicles.model.Utilization;

public interface UtilizationRepository extends CrudRepository<Utilization, Integer> {
	public List<Utilization> findAllUtilizationByBookingId(Bookings bookingId);
}
