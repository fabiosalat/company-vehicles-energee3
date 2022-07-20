package com.energee3.stage.companyVehicles.model;

import java.sql.Timestamp;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "bookings")
public class Bookings {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "employee_id", referencedColumnName = "id",  nullable = false)
	private Employees employeeId;
	
	@ManyToOne
	@JoinColumn(name= "vehicle_id", referencedColumnName = "license_plate", columnDefinition = "VARCHAR(7)", nullable = false)
	@Pattern(regexp = "[a-zA-Z]{2}[0-9]{3}[a-zA-Z]{2}")
	private Vehicles vehicleId;
	
	@Column(name= "start_date", nullable = false)
	private Timestamp startDate;
	
	@Column(name= "end_date", nullable = false)
	private Timestamp endDate;
	
	@OneToMany(mappedBy = "bookingId", cascade = {CascadeType.REMOVE, CascadeType.MERGE})
	private Set<Utilization> utilizations;
	
	/**
	 * CONSTRUCTORS
	 */
	
	public Bookings() {
	}

	public Bookings(Employees employeeId, Vehicles vehicleId, Timestamp startDate, Timestamp endDate) {
		this.employeeId = employeeId;
		this.vehicleId = vehicleId;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	/**
	 * GETTERS AND SETTERS
	 */
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEmployeeId() {
		return employeeId.getId();
	}

	public void setEmployeeId(Employees employeeId) {
		this.employeeId = employeeId;
	}

	public String getVehicleId() {
		return vehicleId.getId();
	}

	public void setVehicleId(Vehicles vehicleId) {
		this.vehicleId = vehicleId;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	
	/*
	public Set<Utilization> getUtilizations() {
		return utilizations;
	}
	*/

	public void setUtilizations(Set<Utilization> utilizations) {
		this.utilizations = utilizations; 
	}
	
	 
}
