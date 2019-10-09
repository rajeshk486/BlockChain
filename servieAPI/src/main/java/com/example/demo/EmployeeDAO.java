package com.example.demo;

import org.springframework.stereotype.Component;

@Component
public class EmployeeDAO {
	private String name;
	private int empid;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

}
