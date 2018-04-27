package com.warehouse.common;

/**
 * 后台返回数据用到的类
 * 2018.4.27
 */
public class WResponse {

	private String message;
	private Object object;
	
	public WResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	@Override
	public String toString() {
		return "WResponse [message=" + message + ", object=" + object + "]";
	}
	
}
