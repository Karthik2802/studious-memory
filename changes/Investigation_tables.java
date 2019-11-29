package com.HospitalEMR.Investigation.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.HospitalEMR.Investigation.web.Dao.InvestigationDB;
import com.HospitalEMR.Investigation.web.Model.Cytology_Bean;
import com.HospitalEMR.Investigation.web.Model.Histo_Bean;
import com.HospitalEMR.Investigation.web.Model.Lipid_Bean;
import com.HospitalEMR.Investigation.web.Model.RenalBean;
import com.HospitalEMR.Investigation.web.Model.Thyroid_Bean;
import com.HospitalEMR.Investigation.web.Model.inv_inveatigation_table;
import com.sun.org.apache.xerces.internal.util.Status;

/**
 * Servlet implementation class Investigation_tables
 */
@WebServlet("/Investigation_tables")
public class Investigation_tables extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int status=0;
		ArrayList status1 = new ArrayList();
		ArrayList al = new ArrayList();
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String PatientID = request.getParameter("patinetID");
		int pid = Integer.parseInt(PatientID);
		
		String TableIdentifier = request.getParameter("TableIdentifier");
		
		System.out.println(TableIdentifier);
		
		if (TableIdentifier.equals("investtable"))
		{
			String investicationdate=request.getParameter("investicationdate"); 
			String hb=request.getParameter("hb");
			String tc=request.getParameter("tc");
			String dc=request.getParameter("dc");
			String platelets=request.getParameter("platelets");
			String Rbs=request.getParameter("Rbs");
			String Fbs=request.getParameter("Fbs");
			String Ppbs=request.getParameter("Ppbs");
			String Urea=request.getParameter("Urea");
			if(Urea==null)
			{
				Urea="";
			}
			String Creatinine=request.getParameter("Creatinine");
			if(Creatinine==null)
			{
				Creatinine="";
			}
			String Sodium=request.getParameter("Sodium");
			if(Sodium==null)
			{
				Sodium="";
			}
			String potassium=request.getParameter("potassium");
			if(potassium==null)
			{
				potassium="";
			}
			String Chloride=request.getParameter("Chloride");
			if(Chloride==null)
			{
				Chloride="";
			}
			String Bicarbonates=request.getParameter("Bicarbonates");
			if(Bicarbonates==null)
			{
				Bicarbonates="";
			}
			
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			inv_inveatigation_table it = new inv_inveatigation_table();
			
			it.setPatientID(pid);
			it.setInvesticationdate(investicationdate);
			it.setHb(hb);
			it.setTc(tc);
			it.setDc(dc);
			it.setPlatelets(platelets);
			it.setRbs(Rbs);
			it.setFbs(Fbs);
			it.setPpbs(Ppbs);
			it.setUrea(Urea);
			it.setCreatinine(Creatinine);
			it.setSodium(Sodium);
			it.setPotassium(potassium);
			it.setChloride(Chloride);
			it.setBicarbonates(Bicarbonates);
			
			it.setUpdatedBy(UpdatedBy);
			it.setUpdatedTime(UpdatedTime);
			
			InvestigationDB inDB = new InvestigationDB();
			
			try
			{
				status1=inDB.SaveInvestigationTestTable(it);
				
				
				
				 JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
				
				
				
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
		}else if (TableIdentifier.equals("liversave"))
		{
			
			
			String liverDate=request.getParameter("liverDate");
			String bilirubintotal=request.getParameter("bilirubintotal");
			String Direct=request.getParameter("Direct");
			String Indirect=request.getParameter("Indirect");
			String proteintotal=request.getParameter("proteintotal");
			String Albumin=request.getParameter("Albumin");
			String Globumin=request.getParameter("Globumin");
			String Ratios=request.getParameter("Ratio");
			String SGOT=request.getParameter("SGOT");
			String SGPT=request.getParameter("SGPT");
			String ALP=request.getParameter("ALP");
			String GGT=request.getParameter("GGT");
			
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			
			inv_inveatigation_table it = new inv_inveatigation_table();
			
			it.setPatientID(pid);
			it.setLiverDate(liverDate);
			it.setBilirubintotal(bilirubintotal);
			it.setDirect(Direct);
			it.setIndirect(Indirect);
			it.setProteintotal(proteintotal);
			it.setAlbumin(Albumin);
			it.setGlobumin(Globumin);
			it.setRatios(Ratios);
			it.setSGOT(SGOT);
			it.setSGPT(SGPT);
			it.setALP(ALP);
			it.setGGT(GGT);
			
			it.setUpdatedBy(UpdatedBy);
			it.setUpdatedTime(UpdatedTime);
			
			
			InvestigationDB iDB = new InvestigationDB();
			
			try
			{
				status1=iDB.saveLiverFunctionTestTable(it);
				
				JSONArray json = new JSONArray(status1);
				response.setContentType("application/json");
	 		    response.getWriter().print(json);
				
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
		}
		else if (TableIdentifier.equals("OtherTestTable"))
		{
			
			String other1 = request.getParameter("other1");
			String other2 = request.getParameter("other2");
			String other3 = request.getParameter("other3");
			String other4 = request.getParameter("other4");
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			inv_inveatigation_table io = new inv_inveatigation_table();
			io.setPatientID(pid);
			io.setOther1(other1);
			io.setOther2(other2);
			io.setOther3(other3);
			io.setOther4(other4);
			
			io.setUpdatedBy(UpdatedBy);
			io.setUpdatedTime(UpdatedTime);
			
			InvestigationDB iDB = new InvestigationDB();
			try
			{
				status1=iDB.SaveOtherTest(io);
				
				JSONArray json = new JSONArray(status1);
				response.setContentType("application/json");
	 		    response.getWriter().print(json);
				
			}
			catch (Exception e) {
				
				e.printStackTrace();
			}
			
			
			
			
			
			
		}
		else if(TableIdentifier.equals("tumorMarkerTable"))
		{
			
			String Serila_number = request.getParameter("Serila_number");
			String tumor_marker = request.getParameter("tumor_marker");
			String value = request.getParameter("value");
			//String file = request.getParameter("file");
			
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			inv_inveatigation_table io = new inv_inveatigation_table();
			
			io.setPatientID(pid);
			io.setSerila_number(Serila_number);
			io.setTumor_marker(tumor_marker);
			io.setValue(value);
			
			io.setUpdatedBy(UpdatedBy);
			io.setUpdatedTime(UpdatedTime);
			
			InvestigationDB iDB = new InvestigationDB();
			try
			{
				status1= iDB.saveTumorMarker(io);
			
				
							
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			//al.add(status1);			
			JSONArray json = new JSONArray(status1);
			response.setContentType("application/json");
 		    response.getWriter().print(json);
			
			
			
		}
		else if(TableIdentifier.equals("Immuno"))
		{
			String immunoSeril_number = request.getParameter("Serila_number");
			String Immuno = request.getParameter("Immuno");
			String Result = request.getParameter("Result");
			
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			inv_inveatigation_table io = new inv_inveatigation_table();
			
			io.setPatientID(pid);
			io.setImmunoSeril_number(immunoSeril_number);
			io.setImmuno(Immuno);
			io.setResult(Result);
			
			io.setUpdatedBy(UpdatedBy);
			io.setUpdatedTime(UpdatedTime);
			
			
			InvestigationDB iDB = new InvestigationDB();
			
			try
			{
				status1= iDB.ImmunoHistoChecmistry(io);
				
				
				JSONArray json = new JSONArray(status1);
				response.setContentType("application/json");
	 		    response.getWriter().print(json);
				
				
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			
			
			
		}
		else if(TableIdentifier.equals("EndoScopy"))
		{
			
			String Endo_date = request.getParameter("Endo_date");
			String endo_select = request.getParameter("endo_select");
			String endo_text = request.getParameter("endo_text");
			
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			inv_inveatigation_table io = new inv_inveatigation_table();
			
			io.setPatientID(pid);
			io.setEndo_date(Endo_date);
			io.setEndo_select(endo_select);
			io.setEndo_text(endo_text);
			
			io.setUpdatedBy(UpdatedBy);
			io.setUpdatedTime(UpdatedTime);
			
			
			InvestigationDB iDB = new InvestigationDB();
			
			try
			{
				
				 status1 = iDB.Endoscopy(io);
			
				 
				 
				 
				    JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
				/*status1= iDB.ImmunoHistoChecmistry(io);*/
				
				/*need to write save function and select method for endoscopy*/
				

			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			
			
			
		}
		else if(TableIdentifier.equals("renaltable"))
		{
			
			System.out.println(TableIdentifier);
			String renalDate=request.getParameter("renalDate");
			String Urea=request.getParameter("Urea");			
			String Creatinine=request.getParameter("Creatinine");			
			String Sodium=request.getParameter("Sodium");			
			String potassium=request.getParameter("potassium");			
			String Chloride=request.getParameter("Chloride");
			
			String calcium = request.getParameter("calcium");
			String megnisium = request.getParameter("megnisium");			
			String Bicarbonates=request.getParameter("Bicarbonates");			
			
			String UpdatedBy = request.getParameter("UpdatedBy");
			String UpdatedTime = request.getParameter("UpdatedTime");
			
			RenalBean rb = new RenalBean();
			
			rb.setPatientID(pid);
			rb.setRenalDate(renalDate);
			rb.setUrea(Urea);
			rb.setCreatinine(Creatinine);
			rb.setSodium(Sodium);
			rb.setPotassium(potassium);
			rb.setChloride(Chloride);
			rb.setCalcium(calcium);
			rb.setMegnisium(megnisium);
			rb.setBicarbonates(Bicarbonates);
			rb.setUpdatedBy(UpdatedBy);
			rb.setUpdatedTime(UpdatedTime);
			
			InvestigationDB iDB = new InvestigationDB();
			
			
			try
			{
				status1 =iDB.SaveRenalTestTable(rb);
				
				JSONArray json = new JSONArray(status1);
				response.setContentType("application/json");
	 		    response.getWriter().print(json);
				
				
				
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			
		}
		else if (TableIdentifier.equals("cardiac"))
		{
			
			
			String cardiac_select = request.getParameter("cardiac_select");
			String cardiac_date = request.getParameter("cardiac_date");
			String cardiac_desc = request.getParameter("cardiac_desc");
			
			String cardic_UpdatedTime = request.getParameter("UpdatedTime");
			String cardic_UpdatedBy = request.getParameter("UpdatedBy");
			
			inv_inveatigation_table io = new inv_inveatigation_table();
			
			io.setPatientID(pid);
			io.setCardiac_select(cardiac_select);
			io.setCardiac_date(cardiac_date);
			io.setCardiac_desc(cardiac_desc);
			
			io.setCardic_UpdatedBy(cardic_UpdatedBy);
			io.setCardic_UpdatedTime(cardic_UpdatedTime);
			
			
			InvestigationDB iDB = new InvestigationDB();
			
			
			try
			{
				
				status1 =iDB.SaveCardiac(io);
				
				JSONArray json = new JSONArray(status1);
				response.setContentType("application/json");
	 		    response.getWriter().print(json);
				
				
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			
			
			
			
			
		}
		
		else if (TableIdentifier.equals("img_table"))
		{
			
			
			String image_select = request.getParameter("image_select");
			String image_date = request.getParameter("image_date");
			String image_desc = request.getParameter("image_desc");
			
			String img_UpdatedTime = request.getParameter("UpdatedTime");
			String img_UpdatedBy = request.getParameter("UpdatedBy");
			
			inv_inveatigation_table io = new inv_inveatigation_table();	
					
			
			io.setPatientID(pid);
			io.setImage_select(image_select);
			io.setImage_date(image_date);
			io.setImage_desc(image_desc);
			
			io.setImg_UpdatedBy(img_UpdatedBy);
			io.setImg_UpdatedTime(img_UpdatedTime);
			
			InvestigationDB iDB = new InvestigationDB();
			
			try
			{
				
				status1 =iDB.Saveimage(io);
				
				JSONArray json = new JSONArray(status1);
				response.setContentType("application/json");
	 		    response.getWriter().print(json);
				
				
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
			
			else if (TableIdentifier.equals("Nuclear_table"))
			{
				
				
				String nuclear_select = request.getParameter("nuclear_select");
				String nuclear_date = request.getParameter("nuclear_date");
				String nuclear_desc = request.getParameter("nuclear_desc");
				
				String nuc_UpdatedTime = request.getParameter("UpdatedTime");
				String nuc_UpdatedBy = request.getParameter("UpdatedBy");
				
				inv_inveatigation_table io = new inv_inveatigation_table();	
						
				
				io.setPatientID(pid);
				io.setNuclear_select(nuclear_select);
				io.setNuclear_date(nuclear_date);
				io.setNuclear_desc(nuclear_desc);
				io.setNuc_UpdatedBy(nuc_UpdatedBy);
				io.setNuc_UpdatedTime(nuc_UpdatedTime);
				
				
				InvestigationDB iDB = new InvestigationDB();
				
				try
				{
					
					status1 =iDB.Savenuclear(io);
					
					JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
					
					
				}
				catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
			}
		
		
			else if(TableIdentifier.equals("lipidtable"))
			{
				
				System.out.println(TableIdentifier);
				String lipidDate=request.getParameter("lipidDate");
				String tc=request.getParameter("tc");			
				String tryg=request.getParameter("tryg");			
				String hdl=request.getParameter("hdl");			
				String ldl=request.getParameter("ldl");			
				String vldl=request.getParameter("vldl");
				
				
				String UpdatedBy = request.getParameter("UpdatedBy");
				String UpdatedTime = request.getParameter("UpdatedTime");
				
				Lipid_Bean lb = new Lipid_Bean();
				
				lb.setPatientID(pid);
				lb.setLipidDate(lipidDate);
				lb.setTc(tc);
				lb.setTryg(tryg);
				lb.setHdl(hdl);
				lb.setLdl(ldl);
				lb.setVldl(vldl);
				
				lb.setUpdatedBy(UpdatedBy);
				lb.setUpdatedTime(UpdatedTime);
				
				InvestigationDB iDB = new InvestigationDB();
				
				
				try
				{
					status1 =iDB.SaveLipidTable(lb);
					
					JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
					
					
					
				}catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
				
				
			}
		
		
		
			else if(TableIdentifier.equals("thyroidtable"))
			{
				
				System.out.println(TableIdentifier);
				String thyroidDate=request.getParameter("thyroidDate");
				String ts=request.getParameter("ts");			
				String t4=request.getParameter("t4");			
				String tsh=request.getParameter("tsh");			
				
				String UpdatedBy = request.getParameter("UpdatedBy");
				String UpdatedTime = request.getParameter("UpdatedTime");
				
				Thyroid_Bean tb = new Thyroid_Bean();
				
				tb.setPatientID(pid);
				tb.setThyroidDate(thyroidDate);
				tb.setTs(ts);
				tb.setT4(t4);
				tb.setTsh(tsh);
				
				tb.setUpdatedBy(UpdatedBy);
				tb.setUpdatedTime(UpdatedTime);
				
				InvestigationDB iDB = new InvestigationDB();
				
				
				try
				{
					status1 =iDB.SaveThyroidTable(tb);
					
					JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
					
					
					
				}catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
				
				
			}
		
		
			else if(TableIdentifier.equals("cytologytable"))
			{
				
				System.out.println(TableIdentifier);
				String c1_num=request.getParameter("c1_num");
				String c1_date=request.getParameter("c1_date");			
				String c1_type=request.getParameter("c1_type");			
				String c1_type_text=request.getParameter("c1_type_text");			
				String c1_grade=request.getParameter("c1_grade");
				
				String UpdatedBy = request.getParameter("UpdatedBy");
				String UpdatedTime = request.getParameter("UpdatedTime");
				
				Cytology_Bean cb = new Cytology_Bean();
				
				cb.setPatientID(pid);
				cb.setC1_num(c1_num);
				cb.setC1_date(c1_date);
				cb.setC1_type(c1_type);
				cb.setC1_type_text(c1_type_text);
				cb.setC1_grade(c1_grade);
				
				cb.setUpdatedBy(UpdatedBy);
				cb.setUpdatedTime(UpdatedTime);
				
				InvestigationDB iDB = new InvestigationDB();
				
				
				try
				{
					status1 =iDB.saveCytology(cb);
					
					JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
					
					
					
				}catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
				
				
			}
		
		
		
			else if(TableIdentifier.equals("histopathologytable"))
			{
				
				System.out.println(TableIdentifier);
				String H1_num=request.getParameter("H1_num");
				String H1_date=request.getParameter("H1_date");			
				String H1_type=request.getParameter("H1_type");	
				String H1_labname =request.getParameter("H1_labname");                //labname
				String H1_type_text=request.getParameter("H1_type_text");			
				String H1_grade=request.getParameter("H1_grade");
				
				String UpdatedBy = request.getParameter("UpdatedBy");
				String UpdatedTime = request.getParameter("UpdatedTime");
				
				
				Histo_Bean hb = new Histo_Bean();             
				
				hb.setPatientID(pid);
				hb.setH1_num(H1_num);
				hb.setH1_date(H1_date);
				hb.setH1_type(H1_type);
				hb.setH1_labname(H1_labname);            //labname
				hb.setH1_type_text(H1_type_text);
				hb.setH1_grade(H1_grade);
				
				hb.setUpdatedBy(UpdatedBy);
				hb.setUpdatedTime(UpdatedTime);
				
				InvestigationDB iDB = new InvestigationDB();
				
				
				try
				{
					status1 =iDB.saveHistopathology(hb);
					
					JSONArray json = new JSONArray(status1);
					response.setContentType("application/json");
		 		    response.getWriter().print(json);
					
					
					
				}catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
				
				
			}
			
				
	}
		
}
