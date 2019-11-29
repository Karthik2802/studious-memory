package com.HospitalEMR.Investigation.web.Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HospitalEMR.Investigation.web.Model.Cytology_Bean;
import com.HospitalEMR.Investigation.web.Model.Histo_Bean;
import com.HospitalEMR.Investigation.web.Model.InvestigationMainBean;
import com.HospitalEMR.Investigation.web.Model.Lipid_Bean;
import com.HospitalEMR.Investigation.web.Model.RenalBean;
import com.HospitalEMR.Investigation.web.Model.Serology_sectionBean;
import com.HospitalEMR.Investigation.web.Model.Thyroid_Bean;
import com.HospitalEMR.Investigation.web.Model.inv_inveatigation_table;
import com.sun.org.apache.xpath.internal.functions.Function;

import Connection.InitCon;
import jdk.nashorn.internal.codegen.CompilerConstants.Call;

public class InvestigationDB
{
	/*function to insert the table value*/
	
	public static int SaveInvestigation(InvestigationMainBean in) throws SQLException
	{
		int status =0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		String DbFlage;
		try
		{
			DbFlage="insert_investigation";
			st=con.prepareCall("{call patient_investigation(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, in.getPatientID());		
			st.setString(2, "investigation ID" );
			st.setString(3, in.getBlood_Group() );
			st.setString(4, in.getBlood_Type());
			st.setString(5, in.getHiv());
			st.setString(6, in.getHbsAg());
			st.setString(7, in.getHcv());
			st.setString(8, null);
			st.setString(9, null);
			st.setString(10, null);
			st.setString(11, null);
			st.setString(12, null);
			st.setString(13, null);
			st.setString(14, null);
			st.setString(15, null);
			st.setString(16, in.getPatientInves_updatedby());//lastupdated by
			st.setString(17, in.getPatientInves_updatedtime());//lastupdated time
			st.setString(18, DbFlage);
			
			rs=st.executeQuery();
			status=1;
			con.close();
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return status;
		
	}
	
   public static int saveSerology(Serology_sectionBean sb) throws SQLException
   {
	   int status = 0;
	   InitCon it = new InitCon();
	   Connection con = it.InitConnection();
	   CallableStatement st;
	   ResultSet rs;
	   String DbFlage;
	   try
	   {
		   DbFlage="insert_serology";
		   st=con.prepareCall("{call patient_investigation(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		   st.setInt(1, sb.getPatientID());	
		   st.setString(2, null );
		   st.setString(3,null);
	       st.setString(4, null);
		   st.setString(5, sb.getHiv());
		   st.setString(6, sb.getHcv());
	       st.setString(7, sb.getHcv());
		   st.setString(8, null);
		   st.setString(9, null);
		   st.setString(10, null);
		   st.setString(11, null);
		   st.setString(12, null);
		   st.setString(13, null);
		   st.setString(14, null);
		   st.setString(15, null);
		   st.setString(16, sb.getSerology_updatedby());//lastupdated by
		   st.setString(17, sb.getSerology_updatedtime());//lastupdated time
		   st.setString(18, DbFlage);	  
		   rs=st.executeQuery();   
		   status=1;
		   con.close();
		   
		   
	   }
	   catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}
	   
	   
	   return status;  
	   
   }
   
  
   
   
   // Function for Save the Cytology Table
   
   public static ArrayList saveCytology(Cytology_Bean cb) throws SQLException
   {
	   
	   InitCon it = new InitCon();
	   Connection con = it.InitConnection();
	   CallableStatement st;
	   ResultSet rs;
	   ArrayList al = new ArrayList<>();
	   String DbFlage;
	   try
	   {
		   DbFlage="insert_cytology_c1";
		   st=con.prepareCall("{ call investigation_cytology(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		   st.setInt(1, cb.getPatientID());
		   st.setString(2, null);
		   st.setString(3, cb.getC1_num());
		   st.setString(4, cb.getC1_date());
		   st.setString(5, cb.getC1_type());
		   st.setString(6, cb.getC1_type_text());
		   st.setString(7, cb.getC1_grade());
		   st.setString(8, null);
		   st.setString(9, null);
		   st.setString(10, null);
		   st.setString(11, null);
		   st.setString(12, null);
		   st.setString(13, cb.getUpdatedBy());
		   st.setString(14, cb.getUpdatedTime());
		   st.setString(15, DbFlage);
		   rs=st.executeQuery();   
		   //status=1;
		   
		   al = getCytologyTable(cb.getPatientID());
		   con.close();
		   
		   
		   
	   }
	   catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}
	   
	   
	   return al;
	   
   }
   
   
   public static ArrayList saveHistopathology(Histo_Bean hb) throws SQLException
   {
	   
	   InitCon it = new InitCon();
	   Connection con = it.InitConnection();
	   CallableStatement st;
	   ResultSet rs;
	   ArrayList al = new ArrayList<>();
	   String DbFlage;
	   try
	   {
		   DbFlage="insert_Histo_h1";
		   st=con.prepareCall("{ call Investigation_Histo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		   st.setInt(1, hb.getPatientID());
		   st.setString(2, null);
		   st.setString(3, hb.getH1_num());
		   st.setString(4, hb.getH1_date());
		   st.setString(5, hb.getH1_type());
		   st.setString(6, hb.getH1_type_text());
		   st.setString(7, hb.getH1_grade());
		   st.setString(8, null);
		   st.setString(9, null);
		   st.setString(10, null);
		   st.setString(11, null);
		   st.setString(12, null);
		   st.setString(13, hb.getUpdatedBy());
		   st.setString(14, hb.getUpdatedTime());
		   st.setString(15, hb.getH1_labname());       //labname
		   st.setString(16, DbFlage);
		   rs=st.executeQuery();   
		   //status=1;
		   
		   al = getHistopathologyTable(hb.getPatientID());
		   con.close();
		   
		   
		   
	   }
	   catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}
	   
	   
	   return al;
	   
   }
   
   
   public static int updatecytology_c1(Serology_sectionBean sb) throws SQLException
   {
	   int status=0;
	   InitCon it = new InitCon();
	   Connection con = it.InitConnection();
	   CallableStatement st;
	   ResultSet rs;
	   String DbFlage;
	   try
	   {
		   DbFlage="Update_cytology_c1";
		   st=con.prepareCall("{ call investigation_cytology(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		   st.setInt(1, sb.getPatientID());
		   st.setString(2, null);
		   st.setString(3, sb.getC1_num());
		   st.setString(4, sb.getC1_date());
		   st.setString(5, sb.getC1_type());
		   st.setString(6, sb.getC1_type_text());
		   st.setString(7, sb.getC1_grade());
		   st.setString(8, sb.getC2_num());
		   st.setString(9, sb.getC2_date());
		   st.setString(10, sb.getC2_type());
		   st.setString(11, sb.getC2_type_text());
		   st.setString(12, sb.getC2_grade());
		   st.setString(13, sb.getSerology_updatedby());
		   st.setString(14, sb.getSerology_updatedtime());
		   st.setString(15, DbFlage);
		   rs=st.executeQuery();   
		   status=1;
		   con.close();
		   
	   }
	   catch (Exception e)
	   {
		e.printStackTrace();// TODO: handle exception
	   }
	   
	   return status;
	   
   }
   
   public static int saveHisto(Serology_sectionBean sb) throws SQLException
   {
	   int status=0;
	   InitCon it = new InitCon();
	   Connection con = it.InitConnection();
	   CallableStatement st;
	   ResultSet rs;
	   String DbFlage;
	   try
	   {
		   DbFlage="insert_Histo_h1";
		   st = con.prepareCall("{call Investigation_Histo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
		   st.setInt(1, sb.getPatientID());
		   st.setString(2, null);
		   st.setString(3, sb.getH1_num());
		   st.setString(4, sb.getH1_date());
		   st.setString(5, sb.getH1_type());
		   st.setString(6, sb.getH1_type_text());
		   st.setString(7, sb.getH1_grade());		   
		   st.setString(8, sb.getH2_num());
		   st.setString(9, sb.getH2_date());
		   st.setString(10, sb.getH2_type());
		   st.setString(11, sb.getH2_type_text());
		   st.setString(12, sb.getH2_grade());
		   st.setString(13, sb.getSerology_updatedby());
		   st.setString(14, sb.getSerology_updatedtime());		   
		   st.setString(15, DbFlage);
		   
		   rs=st.executeQuery();
		   status=1;
		   con.close();
	   }
	   catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}
	return status;
	   
   }
   
   public static int UpdateHisto(Serology_sectionBean sb) throws SQLException
   {
	   int status=0;
	   InitCon it = new InitCon();
	   Connection con = it.InitConnection();
	   CallableStatement st;
	   ResultSet rs;
	   String DbFlage;
	   try
	   {
		   DbFlage="Update_Histo_h1";
		   st = con.prepareCall("{call Investigation_Histo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
		   st.setInt(1, sb.getPatientID());
		   st.setString(2, null);
		   st.setString(3, sb.getH1_num());
		   st.setString(4, sb.getH1_date());
		   st.setString(5, sb.getH1_type());
		   st.setString(6, sb.getH1_type_text());
		   st.setString(7, sb.getH1_grade());		   
		   st.setString(8, sb.getH2_num());
		   st.setString(9, sb.getH2_date());
		   st.setString(10, sb.getH2_type());
		   st.setString(11, sb.getH2_type_text());
		   st.setString(12, sb.getH2_grade());
		   st.setString(13, sb.getSerology_updatedby());
		   st.setString(14, sb.getSerology_updatedtime());		   
		   st.setString(15, DbFlage);
		   
		   rs=st.executeQuery();
		   status=1;
		   con.close();
	   }
	   catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}
	return status;
	   
   }
	
	
	
	
	
	
	
	
	
	
	
                           /*inverstigation test*/
	public static ArrayList SaveInvestigationTestTable(inv_inveatigation_table inve) throws SQLException
	{
		
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_list = new ArrayList();
		try
		{
			st=con.prepareCall("{call Investigation_test(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, inve.getPatientID());
			st.setString(2, "");
			st.setString(3, inve.getInvesticationdate());
			st.setString(4, inve.getHb());
			st.setString(5, inve.getTc());
			st.setString(6, inve.getDc());
			st.setString(7, inve.getPlatelets());
			st.setString(8, inve.getRbs());
			st.setString(9, inve.getFbs());
			st.setString(10, inve.getPpbs());
			st.setString(11, inve.getUrea());
			st.setString(12, inve.getCreatinine());
			st.setString(13, inve.getSodium());
			st.setString(14, inve.getPotassium());
			st.setString(15, inve.getChloride());
			st.setString(16, inve.getBicarbonates());
			st.setString(17, inve.getUpdatedBy());
			st.setString(18, inve.getUpdatedTime());
			rs = st.executeQuery();			
			
			
			Inv_list =getInvTes(inve.getPatientID());
			
			System.out.println(Inv_list);
			
			
			
			
			
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return Inv_list;
		
		
	}
	
	                      /*renal test*/
	
	
	public static ArrayList SaveRenalTestTable(RenalBean rb) throws SQLException
	{
		
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_list = new ArrayList();
		try
		{
			st=con.prepareCall("{call renal_table(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, rb.getPatientID());
			st.setString(2, "");//renal ID
			
			st.setString(3, rb.getRenalDate());
			st.setString(4, rb.getUrea());
			st.setString(5, rb.getCreatinine());
			st.setString(6, rb.getSodium());
			st.setString(7, rb.getPotassium());
			st.setString(8, rb.getChloride());
			st.setString(9, rb.getCalcium());
			st.setString(10, rb.getMegnisium());
			st.setString(11, rb.getBicarbonates());
			st.setString(12, rb.getUpdatedBy());
			st.setString(13, rb.getUpdatedTime());
			rs = st.executeQuery();
			//System.out.println("inserted");
			
			
			Inv_list =getrenal(rb.getPatientID());
			
			//System.out.println(Inv_list);
			
			
			
			
			
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return Inv_list;
		
		
	}
	
	// Function for Save Lipid table
	
	public static ArrayList SaveLipidTable(Lipid_Bean lb) throws SQLException
	{
		
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Lip_list = new ArrayList();
		try
		{
			st=con.prepareCall("{call Save_Lipid_Table(?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, lb.getPatientID());
			//st.setString(2, "");//renal ID
			
			st.setString(2, lb.getLipidDate());
			st.setString(3, lb.getTc());
			st.setString(4, lb.getTryg());
			st.setString(5, lb.getHdl());
			st.setString(6, lb.getLdl());
			st.setString(7, lb.getVldl());
			
			st.setString(8, lb.getUpdatedBy());
			st.setString(9, lb.getUpdatedTime());
			rs = st.executeQuery();
			//System.out.println("inserted");
			
			
			Lip_list =getLipidTable(lb.getPatientID());
			
			//System.out.println(Inv_list);
			
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return Lip_list;
		
		
	}
	
	
   // Function for Save Thyroid table

	public static ArrayList SaveThyroidTable(Thyroid_Bean tb) throws SQLException
	{
		
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Thy_list = new ArrayList();
		try
		{
			st=con.prepareCall("{call Save_Thyroid_Table(?,?,?,?,?,?,?)}");
			st.setInt(1, tb.getPatientID());
			//st.setString(2, "");//renal ID
			
			st.setString(2, tb.getThyroidDate());
			st.setString(3, tb.getTs());
			st.setString(4, tb.getT4());
			st.setString(5, tb.getTsh());
			
			st.setString(6, tb.getUpdatedBy());
			st.setString(7, tb.getUpdatedTime());
			rs = st.executeQuery();
			//System.out.println("inserted");
			
			
			Thy_list =getThyroidTable(tb.getPatientID());
			
			//System.out.println(Inv_list);
			
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return Thy_list;
		
		
	}
	
	
	
	
	
	                    /*Liver Functional test table*/
	public static ArrayList saveLiverFunctionTestTable(inv_inveatigation_table inv) throws SQLException
	{
		int status = 0;
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_list = new ArrayList();
		try
		{
			st = con.prepareCall("{call Liver_Function_test(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, inv.getPatientID());
			st.setString(2, "");
			st.setString(3, inv.getLiverDate());
			st.setString(4, inv.getBilirubintotal());
			st.setString(5, inv.getDirect());
			st.setString(6, inv.getIndirect());
			st.setString(7, inv.getProteintotal());
			st.setString(8, inv.getAlbumin());
			st.setString(9, inv.getGlobumin());
			st.setString(10, inv.getRatios());
			st.setString(11, inv.getSGOT());
			st.setString(12, inv.getSGPT());
			st.setString(13, inv.getALP());
			st.setString(14, inv.getGGT());
			st.setString(15, inv.getUpdatedBy());
			st.setString(16, inv.getUpdatedTime());
			rs=st.executeQuery();
			
			
			Inv_list = getLiverFunctionTable(inv.getPatientID());
			
			con.close();
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
	}
	
	public static ArrayList SaveOtherTest(inv_inveatigation_table io) throws SQLException
	{
		int status =0;
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_Other_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="insert_others_table";
			st=con.prepareCall("{call investigation_other_test(?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, io.getPatientID());
			st.setString(2, null);
			st.setString(3, io.getOther1());
			st.setString(4, io.getOther2());
			st.setString(5, io.getOther3());
			st.setString(6, io.getOther4());
			st.setString(7, null);
			st.setString(8, null);
			st.setString(9, io.getUpdatedBy());
			st.setString(10, io.getUpdatedTime());
			st.setString(11, DbFlage);
			
			st.executeQuery();
			
			
			
			
			Inv_Other_list = getOtherTestTable(io.getPatientID());
			con.close();
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_Other_list;
		
		
	}
	
	public static int SaveotherTestInvestigation(InvestigationMainBean in) throws SQLException
	{
		int status =0;
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		String DbFlage;
		try
		{
			DbFlage="insert_other_test_1_table";
			st=con.prepareCall("{call investigation_other_test(?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, in.getPatientID());
			st.setString(2, null);
			st.setString(3, in.getOther_inv_1());
			st.setString(4, in.getOther_inv_2());
			st.setString(5, in.getOther_inv_3());
			st.setString(6, in.getOther_inv_4());
			st.setString(7, in.getOther_inv_5());
			st.setString(8, in.getOther_inv_6());			
			st.setString(9, in.getOthers_updatedby());
			st.setString(10, in.getOthers_updatedtime());
			st.setString(11, DbFlage);			
			rs=st.executeQuery();			
			
			status=1;
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return status;
		
	}
	
	public static int updateotherTestInvestigation(InvestigationMainBean in) throws SQLException
	{
		int status =0;
		
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		String DbFlage;
		try
		{
			DbFlage="update_other_test_1_table";
			st=con.prepareCall("{call investigation_other_test(?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, in.getPatientID());
			st.setString(2, null);
			st.setString(3, in.getOther_inv_1());
			st.setString(4, in.getOther_inv_2());
			st.setString(5, in.getOther_inv_3());
			st.setString(6, in.getOther_inv_4());
			st.setString(7, in.getOther_inv_5());
			st.setString(8, in.getOther_inv_6());			
			st.setString(9, in.getOthers_updatedby());
			st.setString(10, in.getOthers_updatedtime());
			st.setString(11, DbFlage);			
			rs=st.executeQuery();
			status=1;
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
			
		
		return status;
		
		
		
	}
	
	
	
	
	public static ArrayList saveTumorMarker(inv_inveatigation_table io) throws SQLException
	{
		
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		PreparedStatement ps1;
		ResultSet rs,rs1;
		ArrayList tumor = null;
		ArrayList tumor_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="Insert_tumor_marker";
			st=con.prepareCall("{call Tumor_marker(?,?,?,?,?,?,?,?)}");
			st.setInt(1, io.getPatientID());
			st.setString(2, null);
			st.setString(3, io.getSerila_number());
			st.setString(4, io.getTumor_marker());
			st.setString(5, io.getValue());
			st.setString(6, io.getUpdatedBy());
			st.setString(7, io.getUpdatedTime());
			st.setString(8, DbFlage);			
			rs=st.executeQuery();
			
			
			
			
			
			
			
			ps1 =con.prepareStatement("select * from investication_tumor_markers where patient_id=?;");
			ps1.setInt(1, io.getPatientID());
			rs1 = ps1.executeQuery();
			
			
			
			while(rs1.next())
			{
				tumor= new ArrayList();
				tumor.add(rs1.getString(3));
				tumor.add(rs1.getString(4));
				tumor.add(rs1.getString(5));
				tumor_list.add(tumor);
				
			}
			
			con.close();
			
		
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return tumor_list;
		
		
	}
	
	
	public static ArrayList ImmunoHistoChecmistry(inv_inveatigation_table io) throws SQLException
	{
		
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		/*PreparedStatement ps1;*/
		ResultSet rs;		
		ArrayList tumor_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="insert_immuno";
			st = con.prepareCall("{call Investigation_immuno_histo(?,?,?,?,?,?,?,?) }");
			st.setInt(1, io.getPatientID());
			st.setString(2, null);
			st.setString(3, io.getImmunoSeril_number());
			st.setString(4, io.getImmuno());
			st.setString(5, io.getResult());			
			st.setString(6, io.getUpdatedBy());
			st.setString(7, io.getUpdatedTime());
			st.setString(8, DbFlage );
			rs =st.executeQuery();
			con.close();			
			
			
			
			/*calling another method for select data*/
			tumor_list=selectImmuno(io.getPatientID());
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		
		
		
		return tumor_list;
		
	}
	
	
	
	public static ArrayList selectImmuno(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con =it.InitConnection();		
		PreparedStatement ps1;
		ResultSet rs,rs1;
		ArrayList tumor = null;
		ArrayList tumor_list = new ArrayList();
		try
		{
			
			ps1 =con.prepareStatement("select * from inv_immuno_histo_chemistry where patient_id=?;");
			ps1.setInt(1, patientID);
			rs1 = ps1.executeQuery();
			while(rs1.next())
			{
				tumor= new ArrayList();
				tumor.add(rs1.getString(3));
				tumor.add(rs1.getString(4));
				tumor.add(rs1.getString(5));
				tumor_list.add(tumor);
				
			}
			
			
			
			
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return tumor_list;
		
	}
	
	
	
	public static ArrayList TumorMarker(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con =it.InitConnection();		
		PreparedStatement ps1;
		ResultSet rs,rs1;
		ArrayList tumor = null;
		ArrayList tumor_list = new ArrayList();
		try
		{
			
			ps1 =con.prepareStatement("select * from investication_tumor_markers where patient_id=?;");
			ps1.setInt(1, patientID);
			rs1 = ps1.executeQuery();
			while(rs1.next())
			{
				tumor= new ArrayList();
				tumor.add(rs1.getString(1));//patientID
				tumor.add(rs1.getString(2));// row id
				tumor.add(rs1.getString(3));// serial Number
				tumor.add(rs1.getString(4));// tumor marker
				tumor.add(rs1.getString(5));// tumor marker value
				tumor.add(rs1.getString(6));// updated by
				tumor.add(rs1.getString(7));// updated time
				tumor.add(rs1.getString(8));// image path
				tumor.add(rs1.getString(9));// folder name
				tumor.add(rs1.getString(10));// file name 
     			tumor_list.add(tumor);
				
			}
			
			con.close();
			
		
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		
		return tumor_list;
		
	}
	
	
	public static ArrayList Endoscopy( inv_inveatigation_table io) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con =it.InitConnection();
		CallableStatement st;
		PreparedStatement ps1;
		ResultSet rs,rs1;		
		ArrayList tumor_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="insert_endo";
			st=con.prepareCall("{ call investigation_endoscopy(?,?,?,?,?,?,?,?) }");
			st.setInt(1, io.getPatientID());
			st.setString(2, null);
			st.setString(3, io.getEndo_date());
			st.setString(4, io.getEndo_select());
			st.setString(5, io.getEndo_text());
			st.setString(6, io.getUpdatedBy());
			st.setString(7, io.getUpdatedTime());
			st.setString(8, DbFlage);
			rs=st.executeQuery();
			
			tumor_list=selectendoscopy(io.getPatientID());
			
			
			con.close();
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return tumor_list;
		
		
	}
	
	public static ArrayList selectendoscopy(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList endo = null;
		ArrayList EndoScopy_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="select_endoscopy";
			st=con.prepareCall("{ call investigation_endoscopy(?,?,?,?,?,?,?,?) }");
			st.setInt(1, patientID);
			st.setString(2, null);
			st.setString(3, null);
			st.setString(4, null);
			st.setString(5, null);
			st.setString(6, null);
			st.setString(7, null);
			st.setString(8, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				endo= new ArrayList();
				
				endo.add(rs.getString(1));
				endo.add(rs.getString(2));
				endo.add(rs.getString(3));
				endo.add(rs.getString(4));
				endo.add(rs.getString(5));
				endo.add(rs.getString(6));
				endo.add(rs.getString(7));
				endo.add(rs.getString(8));
				endo.add(rs.getString(9));
				endo.add(rs.getString(10));
				EndoScopy_list.add(endo);
				
			}
			con.close();
			
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		
		
		System.out.println(EndoScopy_list);
		return EndoScopy_list;
		
		
	}
	
	
	
	
	
	   /*function to Display the table*/
	
	public static ArrayList getInvTes(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		//ArrayList InveTes_List = new ArrayList();
		try
		{
			DbFlage="select_ivn_table";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				InvTes.add(rs.getString(9));
				InvTes.add(rs.getString(10));
				InvTes.add(rs.getString(11));
				InvTes.add(rs.getString(12));
				InvTes.add(rs.getString(13));
				
				Inv_list.add(InvTes);	
				
				System.out.println(Inv_list);
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
		
	}
	
	
	public static ArrayList getrenal(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		//ArrayList InveTes_List = new ArrayList();
		try
		{
			DbFlage="select_renal";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				InvTes.add(rs.getString(9));
				InvTes.add(rs.getString(10));
				InvTes.add(rs.getString(11));
				InvTes.add(rs.getString(12));
				InvTes.add(rs.getString(13));
				InvTes.add(rs.getString(14));
				InvTes.add(rs.getString(15));
				InvTes.add(rs.getString(16));
			
				Inv_list.add(InvTes);	
				
				
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
		
	}
	
	
	public static ArrayList getLiverFunctionTable(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="select_Liver_table";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				InvTes.add(rs.getString(9));
				InvTes.add(rs.getString(10));
				InvTes.add(rs.getString(11));
				InvTes.add(rs.getString(12));
				InvTes.add(rs.getString(13));
				InvTes.add(rs.getString(14));
				InvTes.add(rs.getString(15));
				InvTes.add(rs.getString(16));
				InvTes.add(rs.getString(17));
				InvTes.add(rs.getString(18));
				InvTes.add(rs.getString(19));
				Inv_list.add(InvTes);	
				
				
			}
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	 
		
		
		return Inv_list;
		
	}
	
	public static ArrayList getOtherTestTable(int PatientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTestTable = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="Investigation_Test_table";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, PatientID);
			st.setString(2, DbFlage);
			rs = st.executeQuery();
			while(rs.next())
			{
				InvTestTable=new ArrayList();
				
				InvTestTable.add(rs.getString(1));
				InvTestTable.add(rs.getString(2));
				InvTestTable.add(rs.getString(3));
				InvTestTable.add(rs.getString(4));
				InvTestTable.add(rs.getString(5));
				InvTestTable.add(rs.getString(6));
				InvTestTable.add(rs.getString(7));
				InvTestTable.add(rs.getString(8));
				InvTestTable.add(rs.getString(9));
				InvTestTable.add(rs.getString(10));
				InvTestTable.add(rs.getString(11));
								
				Inv_list.add(InvTestTable);	
				
				
			}
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
		
	}
	
	
	
	/*select data*/
	
	public static InvestigationMainBean SelectIves_Main(int patientID) throws SQLException
	{

		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		InvestigationMainBean in = null;
		String DbFlage;
		try
		{
			DbFlage="select_inv_main";
			st=con.prepareCall("{call Select_queries(?,?) }");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			boolean record_found=rs.next();
					if(record_found)
					{
						in = new InvestigationMainBean();
						in.setPatientID(patientID);
						//in.setBlood_Group(rs.getString(2)); //investication_id made for temporary purpose
						in.setBlood_Group(rs.getString(3));
						in.setBlood_Type(rs.getString(4));
						
						in.setHiv(rs.getString(5));
						in.setHbsAg(rs.getString(6));
						in.setHcv(rs.getString(7));
						
						in.setTan1_updateflag("YES");
						
						if(rs.getString(8)==null)
						{
							in.setImpression("");
							in.setChrom_abb("");							
							in.setTab3_updateflage("NO");
							
						}
						else
						{
							in.setImpression(rs.getString(8));
							in.setChrom_abb(rs.getString(9));
							
							in.setTab3_updateflage("YES");
							
						}
						
						if(rs.getString(10)==null)
						{
							in.setXray("");
							in.setCtscan("");
							in.setMri_mcp("");
							in.setEcho("");
							in.setEcg("");
							in.setTreatment_policy("");
							
							in.setTab4_updateflag("NO");
							
						}
						else
						{
							
							
							in.setXray(rs.getString(10));
							in.setCtscan(rs.getString(11));
							in.setMri_mcp(rs.getString(12));
							in.setEcho(rs.getString(13));
							in.setEcg(rs.getString(14));
							in.setTreatment_policy(rs.getString(15));							
							in.setTab4_updateflag("YES");
							
							
							
						}
						
						
						
						
					}
					else
					{
						in = new InvestigationMainBean();
						in.setPatientID(patientID);
						in.setBlood_Group("");
						in.setBlood_Type("");
						
						in.setHiv("");
						in.setHbsAg("");
						in.setHcv("");
						
						in.setImpression("");
						in.setChrom_abb("");
						
						in.setXray("");
						in.setCtscan("");
						in.setMri_mcp("");
						in.setEcho("");
						in.setEcg("");
						in.setTreatment_policy("");
						
						in.setTab4_updateflag("NO");						
						in.setTab3_updateflage("NO");						
						in.setTan1_updateflag("NO");
					}
					
					DbFlage="select_other_Test_table";
					st=con.prepareCall("{call investigation_other_test(?,?,?,?,?,?,?,?,?,?,?)}");
					st.setInt(1, patientID);
					st.setString(2, null);
					st.setString(3, null);
					st.setString(4, null);
					st.setString(5, null);
					st.setString(6, null);
					st.setString(7, null);	
					st.setString(8, null);
					st.setString(9, null);
					st.setString(10, null);
					st.setString(11, DbFlage);
					rs=st.executeQuery();
					boolean recordfound = rs.next();
							if(recordfound)
							{
								in.setOther_inv_1(rs.getString(3));
								in.setOther_inv_2(rs.getString(4));
								in.setOther_inv_3(rs.getString(5));
								in.setOther_inv_4(rs.getString(6));
								in.setOther_inv_5(rs.getString(7));
								in.setOther_inv_6(rs.getString(8));								
							}
							else
							{
								
									in.setOther_inv_1("");
									in.setOther_inv_2("");
									in.setOther_inv_3("");
									in.setOther_inv_4("");
									in.setOther_inv_5("");
									in.setOther_inv_6("");
									
								
									
								
								
							}
					
			
					
							con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return in;
	}
	
	public static Serology_sectionBean selectSerotab(int Patient) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		Serology_sectionBean sb = new Serology_sectionBean();
		String DbFlage;
		try
		{
			/*DbFlage="select_inv_main";
			st=con.prepareCall("{call Select_queries(?,?) }");
			st.setInt(1,Patient);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			boolean resultset = rs.next();
			if(resultset)
			{
				
				if(rs.getString(5)==null)
				{
					sb.setPatientID(Patient);
					sb.setHiv("");
					sb.setHbsAg("");
					sb.setHcv("");
					
					
					sb.setTab2_updateflag("NO");
					
					
				}
				else
				{
					sb.setPatientID(Patient);
					sb.setHiv(rs.getString(5));
					sb.setHbsAg(rs.getString(6));
					sb.setHcv(rs.getString(7));
					
					sb.setTab2_updateflag("YES");
					
					
					
				}
							
				
				
			}
			else
			{
								
				sb.setPatientID(Patient);
				sb.setHiv("");
				sb.setHbsAg("");
				sb.setHcv("");
				
				sb.setTab2_updateflag("NO");
				
				
				
				
			}
			*/
			
			
			DbFlage="select_inv_cytology";
			st=con.prepareCall("{call Select_queries(?,?) }");
			st.setInt(1,Patient);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			boolean resultset1 = rs.next();
			if(resultset1)
			{
				
				
				
				
				sb.setPatientID(Patient);
				
				sb.setC1_num(rs.getString(3));
				sb.setC1_date(rs.getString(4));
				sb.setC1_type(rs.getString(5));
				sb.setC1_type_text(rs.getString(6));
				sb.setC1_grade(rs.getString(7));
				if(rs.getString(8)==null)
				{
					sb.setC2_num("");
					sb.setC2_date("");
					sb.setC2_type("");
					sb.setC2_type_text("");
					sb.setC2_grade("");
					
				}
				else
				{
					sb.setC2_num(rs.getString(8));
					sb.setC2_date(rs.getString(9));
					sb.setC2_type(rs.getString(10));
					sb.setC2_type_text(rs.getString(11));
					sb.setC2_grade(rs.getString(12));
					
					
				}
				
				sb.setTab2_updateflag("YES");
				
				
				
			}
			else
			{
				
				
				sb.setPatientID(Patient);
				
				sb.setC1_num("");
				sb.setC1_date("");
				sb.setC1_type("");
				sb.setC1_type_text("");
				sb.setC1_grade("");
				
				sb.setC2_num("");
				sb.setC2_date("");
				sb.setC2_type("");
				sb.setC2_type_text("");
				sb.setC2_grade("");
				
				sb.setTab2_updateflag("NO");
				
				
				
			}
			
			
			DbFlage="Select_inv_Histo";
			st=con.prepareCall("{call Select_queries(?,?) }");
			st.setInt(1,Patient);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			boolean recordFound = rs.next();
			if(recordFound)
			{
				sb.setPatientID(Patient);
				sb.setH1_num(rs.getString(3));
				sb.setH1_date(rs.getString(4));
				sb.setH1_type(rs.getString(5));
				sb.setH1_type_text(rs.getString(6));
				sb.setH1_grade(rs.getString(7));
				
				if(rs.getString(8)==null)
				{
					sb.setH2_num("");
					sb.setH2_date("");
					sb.setH2_type("");
					sb.setH2_type_text("");
					sb.setH2_grade("");
					
					
					
				}
				else
				{
					sb.setH2_num(rs.getString(8));
					sb.setH2_date(rs.getString(9));
					sb.setH2_type(rs.getString(10));
					sb.setH2_type_text(rs.getString(11));
					sb.setH2_grade(rs.getString(12));
					
				}
				
				
				sb.setTab2_updateflag("YES");
				
				
				
			}
			else
			{
				
				sb.setPatientID(Patient);
				sb.setH1_num("");
				sb.setH1_date("");
				sb.setH1_type("");
				sb.setH1_type_text("");
				sb.setH1_grade("");
				
				sb.setH2_num("");
				sb.setH2_date("");
				sb.setH2_type("");
				sb.setH2_type_text("");
				sb.setH2_grade("");
				
				sb.setTab2_updateflag("NO");
			
			}
			
			con.close();
				
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return sb;
		
	}
	
	
	
	
	/*updateinveestigation*/
	
	public static int updateInvestigation( InvestigationMainBean in) throws SQLException
	{
		int status=0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		String DbFlage;
		try
		{
			DbFlage="update_investigation";
			st=con.prepareCall("{call patient_investigation(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
			st.setInt(1, in.getPatientID());		
			st.setString(2, "investigation main id" );
			st.setString(3, in.getBlood_Group() );
			st.setString(4, in.getBlood_Type());
			st.setString(5, in.getHiv());
			st.setString(6, in.getHbsAg());
			st.setString(7, in.getHcv());
			st.setString(8, null);
			st.setString(9, null);
			st.setString(10, null);
			st.setString(11, null);
			st.setString(12, null);
			st.setString(13, null);
			st.setString(14, null);
			st.setString(15, null);
			st.setString(16, in.getPatientInves_updatedby());//lastupdated by
			st.setString(17, in.getPatientInves_updatedtime());//lastupdated time
			st.setString(18, DbFlage);
			rs=st.executeQuery();
			status=1;
			con.close();
					
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return status;
		
	}
	
	public static int Savetab3(Serology_sectionBean sb) throws SQLException
	{
		int status =0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		String DbFlage;
		try
		{
			DbFlage="insert_tab3";
			st=con.prepareCall("{call patient_investigation(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
			st.setInt(1, sb.getPatientID());		
			st.setString(2, null );
			st.setString(3, null);
			st.setString(4, null);
			st.setString(5, null);
			st.setString(6, null);
			st.setString(7, null);
			st.setString(8, sb.getImpression());
			st.setString(9, sb.getChrom_abb());
			st.setString(10, null);
			st.setString(11, null);
			st.setString(12, null);
			st.setString(13, null);
			st.setString(14, null);
			st.setString(15, null);
			st.setString(16,sb.getSerology_updatedby());//lastupdated by
			st.setString(17, sb.getSerology_updatedtime());//lastupdated time
			st.setString(18, DbFlage);
			rs=st.executeQuery();
			status=1;
			con.close();
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		
		
		return status;
		
		
	}
	
	
	public static int otherInvestigation(InvestigationMainBean in) throws SQLException
	{
		int status =0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		String DbFlage;
		try
		{
			DbFlage="update_other_investigation";
			st=con.prepareCall("{call patient_investigation(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, in.getPatientID());		
			st.setString(2, null );
			st.setString(3, null);
			st.setString(4, null);
			st.setString(5, null);
			st.setString(6, null);
			st.setString(7, null);
			st.setString(8, null);
			st.setString(9, null);
			st.setString(10, in.getXray());
			st.setString(11, in.getCtscan());
			st.setString(12, in.getMri_mcp());
			st.setString(13, in.getEcho());
			st.setString(14, in.getEcg());
			st.setString(15, in.getTreatment_policy());
			st.setString(16, in.getOthers_updatedby());//lastupdated by
			st.setString(17, in.getOthers_updatedtime());//lastupdated time
			st.setString(18, DbFlage);		
			rs=st.executeQuery();
			status=1;
			con.close();
			
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return status;
		
	}
	
	
	
	
	
	public static ArrayList SaveCardiac(inv_inveatigation_table io) throws SQLException
	{
		int status = 0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="savecardiac";
			st=con.prepareCall("{ call cardiac_investigation(?,?,?,?,?,?,?) }");
			st.setInt(1, io.getPatientID());
			st.setString(2, io.getCardiac_select());
			st.setString(3, io.getCardiac_date());
			st.setString(4, io.getCardiac_desc());
			st.setString(5, io.getCardic_UpdatedBy());
			st.setString(6, io.getCardic_UpdatedTime());
			st.setString(7, DbFlage);
			
			rs=st.executeQuery();
			
			Inv_list=getcardic(io.getPatientID());
			
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return Inv_list;
		
	}
	
	
	public static ArrayList getcardic(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		
		try
		{
			DbFlage="select_cardic";
			st=con.prepareCall("{ call cardiac_investigation(?,?,?,?,?,?,?) }");
			st.setInt(1, patientID);
			st.setString(2, null);
			st.setString(3, null);
			st.setString(4, null);
			st.setString(5, null);
			st.setString(6, null);
			st.setString(7, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));				
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				
			
				Inv_list.add(InvTes);	
				
				
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
		
	}
	
	
	public static ArrayList Saveimage(inv_inveatigation_table io) throws SQLException
	{
		int status = 0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="save_image";
			st=con.prepareCall("{ call img_tab(?,?,?,?,?,?,?) }");
			st.setInt(1, io.getPatientID());
			st.setString(2, io.getImage_select());
			st.setString(3, io.getImage_date());
			st.setString(4, io.getImage_desc());
			st.setString(5, io.getImg_UpdatedBy());
			st.setString(6, io.getImg_UpdatedTime());
			st.setString(7, DbFlage);
			
			rs=st.executeQuery();
			
			
			
			Inv_list=getimg(io.getPatientID());
			
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return Inv_list;
		
	}
	
	
	public static ArrayList getimg(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		
		try
		{
			DbFlage="select_image";
			st=con.prepareCall("{ call img_tab(?,?,?,?,?,?,?) }");
			st.setInt(1, patientID);
			st.setString(2, null);
			st.setString(3, null);
			st.setString(4, null);
			st.setString(5, null);
			st.setString(6, null);
			st.setString(7, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));				
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				
			
				Inv_list.add(InvTes);	
				
				
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
		
	}
	
	
	public static ArrayList Savenuclear(inv_inveatigation_table io) throws SQLException
	{
		int status = 0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="save_nuclear";
			st=con.prepareCall("{ call nuclear_img_table(?,?,?,?,?,?,?) }");
			st.setInt(1, io.getPatientID());
			st.setString(2, io.getNuclear_select());
			st.setString(3, io.getNuclear_date());
			st.setString(4, io.getNuclear_desc());
			st.setString(5, io.getNuc_UpdatedBy());
			st.setString(6, io.getNuc_UpdatedTime());
			st.setString(7, DbFlage);
			
			rs=st.executeQuery();
			//System.out.println("Saved");
			
			
			Inv_list=getnuclear(io.getPatientID());
			
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return Inv_list;
		
	}
	
	public static ArrayList getnuclear(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Inv_list = new ArrayList();
		String DbFlage;
		
		try
		{
			DbFlage="select_nuclear";
			st=con.prepareCall("{ call nuclear_img_table(?,?,?,?,?,?,?) }");
			st.setInt(1, patientID);
			st.setString(2, null);
			st.setString(3, null);
			st.setString(4, null);
			st.setString(5, null);
			st.setString(6, null);
			st.setString(7, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));				
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				
			
				Inv_list.add(InvTes);	
				
				
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return Inv_list;
		
	}
	
	
	// Function for lipid profile table 
	
	public static ArrayList getLipidTable(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList InvTes = null;
		ArrayList Lip_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="select_Lipid_table";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				InvTes=new ArrayList();
				
				InvTes.add(rs.getString(1));
				InvTes.add(rs.getString(2));
				InvTes.add(rs.getString(3));
				InvTes.add(rs.getString(4));
				InvTes.add(rs.getString(5));
				InvTes.add(rs.getString(6));
				InvTes.add(rs.getString(7));
				InvTes.add(rs.getString(8));
				InvTes.add(rs.getString(9));
				InvTes.add(rs.getString(10));
				InvTes.add(rs.getString(11));
				InvTes.add(rs.getString(12));
				InvTes.add(rs.getString(13));
				
				Lip_list.add(InvTes);	
				
				
			}
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	 
		
		
		return Lip_list;
		
	}
	
	
	// Function for Thyroid profile table 
	
		public static ArrayList getThyroidTable(int patientID) throws SQLException
		{
			InitCon it = new InitCon();
			Connection con = it.InitConnection();
			CallableStatement st;
			ResultSet rs;
			ArrayList InvTes = null;
			ArrayList Thy_list = new ArrayList();
			String DbFlage;
			try
			{
				DbFlage="select_Thyroid_table";
				st = con.prepareCall("{call Select_queries(?,?)}");
				st.setInt(1, patientID);
				st.setString(2, DbFlage);
				rs=st.executeQuery();
				
				while(rs.next())
				{
					InvTes=new ArrayList();
					
					InvTes.add(rs.getString(1));
					InvTes.add(rs.getString(2));
					InvTes.add(rs.getString(3));
					InvTes.add(rs.getString(4));
					InvTes.add(rs.getString(5));
					InvTes.add(rs.getString(6));
					InvTes.add(rs.getString(7));
					InvTes.add(rs.getString(8));
					InvTes.add(rs.getString(9));
					InvTes.add(rs.getString(10));
					InvTes.add(rs.getString(11));
					
					
					
					Thy_list.add(InvTes);	
					
					
				}
				con.close();
				
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		 
			
			
			return Thy_list;
			
		}
		
		
		
  // Function for Cytology table 

	public static ArrayList getCytologyTable(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Cyto_Tes = null;
		ArrayList Cyto_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="select_inv_cytology";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				Cyto_Tes=new ArrayList();
				
				Cyto_Tes.add(rs.getString(1));
				Cyto_Tes.add(rs.getString(2));
				Cyto_Tes.add(rs.getString(3));
				Cyto_Tes.add(rs.getString(4));
				Cyto_Tes.add(rs.getString(5));
				Cyto_Tes.add(rs.getString(6));
				Cyto_Tes.add(rs.getString(7));
				
				
				Cyto_list.add(Cyto_Tes);	
				
				
			}
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	 
		
		
		return Cyto_list;
		
	}

	
	// Function for Cytology table 

	public static ArrayList getHistopathologyTable(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		ArrayList Histo_Tes = null;
		ArrayList Histo_list = new ArrayList();
		String DbFlage;
		try
		{
			DbFlage="Select_inv_Histo";
			st = con.prepareCall("{call Select_queries(?,?)}");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			
			while(rs.next())
			{
				Histo_Tes=new ArrayList();
				
				Histo_Tes.add(rs.getString(1));
				Histo_Tes.add(rs.getString(2));
				Histo_Tes.add(rs.getString(3));
				Histo_Tes.add(rs.getString(4));
				Histo_Tes.add(rs.getString(5));
				Histo_Tes.add(rs.getString(6));
				Histo_Tes.add(rs.getString(7));
				Histo_Tes.add(rs.getString(15));
				
				
				
				
				
				Histo_list.add(Histo_Tes);	
				
				
			}
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	 
		
		
		return Histo_list;
		
	}
	

}
