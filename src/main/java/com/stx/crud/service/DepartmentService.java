package com.stx.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stx.crud.bean.Department;
import com.stx.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<Department> getAll(){
		
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}
}
