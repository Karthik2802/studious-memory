package com.HospitalEMR.patinentInfo.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.HospitalEMR.CaseHistory.web.Model.hiddenFieldBean;
import com.HospitalEMR.patinentInfo.web.Dao.patinetInfoDB;
import com.HospitalEMR.patinentInfo.web.Model.patientInfoBean;



/**
 * Servlet implementation class PatientInfo
 */
@WebServlet("/PatientInfo")
public class PatientInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int status=0;
		response.setContentType("text/html");
		
		
		PrintWriter pw = response.getWriter();
		
		ArrayList al=new ArrayList();
		/*hidden fields*/
		String patientID=request.getParameter("p_id");
		int p_id = Integer.parseInt(patientID);
		
		
		
		String secondprimary = request.getParameter("secondprimary");// changed to  protocol
		
		String patient_agreement = request.getParameter("patient_agreement");
		if(patient_agreement==null)
		{
			patient_agreement="";
		}
		String dateofadmission = request.getParameter("dateofadmission");
		String pname = request.getParameter("uname");
		String cd_no = request.getParameter("cd_no");//changed to patient ID
		
		
		String sex = request.getParameter("sex_button");		
		//String age=request.getParameter("age_button");	
		String age=request.getParameter("age");			
		String phone_num = request.getParameter("pnumber");
		String occupation = request.getParameter("ocu");
		String address = request.getParameter("add");		
		String diagnosis = request.getParameter("diagnosis");
		String organ_of_interest = request.getParameter("organ");		
		String sub_type= request.getParameter("organ_subtypes");
		String others = request.getParameter("others");
		
		String accessrole = request.getParameter("accessrole");
		String updatedby = request.getParameter("updatedby");
		String updatedtime = request.getParameter("updatedtime");
		
		String updateflag = request.getParameter("updateflag");
		
		
		
		String index_no = request.getParameter("index_no");
		String religion = request.getParameter("religion");
		String diagnosis_sub_types = request.getParameter("diagnosis_sub_types");
		
		String hospitalname=request.getParameter("hospitalname");
		
		
		patientInfoBean p = new patientInfoBean();
        p.setPatientID(p_id);		
		
		p.setSecondprimary(secondprimary);// changed to protocol
		
		p.setPatient_agreement(patient_agreement);
	    p.setDateofadmission(dateofadmission);
	    p.setPname(pname);
	    p.setCd_no(cd_no);// changed to patient ID
	    p.setSex(sex);
	    p.setAge(age);
	    p.setPhone_num(phone_num);
	    p.setOccupation(occupation);
	    p.setAddress(address);
	    p.setDiagnosis(diagnosis);
	    p.setOrgan_of_interest(organ_of_interest);
	    p.setSub_type(sub_type);
	    p.setOthers(others);
	    
	   
	    p.setUpdatedby(updatedby);
	    p.setUpdatedtime(updatedtime);
	    p.setUpdateflag(updateflag);
	    
	   p.setIndex_no(index_no);
	   p.setDiagnosis_sub_types(diagnosis_sub_types);
	   p.setReligion(religion);
	    
	   p.setHospitalname(hospitalname);                  //hospitalname
		
		hiddenFieldBean hf = new hiddenFieldBean();
		
		/*hf.setP_id(p_id);*/
		hf.setPname(pname);
		hf.setCd_no(cd_no);
		hf.setDiagnosis(diagnosis);
		
		hf.setSex(sex);
		hf.setOrgan_of_interest(organ_of_interest);
		
		
	    
	    patinetInfoDB pi = new patinetInfoDB();
	    
	   try
	    {
		   if(p.getUpdateflag().equals("YES"))
		   {
			   status=pi.updatePatientInfo(p);
			   
		   }
		   else
		   {
			   status=pi.patientInfo(p);
			   
		   }
	    	
	    	if(status > 0)
	    	{
	    		
	    		String tab="active";
	    		response.sendRedirect("Demography.jsp?p_id="+p.getPatientID()+"&accessrole="+accessrole+"&tabActive="+tab+"");        
	    	}
	    	else
	    	{
	    		pw.println("Not Saved");
	    	}
	    	
	    }
	    catch (Exception e)
	    {
			e.printStackTrace();
		}	
		
	}

}
