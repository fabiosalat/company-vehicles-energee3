package com.energee3.stage.companyVehicles.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.energee3.stage.companyVehicles.model.Bookings;
import com.energee3.stage.companyVehicles.model.Employees;
import com.energee3.stage.companyVehicles.model.Utilization;
import com.energee3.stage.companyVehicles.model.Vehicles;
import com.energee3.stage.companyVehicles.repository.BookingsRepository;
import com.energee3.stage.companyVehicles.repository.UtilizationRepository;
import com.energee3.stage.companyVehicles.repository.VehiclesRepository;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.tags.Tag;

@CrossOrigin
@RestController
@RequestMapping("/api/bookings")
@Api(produces = "application/json", tags = {"Bookings Controller"})
@Tag(name = "Bookings Controller", description = "Operations on Bookings and Utilization")
@Validated
public class BookingsController {

	@Autowired
	private BookingsRepository bookings;
	@Autowired
	private UtilizationRepository utilization;
	@Autowired
	private VehiclesRepository vehicles;
	
	
	@ApiOperation(value = "Return all bookings in database")
	@GetMapping("/findAll")
	public Iterable<Bookings> getAllBookings(){
		return bookings.findAll();
	}
	
	@ApiOperation(value = "Return all available vehicles to book")
	@GetMapping("/available/{start_d}&{end_d}")
	@Transactional
	public Iterable<Vehicles> getAvailableVehicles(
			@PathVariable("start_d") @ApiParam(required = true, value = "Start date of booking") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startD, 
			@PathVariable("end_d") @ApiParam(required = true, value = "End date of booking") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endD) {
		Timestamp startDate = Timestamp.valueOf(startD);
		Timestamp endDate = Timestamp.valueOf(endD);
		
		return vehicles.getAvailableVehicles(startDate, endDate);
	}

	@ApiOperation(value = "Return all utilizations by booking id")
	@GetMapping("/utilizationsByBookingId/{booking_id}")
	public List<Utilization> getUtilizationsByBookingId(
			@PathVariable("booking_id") @ApiParam(value = "Booking Id", required = true) Bookings booking_id){
		return utilization.findAllUtilizationByBookingId(booking_id);
	}
	
	@ApiOperation(value = "Find a booking by id")
	@GetMapping("/findById/{booking_id}")
	public Bookings getBookingsById(
			@PathVariable("booking_id") @ApiParam(value = "Booking Id", required = true) Integer bookingId) {
		return bookings.findById(bookingId).get();
	}

	@ApiOperation(value = "Find all bookings by its employee id")
	@GetMapping("/findByEmployeeId/{employee_id}")
	public List<Bookings> getBookingsByEmployeeId(
			@PathVariable("employee_id") @ApiParam(value = "Employee Id", required = true) Employees employeeId) {
		return bookings.findAllBookingsByEmployeeId(employeeId);
	}
	
	@ApiOperation(value = "Insert a new booking")
	@PostMapping("/newBooking")
	@Transactional
	public int newBooking(@RequestBody Bookings newBooking) {
		return bookings.insertNewBooking(newBooking.getEmployeeId(), newBooking.getVehicleId(), newBooking.getStartDate(), newBooking.getEndDate());
	}
	
	@ApiOperation(value = "Insert a new utilization")
	@PostMapping("/insertKmNote")
	public void insertKmNote(@RequestBody Utilization newUtilization) {
		utilization.save(newUtilization);
	}
	
	@ApiOperation(value = "Update note by id")
	@PutMapping("/updateUtilizationNote/{id}")
	public Utilization updateNote(@RequestBody Utilization note, 
			@PathVariable("id") @ApiParam(value = "Utilization Id", required = true) Integer id) {
		Utilization util = utilization.findById(id).get();
		util.setNote(note.getNote());
		return utilization.save(util);
	}

}
