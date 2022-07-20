package com.energee3.stage.companyVehicles.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="manufacturer")
public class Manufacturer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "name", columnDefinition = "VARCHAR(50)", nullable = false, unique = true)
	private String name;

	@OneToMany(mappedBy = "manufacturerId", cascade = {CascadeType.REMOVE, CascadeType.MERGE})
	private Set<Model> models;
	
	/**
	 * CONSTRUCTORS
	 */

	public Manufacturer() {
	}

	public Manufacturer(String name) {
		this.name = name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/*public Set<Model> getModels() {
		return models;
	}

	*/
	
	public void setModels(Set<Model> models) {
		this.models = models;
	}
	
	
}


