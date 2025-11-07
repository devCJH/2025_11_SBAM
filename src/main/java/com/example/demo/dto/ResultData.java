package com.example.demo.dto;

import lombok.Data;

@Data
public class ResultData<DT> {
	private String rsCode;
	private String rsMsg;
	private DT rsData;
	
	public ResultData(String rsCode, String rsMsg) {
		this(rsCode, rsMsg, null);
	}
	
	public ResultData(String rsCode, String rsMsg, DT rsData) {
		this.rsCode = rsCode;
		this.rsMsg = rsMsg;
		this.rsData = rsData;
	}
	
	public boolean isSuccess() {
		return this.rsCode.startsWith("S-");
	}
	
	public boolean isFail() {
		return this.isSuccess() == false;
	}
	
}
