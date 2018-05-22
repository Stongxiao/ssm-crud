package com.stx.crud.controller;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stx.crud.bean.Employee;
import com.stx.crud.bean.Msg;
import com.stx.crud.service.EmployeeService;

/**
 * 处理员工CRUD请求
 * @author Ikuta
 *
 */
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 6);
		List<Employee> emps = employeeService.getAll();
		PageInfo pageInfo = new PageInfo(emps);
		model.addAttribute("pageInfo", pageInfo);
		
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("/checkUser")
	@ResponseBody
	public Msg checkUser(@RequestParam(value="empName")String empName) {
		String reg = "(^[A-Za-z0-9]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
		if(!empName.matches(reg)) {
			return Msg.fail().add("va_msg","用户名必须是2-5个中文或者6-16位英文数字组合");
		}
		boolean b = employeeService.checkUser(empName);
		if(b) {
		return Msg.success();
		}else {
		return Msg.fail();
		}
	}
	
	
	@RequestMapping(value="/del_emps/{delId}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg del_EmpsWithJson(@PathVariable("delId")Integer delId) {
		employeeService.delEmps(delId);
//		PageInfo pageInfo = new PageInfo(emps);
//		model.addAttribute("pageInfo", pageInfo);
		return Msg.success();
//		return Msg.success().add("pageInfo", pageInfo);
	}
	
	
	@RequestMapping(value="/emps",method=RequestMethod.POST)
	@ResponseBody
	public Msg addEmps(Employee employee) {
		employeeService.addEmps(employee);
//		PageInfo pageInfo = new PageInfo(emps);

		
		return Msg.success();
	}
	/*
	 * 查询员工数据
	 */
//	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
//		
//		PageHelper.startPage(pn, 6);
//		List<Employee> emps = employeeService.getAll();
//		PageInfo pageInfo = new PageInfo(emps);
//		model.addAttribute("pageInfo", pageInfo);
//		
//		return "list";
//	}
}
