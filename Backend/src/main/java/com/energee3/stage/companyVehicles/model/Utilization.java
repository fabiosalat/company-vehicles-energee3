package com.energee3.stage.companyVehicles.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="utilization")
public class Utilization {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "booking_id", referencedColumnName = "id",  nullable = false)
	private Bookings bookingId;
	
	@Column(name= "start_date", columnDefinition = "TIMESTAMP DEFAULT CURRENT TIMESTAMP", nullable = false)
	private Timestamp startDate;
	
	@Column(name= "end_date", nullable = false)
	private Timestamp endDate;
	
	@Column(name="km", precision = 10, scale = 2, nullable = false)
	private BigDecimal km;
	
	@Column(name="note")
	private String note;
	
	/**
	 * CONSTRUCTORS
	 */
	
	public Utilization() {
	}

	public Utilization(Bookings bookingId, Timestamp startDate, Timestamp endDate, BigDecimal km, String note) {
		this.bookingId = bookingId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.km = km;
		this.note = note;
	}

	public Utilization(Bookings bookingId, Timestamp startDate, Timestamp endDate, BigDecimal km) {
		this.bookingId = bookingId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.km = km;
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

	public Integer getBookingId() {
		return bookingId.getId();
	}

	public void setBookingId(Bookings bookingId) {
		this.bookingId = bookingId;
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

	public BigDecimal getKm() {
		return km;
	}

	public void setKm(BigDecimal km) {
		this.km = km;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
}
