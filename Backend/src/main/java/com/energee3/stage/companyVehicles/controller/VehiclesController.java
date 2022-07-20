package com.energee3.stage.companyVehicles.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.energee3.stage.companyVehicles.model.Manufacturer;
import com.energee3.stage.companyVehicles.model.Model;
import com.energee3.stage.companyVehicles.model.Vehicles;
import com.energee3.stage.companyVehicles.repository.ManufacturerRepository;
import com.energee3.stage.companyVehicles.repository.ModelRepository;
import com.energee3.stage.companyVehicles.repository.VehiclesRepository;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.tags.Tag;

@CrossOrigin
@Api(produces = "application/json", tags = {"Vehicles Controller"})
@Tag(name = "Vehicles Controller", description = "Operations on Vehicles, Model and Manufactuer")
@RestController
@RequestMapping("/api/vehicles")
@Validated
public class VehiclesController {
	
	@Autowired
	private VehiclesRepository vehicles;
	@Autowired
	private ManufacturerRepository manufacturer;
	@Autowired
	private ModelRepository model;
	
	
	@ApiOperation(value = "Get all manufacturers", notes = "Returns all vehicle manufacturers in the database")
	@GetMapping("/manufacturer")
	public Iterable<Manufacturer> getManufacturers(){
		return manufacturer.findAll();
	}
	
	@ApiOperation(value = "Get all models", notes = "Returns all vehicle models in the database")
	@GetMapping("/models")
	public Iterable<Model> getModels(){
		return model.findAll();
	}
	
	@ApiOperation(value = "Get all vehicles", notes = "Returns all vehicles in the database")
	@GetMapping("/findAll")
	public Iterable<Vehicles> getAllVehicles(){
		return vehicles.findAll();
	}
	
	@ApiOperation(value = "Get models by manufacturer name", notes = "Returns all models from a specific manufacturer")
	@GetMapping("/modelByManufacturer/{manufacturer_name}")
	public List<Model> getModelsByManufacturerName(@ApiParam(value="manufacturer's name", required = true) @PathVariable("manufacturer_name") String manufacturerName){
		Manufacturer manufacturerRecord = new Manufacturer();
		manufacturerRecord = manufacturer.findManufacturerByName(manufacturerName);
		Integer id = manufacturerRecord.getId();
		Manufacturer manufacturerId = new Manufacturer();
		manufacturerId.setId(id);
		return model.findModelsByManufacturerId(manufacturerId);
	}

	@ApiOperation(value = "Get vehicle by license plate", notes = "Returns a vehicle given its license plate")
	@GetMapping("/findById/{license_plate}")
	public Vehicles getVehicleByLicensePlate(@ApiParam(value="license plate", required = true) @PathVariable("license_plate") String licensePlate) {
		return vehicles.findById(licensePlate).get();
	}
	
	@ApiOperation(value = "Get vehicles by filter", notes = "Returns vehicles filtered on the basis of the values entered by the user")
	@GetMapping("/findByFilter")
	public List<Vehicles> getVehiclesByFilter(@RequestBody Vehicles searchVehicle){
			return vehicles.findAll(Example.of(new Vehicles(searchVehicle.getId(), searchVehicle.getFuel(), 
					searchVehicle.getModelId(), searchVehicle.getActive())));
	}
	
	@ApiOperation(value = "Update activity status", notes = "Updates the activity status of a vehicle given its id")
	@PutMapping("/updateActive/{id}")
	public Vehicles updateActiveVehicle(@RequestBody Vehicles vehiclesData, @ApiParam(value="license plate", required = true) @PathVariable("id") String id) {
		Vehicles vehicle = vehicles.findById(id).get();
		vehicle.setActive(vehiclesData.getActive());
		return vehicles.save(vehicle);
	}
	
	@ApiOperation(value = "New manufacturer", notes = "Inserts a new manufacturer into the database")
	@PostMapping("/newManufacturer")
	public Manufacturer insertNewManufacturer(@RequestBody Manufacturer newManufacturer) {
		return manufacturer.save(newManufacturer);
	}
	
	@ApiOperation(value = "New model", notes = "Inserts a new model into the database")
	@PostMapping("/newModel")
	public Model insertNewModel(@Valid @RequestBody Model newModel) {
		return model.save(newModel);
	}
	
	@ApiOperation(value = "New vehicle", notes = "Inserts a new vehicle into the database")
	@PostMapping("/newVehicle")
	public Vehicles insertNewVehicle(@Valid @RequestBody Vehicles newVehicle) {
		return vehicles.save(newVehicle);
	}
}
