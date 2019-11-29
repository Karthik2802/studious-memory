package com.HospitalEMR.Investigation.web.Model;

public class Histo_Bean 
{

	private int PatientID;
	
	private String h1_num,h1_date,h1_type,h1_type_text,h1_grade,UpdatedBy,UpdatedTime,H1_labname;

	public int getPatientID() {
		return PatientID;
	}

	public void setPatientID(int patientID) {
		PatientID = patientID;
	}

	public String getH1_num() {
		return h1_num;
	}

	public void setH1_num(String h1_num) {
		this.h1_num = h1_num;
	}

	public String getH1_date() {
		return h1_date;
	}

	public void setH1_date(String h1_date) {
		this.h1_date = h1_date;
	}

	public String getH1_type() {
		return h1_type;
	}

	public void setH1_type(String h1_type) {
		this.h1_type = h1_type;
	}

	public String getH1_type_text() {
		return h1_type_text;
	}

	public void setH1_type_text(String h1_type_text) {
		this.h1_type_text = h1_type_text;
	}

	public String getH1_grade() {
		return h1_grade;
	}

	public void setH1_grade(String h1_grade) {
		this.h1_grade = h1_grade;
	}

	public String getUpdatedBy() {
		return UpdatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		UpdatedBy = updatedBy;
	}

	public String getUpdatedTime() {
		return UpdatedTime;
	}

	public void setUpdatedTime(String updatedTime) {
		UpdatedTime = updatedTime;
	}

	public String getH1_labname() {
		return H1_labname;
	}

	public void setH1_labname(String h1_labname) {
		H1_labname = h1_labname;
	}
}
