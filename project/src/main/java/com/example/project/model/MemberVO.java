package com.example.project.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVO {
	
	/*** 테이블명 : member ***/
	private int num;
	private String memNum;
	private String memID;
	private String memPwd;
	private String memName;
	private String memGender;
	private String memJumin;
	private String memJuminBack;
	
	private String memBuseoCode;
	private String memBuseoName;
	private String memGradeCode;
	private String memGradeName;
	
	private String memEntdate;
	private Date memRegdate;
	private int memLevel;
	private String memConfirm;
	
	private int ref; //사원번호 중복을 피하기 위한 변수
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/*** getter,setter ***/
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemJumin() {
		return memJumin;
	}
	public void setMemJumin(String memJumin) {
		this.memJumin = memJumin;
	}
	public String getMemBuseoCode() {
		return memBuseoCode;
	}
	public void setMemBuseoCode(String memBuseoCode) {
		this.memBuseoCode = memBuseoCode;
	}
	public String getMemBuseoName() {
		return memBuseoName;
	}
	public void setMemBuseoName(String memBuseoName) {
		this.memBuseoName = memBuseoName;
	}
	public String getMemGradeCode() {
		return memGradeCode;
	}
	public void setMemGradeCode(String memGradeCode) {
		this.memGradeCode = memGradeCode;
	}
	public String getMemGradeName() {
		return memGradeName;
	}
	public void setMemGradeName(String memGradeName) {
		this.memGradeName = memGradeName;
	}
	public String getMemEntdate() {
		return memEntdate;
	}
	public void setMemEntdate(String memEntdate) {
		this.memEntdate = memEntdate;
	}
	public String getMemRegdate() {
		return sdf.format(memRegdate);
	}
	public void setMemRegdate(Date memRegdate) {
		this.memRegdate = memRegdate;
	}
	public int getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}
	public String getMemConfirm() {
		return memConfirm;
	}
	public void setMemConfirm(String memConfirm) {
		this.memConfirm = memConfirm;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getMemJuminBack() {
		return memJuminBack;
	}
	public void setMemJuminBack(String memJuminBack) {
		this.memJuminBack = memJuminBack;
	}
	
}
