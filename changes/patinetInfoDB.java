package com.HospitalEMR.patinentInfo.web.Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.HospitalEMR.CaseHistory.web.Model.hiddenFieldBean;
import com.HospitalEMR.Chemo.web.Model.chemotherapyID;
import com.HospitalEMR.Surgery.web.Model.SurgeryIDBean;
import com.HospitalEMR.patinentInfo.web.Model.ClinicalBean;
import com.HospitalEMR.patinentInfo.web.Model.ReferralBean;
import com.HospitalEMR.patinentInfo.web.Model.TumorBean;
import com.HospitalEMR.patinentInfo.web.Model.patientInfoBean;


import Connection.InitCon;

public class patinetInfoDB
{
	
                             /*save data for patientinfo*/
	public static int patientInfo(patientInfoBean p) throws SQLException
	{
	 int status=0;
	 InitCon it = new InitCon();
	 Connection con = it.InitConnection();
	 //PreparedStatement ps,ps1,ps2;
	 CallableStatement st,st2;
	 String DbFlage;
	 ResultSet rs1= null;
	 int pid=0;
	  
	 try
	 {
		   /* con.setAutoCommit(false);*/
		 	
		    DbFlage="p_master_insert";
		    st =con.prepareCall("{ call patient_master(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		    st.setInt(1, pid);
		    st.setString(2, p.getPname());
		    st.setString(3, p.getAge());
		    st.setString(4, p.getSex());
		    st.setString(5, p.getCd_no());// changed to  patient ID
		    st.setString(6, p.getAddress());
		    st.setString(7, p.getPhone_num());
		    st.setString(8, p.getUpdatedby());
		    st.setString(9, p.getUpdatedtime());
		    st.setString(10, p.getIndex_no());
		    st.setString(11, p.getReligion());  
		    
		    st.setString(12, p.getHospitalname());            //hospitalname
		    
		    st.setString(13, DbFlage);
		    
		    st.execute();
		    st.close();
		 
		    st = con.prepareCall("{call maximun_ID()}");		   
		    rs1 = st.executeQuery();
	//	    System.out.println("inserted in patient master table");
		    
		    while(rs1.next())
			{		    	
				pid=rs1.getInt(1);
				p.setPatientID(pid);  /*29*/
			}	
		    DbFlage="p_demography_insert";
		    st2 = con.prepareCall("{ call demography(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		    st2.setInt(1, p.getPatientID());
		    st2.setString(2, p.getSecondprimary()); //  changed to  protocol    
		    st2.setString(3, p.getPname());
		    st2.setString(4, p.getAge());
		    st2.setString(5, p.getSex());
		    st2.setString(6, p.getCd_no());//// changed to  patient ID
		    st2.setString(7, p.getAddress());
		    st2.setString(8, p.getPhone_num());
		    st2.setString(9, p.getOccupation());
		    st2.setString(10, p.getDiagnosis());
		    st2.setString(11, p.getOrgan_of_interest());
		    st2.setString(12, p.getSub_type());
		    st2.setString(13, p.getOthers());
		    st2.setString(14, null);
		    st2.setString(15, null);
		    st2.setString(16, null);
		    st2.setString(17, null);
		    st2.setString(18, null);
		    st2.setString(19, null);
		    st2.setString(20, null);
		    st2.setString(21, null);
		    st2.setString(22, null);
		    st2.setString(23, null);
		    st2.setString(24, null);
		    st2.setString(25, null);
		    st2.setString(26, null);
		    st2.setString(27, p.getUpdatedby());    //last updated name
		    st2.setString(28, p.getUpdatedtime());	//last updated time	    
		    st2.setString(29, p.getDateofadmission());
		    st2.setString(30, p.getIndex_no());
		    st2.setString(31, p.getDiagnosis_sub_types());
		    st2.setString(32, p.getPatient_agreement());
		    st2.setString(33, p.getReligion());
		    
		    st2.setString(34,p.getHospitalname());       //hositalname
		    
		    st2.setString(35, DbFlage);
		    st2.executeQuery();
		    	    
		//    System.out.println("inserted in demograpy table");
		    
			 status=1;
			 con.close();
			 
		 }
		 catch (Exception e) 
		 {
			 e.printStackTrace();
		  }
		 return status;
			
		}
	
	public static int patientTumor(TumorBean pt) throws SQLException
	{
		int status=0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		PreparedStatement ps,ps1;
		CallableStatement st,st1;
		ResultSet rs,rs1;
		String DbFlage;
		
		try
		{
			
			if(pt.getPatientID()==0)
			{
				int pid=0;
				
				st = con.prepareCall("{call maximun_ID()}");
				rs = st.executeQuery();
				while(rs.next())
				{
					pid=rs.getInt(1);
					pt.setPatientID(pid);
				}		
				
				
			
			}
			
			DbFlage ="p_tumor_borad_policy_insert";
			st1 = con.prepareCall("{ call Patient_Tumor_board_policy(?,?,?,?,?)}");
			st1.setInt(1, pt.getPatientID());
			st1.setString(2, pt.getTumor_date());
			st1.setString(3, pt.getPolicy_number());
			st1.setString(4, pt.getTumor_therapy());
			st1.setString(5, DbFlage);
			rs1=st1.executeQuery();
			
			
			status=1;
			con.close();
			
			
			
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
		
	}
	
	
	
	
	             /*Select data for patientinfo*/
	
	public static patientInfoBean Selectdata(int patientID ) throws SQLException
	{
		 InitCon it = new InitCon();
		 Connection con = it.InitConnection();
		 
		 patientInfoBean p = null;
		 CallableStatement st;
		 ResultSet rs = null;
		 String DbFlage;
		 
		 try
		 {
			 if(patientID == 0)
			 {
				 p=new patientInfoBean();
				 
				 p.setPatientID(0);
				 
				 p.setSecondprimary("");
				 p.setDateofadmission("");
				 p.setPname("");
				 p.setAge("");
				 p.setSex("");
				 p.setCd_no(""); // need to addd
				 p.setAddress("");			 
				 p.setPhone_num("");
				 p.setOccupation("");				
				 p.setDiagnosis("");
				 p.setOrgan_of_interest("");
				 p.setSub_type("");
				 p.setOthers("");
				 
				 p.setIndex_no("");
				 p.setDiagnosis_sub_types("");
				 p.setPatient_agreement("");
				 p.setReligion("");
				  
				 p.setHospitalname("");                  //hospitalname
				 
				 p.setUpdateflag("NO");
				 
			 }
			 else
			 {
				 DbFlage="patient_info";
				 st = con.prepareCall("{call Select_queries(?,?)}");
				 st.setInt(1, patientID);
				 st.setString(2, DbFlage);
				 rs = st.executeQuery();
				 
				 boolean record = rs.next();
				 if(record)
				 {
					 p=new patientInfoBean();
						
					 p.setPatientID(patientID);
					 p.setSecondprimary(rs.getString(2));
					 p.setDateofadmission(rs.getString(3));
					 p.setPname(rs.getString(4));
					 p.setAge(rs.getString(5));				 
					 p.setSex(rs.getString(6));
					 p.setCd_no(rs.getString(7)); // need to add.
					 p.setAddress(rs.getString(8));
					 p.setPhone_num(rs.getString(9));
					 p.setOccupation(rs.getString(10));					 
					 p.setDiagnosis(rs.getString(11));
					 p.setOrgan_of_interest(rs.getString(12));
					 p.setSub_type(rs.getString(13));
					 p.setOthers(rs.getString(14));
					 
					 p.setIndex_no(rs.getString(15));
					 p.setDiagnosis_sub_types(rs.getString(16));
					 p.setPatient_agreement(rs.getString(17));
					 p.setReligion(rs.getString(18));
					 
					 
				   	p.setHospitalname(rs.getString(19));          //hospitalname
					 
					 p.setUpdateflag("YES");
					 
				 }
				 else
				 {
					 
					 p=new patientInfoBean();
					 
					 p.setPatientID(patientID);
					 
					 p.setSecondprimary("");
					 p.setDateofadmission("");
					 p.setPname("");
					 p.setAge("");
					 p.setSex("");
					 p.setCd_no("");                 // need to add
					 p.setAddress("");			 
					 p.setPhone_num("");
					 p.setOccupation("");				
					 p.setDiagnosis("");
					 p.setOrgan_of_interest("");
					 p.setSub_type("");
					 p.setOthers("");
					 
					 p.setIndex_no("");
					 p.setDiagnosis_sub_types("");
					 p.setPatient_agreement("");
					 p.setReligion("");
					 
					 p.setHospitalname("");             //hospitalname
					 
					 p.setUpdateflag("NO");
					 
					 
				 }				 
			 }
			 con.close();
		 }
		 catch (Exception e) 
		 {
			 e.printStackTrace();
			// TODO: handle exception
		}
		 
		 
		 return  p;
		
	}
	
	public static ClinicalBean selectClinical(int patientID) throws SQLException
	{
		
		 InitCon it = new InitCon();
		 Connection con = it.InitConnection();
		 //PreparedStatement ps;
		 ClinicalBean cb = null;
		 CallableStatement st;
		 ResultSet rs = null;
		 String DbFlage;
		 try
		 {
			 
			 if(patientID == 0)
			 {
				 cb=new ClinicalBean();
				 cb.setPatientID(0);
				 
				 cb.setTum1("");
				 cb.setTum2("");
				 cb.setNod1("");
				 cb.setNod2("");
				 cb.setMeta1("");
				 cb.setMeta2("");
				 cb.setStg("");
				 cb.setStg1("");
				 cb.setStg2("");
				 
				 cb.setUpdateFlage("NO");
			 }
			 else
			 {		
				 
				 DbFlage="patient_clinical";
				    st = con.prepareCall("{call Select_queries(?,?)}");
				     st.setInt(1, patientID);
				     st.setString(2, DbFlage);
				     rs = st.executeQuery();
				     
				    
				 	boolean rec = rs.next();
				 	//System.out.println(rs.getString(1));
					
					if(rec)
					 {
						
						
							 if(rs.getString(1)=="" || rs.getString(1)==null){
								 cb= new ClinicalBean();						 
								 cb.setPatientID(patientID);
								 cb.setTum1("");
								 cb.setTum2("");
								 cb.setNod1("");
								 cb.setNod2("");
								 cb.setMeta1("");
								 cb.setMeta2("");
								 cb.setStg("");
								 cb.setStg1("");
								 cb.setStg2("");
								 
								 cb.setUpdateFlage("NO");
							 }
							 else
							 {
								 cb = new ClinicalBean();
								 
								 cb.setPatientID(patientID);
								 cb.setTum1(rs.getString(1));
								 cb.setTum2(rs.getString(2));
								 cb.setNod1(rs.getString(3));
								 cb.setNod2(rs.getString(4));
								 cb.setMeta1(rs.getString(5));
								 cb.setMeta2(rs.getString(6));
								 cb.setStg(rs.getString(7));
								 cb.setStg1(rs.getString(8));
								 cb.setStg2(rs.getString(9));
								 cb.setUpdateFlage("YES");
							 }
							   
					 } 
		       }
			 	
			   con.close();
			 }
			 catch (Exception e) 
			 {
				e.printStackTrace();
			}
		 
		 
		return cb;
		
	}
	
	
	public static ReferralBean selectRef(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		//PreparedStatement ps;
		ReferralBean pr = null;
		ResultSet rs=null;
		CallableStatement st;
		String DbFlage;
		try
		{
			if(patientID == 0)
			{
				pr = new ReferralBean();
				
				pr.setPatientID(0);
				pr.setRecorded_by("");
				pr.setConsultant("");
				pr.setReferral_phy("");
				pr.setReferral_doc("");
								
				pr.setUpdateFlage("NO");
				
				
			}
			else
			{
					DbFlage="patient_referal";
					st = con.prepareCall("{call Select_queries(?,?) }");
					st.setInt(1, patientID);
					st.setString(2, DbFlage);
					rs = st.executeQuery();
					
					boolean rec = rs.next();
				 	System.out.println(rs.getString(1));
					
					if(rec)
					{
						
						if(rs.getString(1)=="" || rs.getString(1)==null)
						{
							pr = new ReferralBean();
							
							pr.setPatientID(patientID);
							pr.setRecorded_by("");
							pr.setConsultant("");
							pr.setReferral_phy("");
							pr.setReferral_doc("");
							
							pr.setUpdateFlage("NO");
							
						}
						else
						{
							pr = new ReferralBean();
							
							pr.setPatientID(patientID);
							pr.setRecorded_by(rs.getString(1));
							pr.setConsultant(rs.getString(2));
							pr.setReferral_phy(rs.getString(3));
							pr.setReferral_doc(rs.getString(4));
							
							pr.setUpdateFlage("YES");
							
						}
												
						
					}
					
				}
			con.close();
			
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return pr;
	}
	
	public static TumorBean selectTumor(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		//PreparedStatement ps;
		TumorBean pt= null;
		ResultSet rs=null;
		CallableStatement st;
		String DbFlage;
		try
		{
			
			if(patientID==0)
			{
				pt= new TumorBean();
				pt.setPatientID(0);
				pt.setTumor_date("");
				pt.setPolicy_number("");
				pt.setTumor_therapy("");
				
				pt.setUpdateFlage("NO");
				 
				
				
				
			}
			else
			{
					DbFlage="select_tumor_board_policy";
					st = con.prepareCall("{call Select_queries(?,?) }");
					st.setInt(1, patientID);
					st.setString(2, DbFlage);
					rs=st.executeQuery();					
					
					pt=new TumorBean();
					
					
					
					boolean recored_found = rs.next();
					
					if(recored_found)
					{
						
						pt.setPatientID(patientID);
						pt.setTumor_date(rs.getString(2));
						pt.setPolicy_number(rs.getString(3));
						pt.setTumor_therapy(rs.getString(4));
						
						pt.setUpdateFlage("YES");
					}
					else
					{
						pt.setPatientID(patientID);
						pt.setTumor_date("");
						pt.setPolicy_number("");
						pt.setTumor_therapy("");
						
						pt.setUpdateFlage("NO");
					}
					
					
						
						
					}
					
					
				
				
				
		
			con.close();
			
		}
		catch (Exception e)
		{
		e.printStackTrace();
		}
		
		return pt;
		
	}
	
	public static hiddenFieldBean selectHiddenField(int patientID) throws SQLException
	{
		InitCon it = new InitCon();
		Connection con=it.InitConnection();
		CallableStatement st;
		ResultSet rs;
		hiddenFieldBean hf = null;
		String DbFlage;
		try
		{
			DbFlage="hidden_fields";
			st = con.prepareCall("{call Select_queries(?,?) }");
			st.setInt(1, patientID);
			st.setString(2, DbFlage);
			rs=st.executeQuery();
			boolean record_set = rs.next();
			if(record_set)
			{
				
				
				hf=new hiddenFieldBean();
				
				
				
				
				hf.setSex(rs.getString(1));
				hf.setOrgan_of_interest(rs.getString(2));
				hf.setP_id(rs.getString(3));
				
				//hf.setP_id(rs.getInt(3));
				
				hf.setPname(rs.getString(4));
				hf.setCd_no(rs.getString(5)); // index number
				hf.setDiagnosis(rs.getString(6));
				hf.setPatientID(rs.getInt(7));
				
				
				if(rs.getString(8)==null) {
					hf.setFolderName("");
					hf.setFileName("");
					
				}else {
					hf.setFolderName(rs.getString(8));
					hf.setFileName(rs.getString(9));
					
				}
				
				hf.setOrgan_of_interest_type(rs.getString(10));
				
				
				
			}
			else
			{
				
					hf=new hiddenFieldBean();
					hf.setSex("");
					hf.setOrgan_of_interest("");
					
					hf.setP_id("0");
					hf.setPname("");
					hf.setCd_no("");
					hf.setDiagnosis("");
					hf.setPatientID(0);
					hf.setFolderName("");
					hf.setFileName("");
					hf.setOrgan_of_interest_type("");
					
					
					
				
				
				
			}
			
			con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return hf;
		
		
	}
	
	
	public static SurgeryIDBean selectSurgeryID(int patientID) throws SQLException
    {
           InitCon it = new InitCon();
           Connection con=it.InitConnection();
           CallableStatement st;
           PreparedStatement ps;
           ResultSet rs;
           SurgeryIDBean s= null;
           String DbFlage;
           try
           {
                  
                  
                  
                  ps = con.prepareStatement("select max(surgery_id) from surgery where patient_id=?");
                  ps.setInt(1, patientID);
                  rs=ps.executeQuery();
                  boolean record_set = rs.next();
                  
                  if(record_set)
                  {
                        s = new SurgeryIDBean();                           
                        
                        
                        if(rs.getString(1)==null)
                        {
                               s.setSID(""); 
                        }
                        else
                        {
                               s.setSID(rs.getString(1)); 
                        }
                        
                                      
                        
                  }
                  else
                  {
                        s = new SurgeryIDBean();
                        s.setSID("");                     
                        
                  }
                  
                  con.close();
                  
           }
           catch (Exception e) {
                  e.printStackTrace();// TODO: handle exception
           }
           
           return s;
           
           
    }
	
	
	public static chemotherapyID selectchemoID(int patientID) throws SQLException
    {
           InitCon it = new InitCon();
           Connection con=it.InitConnection();
           CallableStatement st;
           PreparedStatement ps;
           ResultSet rs;
           chemotherapyID c= null;
           String DbFlage;
           try
           {
                  
                  
                  
                  ps = con.prepareStatement("select max(chemo_id) from chemotherapy where patient_id=?");
                  ps.setInt(1, patientID);
                  rs=ps.executeQuery();
                  boolean record_set = rs.next();
                  
                  if(record_set)
                  {
                        c = new chemotherapyID();
                        
                      
                        
                        if(rs.getString(1)==null)
                        {
                               c.setChemotherapyID("");  
                        }
                        else
                        {
                               c.setChemotherapyID(rs.getString(1));  
                        }
                        
                                      
                        
                  }
                  else
                  {
                        c = new chemotherapyID();
                        c.setChemotherapyID("");                
                        
                  }
                  
                  con.close();
                  
           }
           catch (Exception e) {
                  e.printStackTrace();// TODO: handle exception
           }
           
           return c;
           
           
    }




    
    


	
	
	
	
	
	
	                        /*Update data for patientinfo*/
	
	public static int updatePatientInfo(patientInfoBean p) throws SQLException
	{
		int status = 0;
		
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		//PreparedStatement ps;
		CallableStatement st,st1;
		String DbFlage;
		
		try
		{
			DbFlage="p_master_update";
			st1 = con.prepareCall("call patient_master(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st1.setInt(1, p.getPatientID());
			st1.setString(2, p.getPname());
			st1.setString(3, p.getAge());
			st1.setString(4, p.getSex());
			st1.setString(5, p.getCd_no());///////
			st1.setString(6, p.getAddress());
			st1.setString(7, p.getPhone_num());
			st1.setString(8,p.getUpdatedby());// update by
			st1.setString(9,p.getUpdatedtime());// update time
			st1.setString(10, p.getIndex_no());
			st1.setString(11, p.getReligion());
			
			st1.setString(12,p.getHospitalname());  ///hospitalname
			
			
			st1.setString(13, DbFlage);
			st1.executeQuery();			
			
		//	 System.out.println("updated in patient master table");
			
			
			DbFlage="p_demography_update";
		 	st = con.prepareCall("{ call demography(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		    st.setInt(1, p.getPatientID());
		    st.setString(2, p.getSecondprimary());		    
		    st.setString(3, p.getPname());
		    st.setString(4, p.getAge());
		    st.setString(5, p.getSex());
		    st.setString(6, p.getCd_no());/////////
		    st.setString(7, p.getAddress());
		    st.setString(8, p.getPhone_num());
		    st.setString(9, p.getOccupation());
		    st.setString(10, p.getDiagnosis());
		    st.setString(11, p.getOrgan_of_interest());
		    st.setString(12, p.getSub_type());
		    st.setString(13, p.getOthers());
		    st.setString(14, null);
		    st.setString(15, null);
		    st.setString(16, null);
		    st.setString(17, null);
		    st.setString(18, null);
		    st.setString(19, null);
		    st.setString(20, null);
		    st.setString(21, null);
		    st.setString(22, null);
		    st.setString(23, null);
		    st.setString(24, null);
		    st.setString(25, null);
		    st.setString(26, null);
		    st.setString(27, p.getUpdatedby());   //last updated name
		    st.setString(28, p.getUpdatedtime());	//last updated time	    
		    st.setString(29, p.getDateofadmission());
		    st.setString(30, p.getIndex_no());
		    st.setString(31, p.getDiagnosis_sub_types());
		    st.setString(32, p.getPatient_agreement());
		    st.setString(33, p.getReligion());
		    st.setString(34, p.getHospitalname());
		    st.setString(35, DbFlage);
		    st.executeQuery();
		    st.close();		    
		    
			status=1;
			con.close();	
	//	 System.out.println("updated in demography table ");
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
		
	}
	
	public static int updateClinical(ClinicalBean cb) throws SQLException
	{
		int status = 0;
		
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		//PreparedStatement ps,ps1;
		CallableStatement st,st1;
		ResultSet rs1;
		String DbFlage;
		
		try
		{
			DbFlage="update_demo_graphy_clinical";
			st = con.prepareCall("{ call demography(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st.setInt(1, cb.getPatientID());
		    st.setString(2, null);		    
		    st.setString(3, null);
		    st.setString(4, null);
		    st.setString(5, null);
		    st.setString(6, null);
		    st.setString(7, null);
		    st.setString(8, null);
		    st.setString(9, null);
		    st.setString(10, null);
		    st.setString(11, null);
		    st.setString(12, null);
		    st.setString(13, null);
		    st.setString(14, cb.getTum1());
			st.setString(15, cb.getTum2());
			st.setString(16, cb.getNod1());
			st.setString(17, cb.getNod2());
			st.setString(18, cb.getMeta1());
			st.setString(19, cb.getMeta2());
			st.setString(20, cb.getStg());
			st.setString(21, cb.getStg1());
			st.setString(22, cb.getStg2());
		    st.setString(23, null);
		    st.setString(24, null);
		    st.setString(25, null);
		    st.setString(26, null);
		    st.setString(27, cb.getUpdatedby());  //---->last updated name
		    st.setString(28, cb.getUpdatedtime());	//---->last updated time	    
		    st.setString(29, null);
		    st.setString(30, null);
		    st.setString(31, null);
		    st.setString(32, null);
		    st.setString(33, null);
		    st.setString(34, DbFlage);
		    status=st.executeUpdate();
		    con.close();	
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	
	
	public  static int updateReferral(ReferralBean pr) throws SQLException
	{
		int status = 0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		PreparedStatement ps,ps1;
		CallableStatement st,st1;
		ResultSet rs,rs1;
		String DbFlage;
        
		
		if(pr.getPatientID() == 0)
		  {
			int pid=0;
			st = con.prepareCall("{call maximun_ID()}");
			rs1 = st.executeQuery();			
			
				while(rs1.next())
				{
					pid=rs1.getInt(1);
					pr.setPatientID(pid);;
				}			 
			
		  }
		try
		{
			
			
			DbFlage="update_demography_referal";
			st1 = con.prepareCall("{ call demography(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			st1.setInt(1, pr.getPatientID());
		    st1.setString(2, null);		    
		    st1.setString(3, null);
		    st1.setString(4, null);
		    st1.setString(5, null);
		    st1.setString(6, null);
		    st1.setString(7, null);
		    st1.setString(8, null);
		    st1.setString(9, null);
		    st1.setString(10, null);
		    st1.setString(11, null);
		    st1.setString(12, null);
		    st1.setString(13, null);
		    st1.setString(14, null);
			st1.setString(15, null);
			st1.setString(16, null);
			st1.setString(17, null);
			st1.setString(18, null);
			st1.setString(19, null);
			st1.setString(20, null);
			st1.setString(21, null);
			st1.setString(22, null);
			st1.setString(23, pr.getRecorded_by());
			st1.setString(24, pr.getConsultant());
			st1.setString(25, pr.getReferral_phy());
			st1.setString(26, pr.getReferral_doc());
		    st1.setString(27, pr.getReferal_updatedby());  //---->last updated name
		    st1.setString(28, pr.getReferal_updatedtime());	//---->last updated time	    
		    st1.setString(29, null);
		    st1.setString(30, null);
		    st1.setString(31, null);
		    st1.setString(32, null);
		    st1.setString(33, null);
		    st1.setString(34, DbFlage);
		    status=st1.executeUpdate();
		    
		    
		    con.close();
			
			
			
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
		
	}
	
	public static int updateTumor(TumorBean pt) throws SQLException
	{
		int status = 0;
		InitCon it = new InitCon();
		Connection con = it.InitConnection();
		
		CallableStatement st;	
		String DbFlage;
		try
		{	
			DbFlage="p_tumor_borad_policy_update";
			st = con.prepareCall("{call Patient_Tumor_board_policy(?,?,?,?,?)}");
			
			
			st.setInt(1, pt.getPatientID());
			st.setString(2, pt.getTumor_date());
			st.setString(3, pt.getPolicy_number());
			st.setString(4, pt.getTumor_therapy());	
			st.setString(5, DbFlage);
			
			status = st.executeUpdate();
			
			
			con.close();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return status;
	}

}
