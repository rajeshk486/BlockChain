package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
/*
 * there are three services written
 * 1. localhost:8080/ - this is general health check to ensure application is running successfully
 * 2.localhost:8080/person/get?name=jayanth -- here jayanth is the variable by changin this u will get needed details of the person stored already
 * 3.localhost:8080/person/update?name=jayanth&empid=1-- this is used to store a employee detail jayanth and 1 are varialbes.
 * */
@RestController
public class EmpController {
	@Autowired
    private EmployeeDAO person;
	
	@RequestMapping("/")
	public String healthCheck() {
		return "OK";
	}
	
	@RequestMapping("/person/get")
	public EmployeeDAO getPerson(@RequestParam(name="name", required=false, defaultValue="Unknown") String name) {
		if(person.getName().equals(name))
			return person;
		else 
			return null;
	}
	
	@RequestMapping(value="/person/update", method=RequestMethod.POST)
	public EmployeeDAO updatePerson(@RequestParam(name="name", required=true) String name,@RequestParam(name="empid", required=true) int empid) {
		person.setName(name);
		person.setEmpid(empid);
		return person;
	}

}
