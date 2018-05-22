package com.stx.crud.bean;

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class Msg {
	//100成功,200失败
	private int code;
	//提示信息
	private String msg;
	
	//用户返回给浏览器的信息
	private Map<String,Object> extend = new HashMap<String,Object>();  
	
	public int getCode() {
		return code;
	}
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("请求成功");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("请求失败");
		return result;
	}

	public String getMsg() {
		return msg;
		
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Msg add(String key, Object value) {
		this.getExtend().put(key,value);
		return this;
	}
}
	