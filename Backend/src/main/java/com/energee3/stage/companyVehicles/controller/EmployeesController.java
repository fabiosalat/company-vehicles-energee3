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
import com.energee3.stage.companyVehicles.model.Employees;
import com.energee3.stage.companyVehicles.repository.EmployeesRepository;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.tags.Tag;

@CrossOrigin
@RestController
@RequestMapping("/api/employees")
@Api(produces = "application/json", tags = {"Employees Controller"})
@Tag(name = "Employees Controller", description = "Operations on Employees")
@Validated
public class EmployeesController {

	@Autowired
	private EmployeesRepository employees;
	
	@ApiOperation(value = "Return all employees in database")
	@GetMapping("/findAll")
	public Iterable<Employees> getAllEmployees(){
		return employees.findAll();
	}

	@ApiOperation(value = "Find an employee by id")
	@GetMapping("/findById/{employee_id}")
	public Employees getEmployeesById(@PathVariable("employee_id") 
			@ApiParam(value = "Employee Id", required = true) Integer employeeId){
		return employees.findById(employeeId).get();
	}
	
	@ApiOperation(value = "Find an employee by email")
	@GetMapping("/findByEmail/{email}")
	public Employees getEmployeesByEmail(@PathVariable("email") 
			@ApiParam(value = "Email", required = true) String employeeEmail){
		return employees.findByEmail(employeeEmail).get();
	}
	
	@ApiOperation(value = "Find one or more employees by using one or more parameters")
	@GetMapping("/findByFilter")
	public List<Employees> getEmployeesByFilter(@RequestBody Employees searchEmployee){
		Employees e = new Employees();
		e.setId(searchEmployee.getId());
		e.setFirstName(searchEmployee.getFirstName());
		e.setLastName(searchEmployee.getLastName());
		return employees.findAll(Example.of(e));
	}

	@ApiOperation(value = "Insert a new employee")
	@PostMapping("/newEmployee")
	public Employees insertNewEmployee(@RequestBody Employees newEmployee) {
		return employees.save(newEmployee);
	}
	
	@ApiOperation(value = "Update an employee phone number")
	@PutMapping("/updatePhone/{id}")
	public Employees updateEmployeePhone(@RequestBody Employees newEmployeeData, 
			@PathVariable("id") @ApiParam(value = "Employee Id", required = true) Integer id) {
		Employees employee = employees.findById(id).get();
		employee.setPhoneNumber(newEmployeeData.getPhoneNumber());
		return employees.save(employee);
	}

	@ApiOperation(value = "Update an employee email")
	@PutMapping("/updateEmail/{id}")
	public Employees updateEmployeeEmail(@Valid @RequestBody Employees newEmployeeData, 
			@PathVariable("id") @ApiParam(value = "Employee Id", required = true) Integer id) {
		Employees employee = employees.findById(id).get();
		employee.setEmail(newEmployeeData.getEmail());
		return employees.save(employee);
	}
	
	@ApiOperation(value = "Update an employee status")
	@PutMapping("/updateActive/{id}")
	public Employees updateActiveEmployee(@RequestBody Employees newEmployeeData, 
			@PathVariable("id") @ApiParam(value = "Employee Id", required = true) Integer id) {
		Employees employee = employees.findById(id).get();
		employee.setActive(newEmployeeData.getActive());
		return employees.save(employee);
	}
	
}
