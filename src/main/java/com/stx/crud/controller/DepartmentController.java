package com.stx.crud.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stx.crud.bean.Department;
import com.stx.crud.bean.Msg;
import com.stx.crud.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDeptsWithJson() {
		
		List<Department> depts = departmentService.getAll();
		return Msg.success().add("depts", depts);
	}
	
}
