package com.stx.crud.test;


import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stx.crud.bean.Department;
import com.stx.crud.bean.Employee;
import com.stx.crud.dao.DepartmentMapper;
import com.stx.crud.dao.EmployeeMapper;



/*
 * 测试mapper
 * 推荐spring项目使用spring的单元测试，可以自动注入组件
 * 1.导入spring单元测试
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.直接autowired
 * */
//
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession sqlSession;
	/*
	 * 测试mapper
	 * 推荐spring项目使用spring的单元测试，可以自动注入组件
	 * */
	@Test
	public void testCRUD() {

//		System.out.println(departmentMapper);
		//1.查询几个部门
		
//		Department dept = departmentMapper.selectByPrimaryKey(1);
//		Employee emp = employeeMapper.selectByPrimaryKeyWithDept(1);
//		System.out.println(emp.getDepartment().getDeptName());
		
//		System.out.println(dept.getDeptName());
//		departmentMapper.insertSelective(new Department(null,"开发1部"));
//		departmentMapper.insertSelective(new Department(null,"研发2部"));
		System.out.println("插入成功");
		//2.批量插入
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<20;i++) {
			UUID uuid = UUID.randomUUID();
			String uuName = uuid.toString().substring(5);
			employeeMapper.insertSelective(new Employee(null, uuName, "男", uuid+"@qq.com", 1));
			List<Employee> emps = employeeMapper.selectByExampleWithDept(null);
			System.out.println(emps.get(0));
		}
	}
	
}