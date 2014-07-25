package com.mission.shop.order.common.returncode;

public enum OrderReturnCode {
	
	;
	
	private String code;
	private String message;
	
	OrderReturnCode(String code,String msg){
		this.code = code;
		this.message = msg;
	}
	
	public String getCode(){
		return code;
	}
	public String getMessage(){
		return message;
	}
}