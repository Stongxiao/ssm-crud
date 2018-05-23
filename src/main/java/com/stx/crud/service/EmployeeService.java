package com.stx.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stx.crud.bean.Employee;
import com.stx.crud.bean.EmployeeExample;
import com.stx.crud.bean.EmployeeExample.Criteria;
import com.stx.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	/**
	 * 查询员工数据
	 * 
	 */
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
		
	}
	
	/**
	 * 删除员工数据
	 * 
	 */
	public void delEmps(Integer empId) {
		employeeMapper.deleteByPrimaryKey(empId);
		// TODO Auto-generated method stub
		
	}

	public void addEmps(Employee employee) {
		employeeMapper.insertSelective(employee);
		
	}

	public boolean checkUser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);		
		return count==0;
		
	}
	
	public Employee getEmp(Integer id) {
		Employee emp = employeeMapper.selectByPrimaryKey(id);
		return emp;
	}


	
}
