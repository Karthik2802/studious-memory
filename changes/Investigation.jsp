
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.HospitalEMR.CaseHistory.web.Model.hiddenFieldBean"%>
<%@page import="com.HospitalEMR.patinentInfo.web.Dao.patinetInfoDB"%>
<%@page import="com.HospitalEMR.ReadFile.web.readFile"%>

<%@page import="java.sql.Connection"%>
<%@page import="Connection.InitCon"%>
<%@page import="java.util.Date"%>

<%@page import="com.HospitalEMR.User.web.Dao.UserDB"%>
<%@page import="com.HospitalEMR.Investigation.web.Model.Serology_sectionBean"%>
<%@page import="org.json.JSONArray"%>
<%@page import="sun.font.Script"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.HospitalEMR.Investigation.web.Dao.Disease_TypeDB"%>
<%@page import="com.HospitalEMR.Investigation.web.Model.InvestigationMainBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.HospitalEMR.Investigation.web.Dao.InvestigationDB"%>
<%@page import="com.HospitalEMR.Investigation.web.Model.inv_inveatigation_table"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>     
<% 

readFile f = new readFile();
String title = f.Title(request);
 
 
//String PatientID="2";
String PatientID =request.getParameter("PatientID");
 int PID = Integer.parseInt(PatientID);	
//String saccessrole="2"; 
String saccessrole=request.getParameter("accessrole");
 int accessrole=Integer.parseInt(saccessrole);
 	  //String PatientID="147";  
    
    InvestigationDB iDB=new InvestigationDB();
    Disease_TypeDB DT = new Disease_TypeDB();
    patinetInfoDB pd = new patinetInfoDB();	
	hiddenFieldBean hf = new hiddenFieldBean();	
    
    inv_inveatigation_table i = new inv_inveatigation_table();
    InvestigationMainBean in = new InvestigationMainBean(); 
    Serology_sectionBean sb = new Serology_sectionBean();
        
    in = iDB.SelectIves_Main(PID);
    //sb = iDB.selectSerotab(PID);
    hf=pd.selectHiddenField(PID);
    
    ArrayList Inv_table;     
    Inv_table = new ArrayList();
    Inv_table = iDB.getInvTes(PID);
    
    ArrayList renal_table;
    renal_table = new ArrayList();
    renal_table = iDB.getrenal(PID);    
    
    ArrayList Liv_Table;     
    Liv_Table = new ArrayList();
    Liv_Table = iDB.getLiverFunctionTable(PID);    
    
    ArrayList InvTestTable;     
    InvTestTable = new ArrayList();
    InvTestTable = iDB.getOtherTestTable(PID);
    
    ArrayList TumorMArker;
    TumorMArker = new ArrayList();
    TumorMArker = iDB.TumorMarker(PID);
    
    ArrayList Immuno;
    Immuno = new ArrayList();
    Immuno = iDB.selectImmuno(PID);
    
    ArrayList Endoscopy;
    Endoscopy = new ArrayList();
    Endoscopy = iDB.selectendoscopy(PID);    
    
    ArrayList cardiac;
    cardiac = new ArrayList();
    cardiac = iDB.getcardic(PID);    
    
    ArrayList imgTable;
    imgTable = new ArrayList();
    imgTable = iDB.getimg(PID);
    
    ArrayList nuclearTable;
    nuclearTable = new ArrayList();
    nuclearTable = iDB.getnuclear(PID);
    
    
    // Additional requirement table lipid profile
    ArrayList lipidTable;
    lipidTable = new ArrayList();
    lipidTable = iDB.getLipidTable(PID);
    
    // Thyroid table
    ArrayList thyroidTable;
    thyroidTable = new ArrayList();
    thyroidTable = iDB.getThyroidTable(PID);
    
    // Cytology table
    ArrayList cyto_table;
    cyto_table = new ArrayList();
    cyto_table = iDB.getCytologyTable(PID);
    
 	// Histopathology table
    ArrayList histo_table;
    histo_table = new ArrayList();
    histo_table = iDB.getHistopathologyTable(PID);
    
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="image/LOGO.png" type="image/gif">
<title>Investigation</title>
<link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="all"> 
<link href="css/icon_display.css" rel="stylesheet" media="all"> 
<link href="css/radio_button.css" rel="stylesheet">
 <link rel="stylesheet" href="css/my_design.css"> 
 <script src="js/jquery.min.js"></script> 
 <!-- <script src="js/jquery.1.11.1.js"></script> -->
<script src="js/Investifation.js"></script>
<script src="js/InvestigationSave.js"></script>
 <script src="css/bootstrap/js/bootstrap.min.js"></script>
 
 
 
 <script type="text/javascript"> 
 
 
 history.pushState(null, null, location.href);
	window.onpopstate = function () 
	{
	    history.go(1);
	};
 /* DropDown Function as autocomplete */ 
	 function move(text_box_value)
	 {
		
		 if(text_box_value=="c1")
		 {
		 document.getElementById("c1_type_text").focus();
		 }
		 else if(text_box_value=="c2")
		 {
		 document.getElementById("c2_type_text").focus();
		 }
		 else if(text_box_value=="H1")
		 {
		 document.getElementById("H1_type_text").focus();
		 }
		 else
		 {
			 document.getElementById("H2_type_text").focus();
		 }
			    	 
	 } 
	 function getDiseaseType(filter)
	 {   
		 
		 
	   <%   
	   		ArrayList Disease_type;     
		    Disease_type = new ArrayList();
		    Disease_type = DT.gettype(PID);		    	    
		    StringBuffer values = new StringBuffer();
		  
		    for (int l = 0; l < Disease_type.size(); ++l)
		    {
		    	if (values.length() > 0)
		        {;
		            values.append(',');
		        }
		        values.append('"').append(Disease_type.get(l)).append('"');
		    }    
		%>
		    var Disease = [ <%= values.toString() %> ];   	  
			var newArray=[];      
			if(!filter=="")
				  { 
				    for(i=0;i<Disease.length;i++)
					   {
				    	if(Disease[i].toUpperCase().startsWith(filter.toUpperCase()))
					       {        
					        newArray.push(Disease[i]);
					       }  	      
					   }
				      
				  }  			
			
			     dis="<datalist id='type_list'>";
				 for (i=0;i<newArray.length;i++)
				 {
				     dis+="<option >"+newArray[i] ;
							
				 }			
			     dis+="</datalist>";
				
			     document.getElementById("DDDisplay").innerHTML=dis;
			     //$('DDDisplay').html(dis);
	} 
	 
	 
	 
	 
	 $(document).ready(function (){   
		 	
	     var form = $('#p_investigation'); 
	    
	     $("#p_invesitigationSubmit").click(function (){ 
	     	
	        $.ajax({
	             url: 'Investigation', //servlet url
	             type: 'POST',    //passing data as post method
	             dataType: 'json', // returning data as json 	           
	             data: form.serialize(),
	             success: function (json) {
	             	 
	             	document.getElementById("se_patinetID").value=json;               
	                
	                 
	                
	                 $('#myTabs li:nth-child(2) a').tab('show');
	                 $('html, body').animate({ scrollTop: 0 }, 0);
	                 
	               
	             }
	         }); 
	        });
	 });
	 

 
 
 
 $(document).ready(function (){   
	 	
     var form = $('#p_serologyForm'); 
    
     $("#p_serologySubmit").click(function (){ 
     	
        $.ajax({
             url: 'Serology_section', //server url
             type: 'POST',    //passing data as post method
             dataType: 'json', // returning data as json 	           
             data: form.serialize(),
             success: function (json) {
             	 
             	document.getElementById("Tab3_patinetID").value=json;               
                
                 
                
                 $('#myTabs li:nth-child(3) a').tab('show');
                 $('html, body').animate({ scrollTop: 0 }, 0);
                 
               
             }
         }); 
        });
 });
 
 
 $(document).ready(function (){   

	 var form = $('#immuno_tab'); 
   
     $("#inv_ImmunoSubmit").click(function (){ 
     	
        $.ajax({
             url: 'Immuno_endo_tab', //server url
             type: 'POST',    //passing data as post method
             dataType: 'json', // returning data as json 	           
             data: form.serialize(),
             success: function (json) {
             	 
             	document.getElementById("Tab4_patinetID").value=json;             
             	$('#myTabs li:nth-child(4) a').tab('show');
                $('html, body').animate({ scrollTop: 0 }, 0);
                 
               
             }
         }); 
        });
 });
 
 $(document).ready(function (){   
	 	
     var form = $('#tab4_other_ivestigation'); 
    
     $("#other_investigationSubmit").click(function (){ 
    	 
    	 
    	 
    	 if(document.getElementById("treatment_policy").value=="")
    		 {
    		 
    		 alert("Treatment policy should not Empty");
    		 return;
    		 }
    	
     	
        $.ajax({
             url: 'Other_investigation', //server url
             type: 'POST',    //passing data as post method
             dataType: 'json', // returning data as json 	           
             data: form.serialize(),
             success: function (json) {
             	         	 
             	 var successUrl = "Surgery.jsp?PatientID="+json[0]+"&accessrole="+json[1];
             	 				 //General_examination.jsp?PatientID="+pid[0]+"&accessrole="+pid[1];
             	  
             	  window.location.href = successUrl;
             	/* document.getElementById("Tab4_patinetID").value=json;             
             	$('#myTabs li:nth-child(4) a').tab('show'); */
                 
              
             }
         }); 
        });
     
 });
 

 

  </script> 
  
  <style type="text/css">
  .form-group.required .control-label:after {
  content:"*";
  color:red;
}
  
  </style>
 
 </head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Home_Page.jsp"><%=title %></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
          <!-- <li>
                        <a href="#">About Us	</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">Outpatient Treatment</a>
                            </li>
                            <li>
                                <a href="#">In patient Treatments</a>
                            </li>
                            <li>
                                <a href="#">Surgery</a>
                            </li>
                            <li>
                                <a href="#">RadioTherapy</a>
                            </li>
                            <li>
                                <a href="#">ChemoTherapy</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">Doctors</a>
                            </li>
                            <li>
                                <a href="#">FAQ</a>
                            </li>
                            <li>
                                <a href="#">Treatments</a>
                            </li>
                         </ul>
                    </li>  -->
                    <li>
                     <input type="hidden" name="name" id="name" value="<%=session.getAttribute("name") %>">
	                   <a><font color="RED"><%=session.getAttribute("name")%></font></a> 
	                    </li>
	                    <li>
	                    <a href='logout.jsp'>Log out</a>
	                    </li>
	                    
	                      <%
	                	Date lastAccessed = new Date(session.getLastAccessedTime());
	            		
	                	session=request.getSession(false);
	            	    if(session.getAttribute("name") == null)
	                    { 
 	                    	 response.sendRedirect("Login.jsp");
 	                    	 return;
	               		}  
	                     
	                    %>
                    <!--  <li>
                        <a href="login.jsp" >Login</a> 
                       
                        
                    </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <br>
    <br>
   
    
    <div class="container-fluid header-fixed">
                
		<ul class="nav nav-tabs fixed-top"  role="tablist"  >
		<a class="navbar-brand" href="Home_Page.jsp">
                    <img id="brand" src="image/EMR-1.jpg" width="270" height="80" alt="">
                </a>
			 
		  <li ><a href="Demography.jsp?p_id=<%=PatientID%>&accessrole=<%=saccessrole%>&tabActive=Inactive" class="thumbnail"><img src="image/patine.png" width="80"  data-toggle="tab"><figcaption> Demography</figcaption></a></li>
		  <li ><a  href="Case_History.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/case_history.png" width="80" height="30"  data-toggle="tab" ><figcaption>Case History</figcaption></a></li>
		  <li><a  href="General_examination.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/general_info.png" width="80" height="30"   data-toggle="tab" ><figcaption>General Info</figcaption></a></li>
		  <li class="active"><a  href="Investigation.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/investigation.jpg" width="80" height="50" data-toggle="tab" ><figcaption>Investigation</figcaption></a></li>
		  <li><a  href="Surgery.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/Surgery.png" width="80" height="50" data-toggle="tab"><figcaption>Surgery</figcaption></a></li>
		  <li><a  href="Post_operative_period.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/post_operative.png" width="80" height="30" data-toggle="tab" ><figcaption>Post Operative</figcaption></a></li>
		  <li><a  href="Chemotherapy.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/chemo.png" width="80" height="50" data-toggle="tab" ><figcaption>Chemo</figcaption></a></li>
		  <li><a  href="RadiotherapyExternal.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/Radio_external.jpg" width="80" height="30"  data-toggle="tab" ><figcaption>Radio-External</figcaption></a></li>
		  <li><a  href="RadioBrachy.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/Radio_brachy.png" width="80" height="30"  data-toggle="tab" ><figcaption>Radio-Brachy</figcaption></a></li>
		  <li><a  href="Nuclear_therapy.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/Radio_brachy.png" width="80" height="30"  data-toggle="tab" ><figcaption>Nuclear Therapy</figcaption></a></li>
		  <li><a  href="Followup.jsp?PatientID=<%=PatientID%>&accessrole=<%=saccessrole%>"><img src="image/FOLLOW-UP.png" width="80" height="30"  data-toggle="tab" ><figcaption>Follow-ups</figcaption></a></li>
		</ul>
	</div>
	
	<div class="container-fluid">
	<div class="row">
		<!-- <h1>Side Navigation Bar</h1> -->
		
         <div role="tabpanel">
            <div class=" col-md-2 col-sm-2 top">
           <div class="wrimagecard wrimagecard-topimage" > 
            
                <ul class="nav nav-pills brand-pills nav-stacked" id="myTabs" role="tablist" style="background-color: #C0C0C0;">
                    <li role="presentation" class="brand-nav active "><a href="#tab1" onclick="investigtion();"  aria-controls="tab1" role="tab" data-toggle="tab"><b>Patient Investigation</b></a></li>
                    <li role="presentation" class="brand-nav"><a href="#tab2" onclick="sero();" aria-controls="tab2" role="tab" data-toggle="tab"><b>Cytology & Histopathology</b></a></li>
                    <li role="presentation" class="brand-nav"><a href="#tab3" onclick="immuno();" aria-controls="tab3" role="tab" data-toggle="tab"><b>Scopy</b></a></li>
                    <li role="presentation" class="brand-nav"><a href="#tab4" onclick="others();" aria-controls="tab4" role="tab" data-toggle="tab"><b>Imaging & Nuclear Imaging</b></a></li>
                		 <h4><u>Patient Information</u></h4>
           			<h4>Patient ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getP_id() %></h4>
           			<h4>Patient Name:<%=hf.getPname() %></h4>
           			<h4>Index No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getCd_no() %></h4>
				    <h4>Diagnosis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getDiagnosis()%></h4>
				    <h4>Organ Of Interest&nbsp;&nbsp;&nbsp;:<%=hf.getOrgan_of_interest()%></h4>
				    
				    
				     <div>
		                <img  class="size"  src="Upload/<%=hf.getPatientID() %>/<%=hf.getFolderName()%>/<%=hf.getFileName()%>" id="previewPicture"/> 
		               </div> 
                
                </ul>
                  </div>
            </div>
<div class="col-md-6 tab-content1 top invespad">
   <div class="tab-content">
        
  <!------------------------------------ Tab 1 Start -----------------------------------------------> 
  
     <div role ="tabpanel" class="tab-pane tab-ft active" id="tab1">
      <h3><u><b>INVESTIGATION</b></u></h3>
      <script type="text/javascript">
      
      <%
      if(accessrole==1)
      {
      %>
      $(document).ready(function () {
          $("#p_investigation *").prop("disabled", true);
      });
      
      <%
    	  
      }
      
      
      %>
      function investigtion()
       {
    	  
   	   <%
   	    in = iDB.SelectIves_Main(PID);
   	    sb = iDB.selectSerotab(PID);
   	   
   	   %>
   	   $('#investigtion').load(' #investigtion');
       }
      </script>
      
 <!-- <div class="scroll"> -->
 <form method="post" id="p_investigation">
     <input type="hidden" name="patinetID" id="patinetID" value=<%=PID%>>
    
      
      <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
      <input type="hidden"  name="patientInves_updatedby" id="patientInves_updatedby" value="<%=session.getAttribute("name")%>" required>
     <input type="hidden"  name="patientInves_updatedtime" id="patientInves_updatedtime" value="<%=lastAccessed%>" required>
     <div id="investigtion">
     <input type="hidden"  name="tan1_updateflag" id="tan1_updateflag" value="<%=in.getTan1_updateflag() %>" required>
     <br><h4><b><u>BLOOD TEST</u></b></h4>
     <div class="row">
        <div class="form-group ">
	        <label class="col-md-2 control-label required">Blood Group</label>
	        <%
	        if(in.getTan1_updateflag().equals("YES") && in.getBlood_Group().equals("A"))
	        {
	        %>
	        <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" value="A" id="blood_group" required name="blood_group" checked="checked"  ><span class="checkround"></span></label>
	        </div>
	        <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp B<input type="radio" value="B" id="blood_group" required name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	         <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp AB<input type="radio" value="AB" id="blood_group" required name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	         <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp O<input type="radio" value="O" id="blood_group" required name="blood_group" ><span class="checkround"></span></label>
	        </div>
	        
	        <%
	        }
	        else if(in.getTan1_updateflag().equals("YES") && in.getBlood_Group().equals("B"))
	        {
	        %>
	        <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" required value="A" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	        <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp B<input type="radio" required value="B" id="blood_group" name="blood_group" checked="checked"  ><span class="checkround"></span></label>
	        </div>
	         <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp AB<input type="radio" required value="AB" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	         <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp O<input type="radio" required value="O" id="blood_group" name="blood_group" ><span class="checkround"></span></label>
	        </div>
	        	
	        <%	
	        }
	        else if(in.getTan1_updateflag().equals("YES") && in.getBlood_Group().equals("AB"))
	        {
	        	%>
		        <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" required value="A" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
		        </div>
		        <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp B<input type="radio" value="B" id="blood_group" name="blood_group"   ><span class="checkround"></span></label>
		        </div>
		         <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp AB<input type="radio" required value="AB" id="blood_group" name="blood_group" checked="checked"  ><span class="checkround"></span></label>
		        </div>
		         <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp O<input type="radio"  required value="O" id="blood_group" name="blood_group" ><span class="checkround"></span></label>
		        </div>
		        	
		     <%	
		     
	        }
	        else if(in.getTan1_updateflag().equals("YES") && in.getBlood_Group().equals("O"))
	        {        
	        
	        %>
	        <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" required value="A" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	        <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp B<input type="radio" required value="B" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	         <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp AB<input type="radio"  required value="AB" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
	        </div>
	         <div class="col-md-2 ">	
	            <label class="radio">&nbsp&nbsp&nbsp O<input type="radio" required value="O" id="blood_group" name="blood_group" checked="checked" ><span class="checkround"></span></label>
	        </div>
	        <% 
	        }
	        else
	        {
	        	%>
		        <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" required value="A" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
		        </div>
		        <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp B<input type="radio" required value="B" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
		        </div>
		         <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp AB<input type="radio" required value="AB" id="blood_group" name="blood_group"  ><span class="checkround"></span></label>
		        </div>
		         <div class="col-md-2 ">	
		            <label class="radio">&nbsp&nbsp&nbsp O<input type="radio" required value="O" id="blood_group" name="blood_group" ><span class="checkround"></span></label>
		        </div>
		        <% 
	        	
	        }
	        %>
	        
        </div> 
     </div>
     <br>
     <div class="row">
        <div class="form-group">
	        <label class="col-md-2  control-label required">Type</label>
	       
	        
	        <%
	        if(in.getTan1_updateflag().equals("YES") && in.getBlood_Type().equals("POSITIVE"))
	        {
	        %>
	         <div class="col-md-3 ">	
	            <label class="radio">&nbsp&nbsp&nbsp POSITIVE<input type="radio" required value="POSITIVE" id="blood_type" name="blood_type" checked="checked"  ><span class="checkround"></span></label>
	        </div>
	        <div class="col-md-3 ">	
	            <label class="radio">&nbsp&nbsp&nbsp NEGATIVE<input type="radio"  required value="NEGATIVE" id="blood_type" name="blood_type"  ><span class="checkround"></span></label>
	        </div>
	        
	        <%
	        }
	        else if(in.getTan1_updateflag().equals("YES") && in.getBlood_Type().equals("NEGATIVE"))	        	
	        {
        	 %>
	         <div class="col-md-3 ">	
	            <label class="radio">&nbsp&nbsp&nbsp POSITIVE<input type="radio" required value="POSITIVE" id="blood_type" name="blood_type"  ><span class="checkround"></span></label>
	        </div>
	        <div class="col-md-3 ">	
	            <label class="radio">&nbsp&nbsp&nbsp NEGATIVE<input type="radio" required value="NEGATIVE" id="blood_type" name="blood_type" checked="checked"   ><span class="checkround"></span></label>
	        </div>
	        
	        <%	        	
	        }
	        else
	        {
        	%>
	         <div class="col-md-3 ">	
	            <label class="radio">&nbsp&nbsp&nbsp POSITIVE<input type="radio" required value="POSITIVE" id="blood_type" name="blood_type"  ><span class="checkround"></span></label>
	        </div>
	        <div class="col-md-3 ">	
	            <label class="radio">&nbsp&nbsp&nbsp NEGATIVE<input type="radio" required value="NEGATIVE" id="blood_type" name="blood_type" ><span class="checkround"></span></label>
	        </div>
	        
	        <%	        	
	        }
	        	  
	        %>
	     
	        
	        
        </div> 
     </div>
     
         <h4><b><u>INVESTIGATION</u></b></h4><BR>
         
         <%
         if(Inv_table.isEmpty())
         {
         %>
         <div id="inv_ID">
         <table border="1px" id="InvestigationTable" >
         <tbody>
	       <tr>
				<th class="text-center" rowspan="2" >DATE</th>
				<th class="text-center" rowspan="2">HB</th>
				<th class="text-center" rowspan="2">TC </th>	
				<th class="text-center" rowspan="2">DC</th>
				<th class="text-center" rowspan="2">PLATELETS</th>
				<th class="text-center" colspan="3">SUGAR</th>
				<!-- <th class="text-center" rowspan="2">UREA</th>
				<th class="text-center" rowspan="2">CREATININE</th>
				<th class="text-center" colspan="4">ELECTROLYTES</th> -->
			</tr>
			<tr>
			    <th>RBS</th>
			    <th>FBS</th>
			    <th>PPBS</th>
			   <!--  <th>SODIUM</th>
			    <th>POTASSIUM</th>
			    <th>CHLORIDE</th>
			    <th>BI CARBONATES</th> -->
			</tr>
			
			
			
			<tr>
	                <td><input type="date" name="investicationdate" id="investicationdate"  class="input_table_170px"></td>
	                <td><input type="text" name="hb" id="hb" class="input_small_50px"  ></td>
	                <td><input type="text" name="tc" id="tc" class="input_small_50px"  ></td>
	                <td><input type="text" name="dc" id="dc" class="input_small_50px"  ></td>
	                <td><input type="text" name="platelets" id="platelets" class="input_small_70px"  ></td>
	                <td><input type="text" name="Rbs" id="Rbs" class="input_small_50px"  ></td>
	                <td><input type="text" name="Fbs" id="Fbs" class="input_small_50px"  ></td>
	                <td><input type="text" name="Ppbs" id="Ppbs" class="input_small_50px"  ></td>
	               <!--  <td><input type="text" name="Urea" id="Urea" class="input_small_50px"  ></td>
	                <td><input type="text" name="Creatinine" id="Creatinine" class="input_small_70px"  ></td>
	                <td><input type="text" name="Sodium" id="Sodium" class="input_small_70px"  ></td>
	                <td><input type="text" name="potassium" id="potassium" class="input_small_70px"  ></td>
	                <td><input type="text" name="Chloride" id="Chloride" class="input_small_70px"  ></td>
	                <td><input type="text" name="Bicarbonates" id="Bicarbonates" class="input_small_70px"  ></td> -->
	             
	            </tr>
	          
			</tbody> 
	 </table>
	 </div>
	 
	 <%
	 if(accessrole==1)
	 {
     %>
    
     
     <%
	 }
	 else
	 {
	 %>
	 <br><input type="button" class="btn btn-primary" onclick="insRow('InvestigationTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('investtable')" id="investtable" value="Save Row" />
     
     <%		 
	 }
	 %>
	 
	 
	
         
         
         <%        	 
         }
         else
         {
        %>
        	<div id="inv_ID">
         <table border="1px" id="InvestigationTable" >
         <tbody>
	       <tr>
				<th class="text-center" rowspan="2" >DATE</th>
				<th class="text-center" rowspan="2">HB</th>
				<th class="text-center" rowspan="2">TC </th>	
				<th class="text-center" rowspan="2">DC</th>
				<th class="text-center" rowspan="2">PLATELETS</th>
				<th class="text-center" colspan="3">SUGAR</th>
				<th class="text-center" rowspan="2">Upload</th>
				<!-- <th class="text-center" rowspan="2">CREATININE</th>
				<th class="text-center" colspan="4">ELECTROLYTES</th> -->
			</tr>
			<tr>
			    <th>RBS</th>
			    <th>FBS</th>
			    <th>PPBS</th>
			   <!--  <th>SODIUM</th>
			    <th>POTASSIUM</th>
			    <th>CHLORIDE</th>
			    <th>BI CARBONATES</th> -->
			</tr>
			
			<%
			int count = 0;
            String color = "#f5f5f5";
         
            if (!Inv_table.isEmpty()) 
           {          
                Iterator itr = Inv_table.iterator();
                while (itr.hasNext()) 
                {
               	    if ((count % 2) == 0) 
                    {
                	   /*   color = "#eeffee";*/
                        color = "#f5f5f5";
                        
                        
                    } 
                    count++;
                    ArrayList pList = (ArrayList) itr.next();
			%>
			
			
			<tr style="background-color:<%=color%>;" >
	               <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
	               
	                <td><%=pList.get(2)%></td>
	                <td><%=pList.get(3)%></td>
	                <td><%=pList.get(4)%></td>
	                <td><%=pList.get(5)%></td>
	                <td><%=pList.get(6)%></td>
	                <td><%=pList.get(7)%></td>
	                <td><%=pList.get(8)%></td>
	                 <td><%=pList.get(9)%></td>
	                
	               <%
	                if(pList.get(10)==null)
	                {
	                %>
	                 <td><input type="file" name="invesgationTest<%=pList.get(1)%>" id="invesgationTest<%=pList.get(1)%>"   class="uploadFile" value="Upload"/>
                	 <input type="button" onclick="SaveImg(rowId<%=pList.get(1)%>.value,invesgationTest<%=pList.get(1)%>.value,patinetID.value,'Ivestigation_Test')" value="save" class="btn btn-primary" ></td>
                   <%
	                }
	                else
	                {
	                %>
	                <td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(12)%>&fieldname=<%=pList.get(11)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
	                <%
	                }
	                %> 
                   
	                
	                
	             
	             
	            </tr>
	            <%
                    }
                }
			  %>
			</tbody> 
	 </table>
	 </div>
	 
	 <%
	 if(accessrole==1 )
	 {
     %>
  
     
     <%
	 }
	 else
	 {
	 %>
	 <br><input type="button" class="btn btn-primary" onclick="insRow('InvestigationTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('investtable')" id="investtable" value="Save Row" />
     
     <%		 
	 }
	 %>
	
        
        <%
        	 
         }
         
         %>
         
         
         <br><h4><b><u>RENAL</u></b></h4>
         
          <%
         if(renal_table.isEmpty())
         {
         %>
         
          <div id="renal_ID">
         <table border="1px" id="renaltable">
         <tbody>
         
          <tr>
				<th class="text-center" rowspan="2" >DATE</th>
				<th class="text-center" rowspan="2">UREA</th>
				<th class="text-center" rowspan="2">CREATININE </th>				
				<th class="text-center" colspan="6">ELECTROLYTES</th>
			
			</tr>
			<tr>
			    
			    <th>SODIUM</th>
			    <th>POTASSIUM</th>
			    <th>CHLORIDE</th>
			    <th>CALCIUM</th>
			    <th>MAGNISIUM</th>
			    <th>BI CARBONATES</th>
			    
			</tr>
			
			
			<tr>
	                <td><input type="date" name="renalDate" id="renalDate"  class="input_table_170px"></td>
	                 <td><input type="text" name="Urea" id="Urea" class="input_small_50px"  ></td>
	                <td><input type="text" name="Creatinine" id="Creatinine" class="input_small_70px"  ></td>
	                 <td><input type="text" name="Sodium" id="Sodium" class="input_small_70px"  ></td>
	                <td><input type="text" name="potassium" id="potassium" class="input_small_70px"  ></td>
	                <td><input type="text" name="Chloride" id="Chloride" class="input_small_70px"  ></td>
	                <td><input type="text" name="calcium" id="calcium" class="input_small_70px"  ></td>
	                 <td><input type="text" name="megnisium" id="megnisium" class="input_small_50px"  ></td>
	                 <td><input type="text" name="Bicarbonates" id="Bicarbonates" class="input_small_70px"  ></td> 
	             
	            </tr>
         	
         
         
         
         
         </tbody>
         </table>
         
         </div>
         
         
          <%
	 if(accessrole==1)
	 {
	 %>
	
	 <%		 
	 }
	 else
	 {
	 %>
	 <br><input type="button" class="btn btn-primary" onclick="insRow('renaltable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('renal')" id="renal" value="Save Row" />
	 
	 <%
	 }
     %>
         
          
         
         <%
         }
         else
         {
        %>
        
        <div id="renal_ID">
        
         <table border="1px" id="renaltable">
         <tbody>
         
          <tr>
				<th class="text-center" rowspan="2" >DATE</th>
				<th class="text-center" rowspan="2">UREA</th>
				<th class="text-center" rowspan="2">CREATININE </th>				
				<th class="text-center" colspan="6">ELECTROLYTES</th>
				<th class="text-center" colspan="6" rowspan="2">UPLOAD</th>
			
			</tr>
			<tr>
			    
			    <th>SODIUM</th>
			    <th>POTASSIUM</th>
			    <th>CHLORIDE</th>
			    <th>CALCIUM</th>
			    <th>MAGNISIUM</th>
			    <th>BI CARBONATES</th>
			   
			   
			    
			</tr>
			
			<%
			int count = 0;
            String color = "#f5f5f5";
         
            if (!renal_table.isEmpty()) 
           {          
                Iterator itr = renal_table.iterator();
                while (itr.hasNext()) 
                {
               	    if ((count % 2) == 0) 
                    {
                	 
                        color = "#f5f5f5";
                        
                        
                    } 
                    count++;
                    ArrayList pList = (ArrayList) itr.next();
			%>
			
			
			<tr style="background-color:<%=color%>;" >
	                 <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
	                <td><%=pList.get(2)%></td>
	                <td><%=pList.get(3)%></td>
	                <td><%=pList.get(4)%></td>
	                <td><%=pList.get(5)%></td>
	                <td><%=pList.get(6)%></td>
	                <td><%=pList.get(7)%></td>
	                <td><%=pList.get(8)%></td>
	                <td><%=pList.get(9)%></td>
	                <td><%=pList.get(10)%></td>
	                
	                
	                 <%
	                if(pList.get(13)==null)
	                {
	                %>
	                 <td><input type="file" name="renal<%=pList.get(1)%>" id="renal<%=pList.get(1)%>"   class="uploadFile" value="Upload"/>
                	 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,renal<%=pList.get(1)%>.value,patinetID.value,'Renal_Test')" value="save" class="btn btn-primary" ></td>
                   <%
	                }
	                else
	                {
	                %>
	                <td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(15)%>&fieldname=<%=pList.get(14)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
	                <%
	                }
	                %> 
	                
	                
	                
	                
	             
	             
	            </tr>
	            <%
                    }
                }
			  %>
			
			
			
         
         
         
         
         </tbody>
         </table>
        
        
        
        </div>
        
        <%
	 if(accessrole==1)
	 {
	 %>
	
	 <%		 
	 }
	 else
	 {
	 %>
	 <br><input type="button" class="btn btn-primary" onclick="insRow('renaltable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('renal')" id="renal" value="Save Row" />
	 
	 <%
	 }
     %>
        
        
        <%
         }
         
        %>
        
        
         <h4><b><u>SEROLOGY</u></b></h4><BR>
        
          <table id="serology">
	       <tr>
				<th class="text-center" >HIV</th>
				<th class="text-center" >HBsAg</th>
				<th class="text-center" >HCV</th>
			</tr>
			<tr>
		    <td>
			    <select name="hiv" class="input_table_DD">
					    <option value="">select</oprion>
					    <option value="POSITIVE"<%=in.getHiv().equals("POSITIVE")?"selected":""%>>POSITIVE</option>
					    <option value="NEGATIVE"<%=in.getHiv().equals("NEGATIVE")?"selected":""%>>NEGATIVE</option>
			    </select>
			   	</td>
			    <td> 
			     <select name="hbsAg" class="input_table_DD">
					    <option value="">select</oprion>
					    <option value="POSITIVE" <%=in.getHbsAg().equals("POSITIVE")?"selected":""%>>POSITIVE</option>
					    <option value="NEGATIVE"<%=in.getHbsAg().equals("NEGATIVE")?"selected":""%>>NEGATIVE</option>
			     </select>
			    </td>
			    <td> 
			     <select name="hcv" class="input_table_DD">
					    <option value="">select</oprion>
					    <option value="POSITIVE" <%=in.getHcv().equals("POSITIVE")?"selected":""%> >POSITIVE</option>
					    <option value="NEGATIVE" <%=in.getHcv().equals("NEGATIVE")?"selected":""%>>NEGATIVE</option>
			     </select>
			    </td>
			</tr>
	</table><br>
         
         
         
         
         
     
	
	 <h4><u><b>LIVER FUNCTION TEST</b></u></h4>
	 
	 <%
	 if(Liv_Table.isEmpty())
	 {
	 %>
	 
	 <div id="liverID">
	  <table border="1px" id="liverFunctionTable">
          <tr>
	<th class="text-center" rowspan="2" >DATE</th>
	<th class="text-center" colspan="3">BILIRUBIN</th>
	<th class="text-center" colspan="4">ELECTROLYTES</th>
	<th class="text-center" colspan="4">ENZYMES</th>
</tr>
<tr>
    <th>TOTAL</th>
    <th>DIRECT</th>
    <th>INDIRECT</th>
    <th>TOTAL</th>
    <th>ALBUMIN</th>
    <th>GLOBUMIN</th>
    <th>RATIO</th>
    <th>SGOT</th>
    <th>SGPT</th>
    <th>ALP</th>
    <th>GGT</th>
  </tr>
  
  
 
			
			<tr>
	                <td><input type="date" name="liverDate" id="liverDate" class="input_table_170px" ></td>
	                <td><input type="text" name="bilirubintotal" id="bilirubintotal" class="input_small_50px" ></td>
	                <td><input type="text" name="Direct" id="Direct" class="input_small_50px" ></td>
	                <td><input type="text" name="Indirect" id="Indirect" class="input_small_50px" ></td>
	                <td><input type="text" name="proteintotal" id="proteintotal" class="input_small_50px"></td>
	                <td><input type="text" name="Albumin" id="Albumin" class="input_small_50px"></td>
	                <td><input type="text" name="Globumin" id="Globumin" class="input_small_50px" ></td>
	                <td><input type="text" name="Ratio" id="Ratio" class="input_small_50px"></td>
	                <td><input type="text" name="SGOT" id="SGOT" class="input_small_50px"></td>
	                <td><input type="text" name="SGPT" id="SGPT" class="input_small_50px" ></td>
	                <td><input type="text" name="ALP" id="ALP" class="input_small_50px" ></td>
	                <td><input type="text" name="GGT" id="GGT" class="input_small_50px" ></td>
	               
	             
	            </tr>
	            </table>
 </div>
 
 
 <%
 if(accessrole==1)
 {
	 %> 
	
	
	<%
	 
 }
 else
 {
 %>
 <br><input type="button" class="btn btn-primary" onclick="insRow('liverFunctionTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('liverFunction')" id="liverFunction" value="Save Row" /><br><br>
 <%
 }
 
 %>
     
	 
	 
	 
	 
	<%	 
	 }
	 else
	 {
	 %>
	 
	 <div id="liverID">
	  <table border="1px" id="liverFunctionTable">
          <tr>
	<th class="text-center" rowspan="2" >DATE</th>
	<th class="text-center" colspan="3">BILIRUBIN</th>
	<th class="text-center" colspan="4">ELECTROLYTES</th>
	<th class="text-center" colspan="4">ENZYMES</th>
	<th class="text-center" colspan="4" rowspan="2">UPLOAD</th>
</tr>
<tr>
    <th>TOTAL</th>
    <th>DIRECT</th>
    <th>INDIRECT</th>
    <th>TOTAL</th>
    <th>ALBUMIN</th>
    <th>GLOBUMIN</th>
    <th>RATIO</th>
    <th>SGOT</th>
    <th>SGPT</th>
    <th>ALP</th>
    <th>GGT</th>
  </tr>
  
  
  <%
			int count1 = 0;
            String color1 = "#f5f5f5";
         
            if (!Liv_Table.isEmpty()) 
           {          
                Iterator itr = Liv_Table.iterator();
                while (itr.hasNext()) 
                {
               	    if ((count1 % 2) == 0) 
                    {
                	   /*   color = "#eeffee";*/
                        color1 = "#f5f5f5";
                        
                        
                    } 
                    count1++;
                    ArrayList pList = (ArrayList) itr.next();
			%>
			
			
			<tr style="background-color:<%=color1%>;" >
	               <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
	                <td><%=pList.get(2)%></td>
	                <td><%=pList.get(3)%></td>
	                <td><%=pList.get(4)%></td>
	                <td><%=pList.get(5)%></td>
	                <td><%=pList.get(6)%></td>
	                <td><%=pList.get(7)%></td>
	                <td><%=pList.get(8)%></td>
	                <td><%=pList.get(9)%></td>
	                <td><%=pList.get(10)%></td>
	                <td><%=pList.get(11)%></td>
	                 <td><%=pList.get(12)%></td>
	                <td><%=pList.get(13)%></td>
	                
	                   <%
     	                if(pList.get(17)==null)
     	                {
     	                %>
     	                
     	                 <td><input type="file" name="liver<%=pList.get(1)%>" id="liver<%=pList.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,liver<%=pList.get(1)%>.value,patinetID.value,'LiverFunctionTest')" value="save" class="btn btn-primary" ></td>
     	                
     	                
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(18)%>&fieldname=<%=pList.get(17)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %>
	                
	                
	                
	                
	                
	               
	             
	            </tr>
	            <%
                    }
                }
			  %>
  


 
 </table>
 </div>
      <%
 if(accessrole==1)
 {
	 %> 
	
	
	<%
	 
 }
 else
 {
 %>
 <br><input type="button" class="btn btn-primary" onclick="insRow('liverFunctionTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('liverFunction')" id="liverFunction" value="Save Row" /><br><br>
 <%
 }
 
 %>
	 
	 
	 
	 
	<%	 
	 }
	 %>
	 
	 
	 <!----------------------------------------------Lipid profile function-------------------------------------------------------- -->
	 
	 
	 <h4><u><b>Lipid Profile</b></u></h4>
	 
	 <%
	 if(lipidTable.isEmpty())
	 {
	 %>
	 
	 <div id="lipidID">
	  <table border="1px" id="lipidTable">
          <!-- <tr>
	<th class="text-center" rowspan="2" >DATE</th>
	<th class="text-center" colspan="3">TC</th>
	<th class="text-center" colspan="4">TRIGLYCERIDES</th>
	<th class="text-center" colspan="4">HDL</th>
</tr> -->
<tr>
    <th>DATE</th>
    <th>TC</th>
    <th>TRIGLYCERIDES</th>
    <th>HDL</th>
    <th>LDL</th>
    <th>VLDL</th>
    
</tr>
  
  
 
			
			<tr>
	                <td><input type="date" name="lipidDate" id="lipidDate" class="input_table_170px" ></td>
	                <td><input type="text" name="tc" id="tc" class="input_small_50px" ></td>
	                <td><input type="text" name="tryg" id="tryg" class="input_table_170px" ></td>
	                <td><input type="text" name="hdl" id="hdl" class="input_small_50px" ></td>
	                <td><input type="text" name="ldl" id="ldl" class="input_small_50px"></td>
	                <td><input type="text" name="vldl" id="vldl" class="input_small_50px"></td>
	                
	            </tr>
	            </table>
 </div>
 
 
 <%
 if(accessrole==1)
 {
	 %> 
	
	
	<%
	 
 }
 else
 {
 %>
 <br><input type="button" class="btn btn-primary" onclick="insRow('lipidTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('lipidprofile')" id="lipidprofile" value="Save Row" /><br><br>
 <%
 }
 
 %>
     
	 
	 
	 
	 
	<%	 
	 }
	 else
	 {
	 %>
	 
	 <div id="lipidID">
	  <table border="1px" id="lipidTable">
         <!--  <tr>
	<th class="text-center" rowspan="2" >DATE</th>
	<th class="text-center" colspan="3">BILIRUBIN</th>
	<th class="text-center" colspan="4">ELECTROLYTES</th>
	<th class="text-center" colspan="4">ENZYMES</th>
	<th class="text-center" colspan="4" rowspan="2">UPLOAD</th>
</tr> -->
<tr>
    <th>DATE</th>
    <th>TC</th>
    <th>TRIGLYCERIDES</th>
    <th>HDL</th>
    <th>LDL</th>
    <th>VLDL</th>
    <th>UPLOAD</th>
  </tr>
  
  
  <%
			int count1 = 0;
            String color1 = "#f5f5f5";
         
            if (!lipidTable.isEmpty()) 
           {          
                Iterator itr = lipidTable.iterator();
                while (itr.hasNext()) 
                {
               	    if ((count1 % 2) == 0) 
                    {
                	   /*   color = "#eeffee";*/
                        color1 = "#f5f5f5";
                        
                        
                    } 
                    count1++;
                    ArrayList pList = (ArrayList) itr.next();
			%>
			
			
			<tr style="background-color:<%=color1%>;" >
	               <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
	                <td><%=pList.get(2)%></td>
	                <td><%=pList.get(3)%></td>
	                <td><%=pList.get(4)%></td>
	                <td><%=pList.get(5)%></td>
	                <td><%=pList.get(6)%></td>
	                <td><%=pList.get(7)%></td>
	                <%-- <td><%=pList.get(8)%></td>
	                <td><%=pList.get(9)%></td>
	                <td><%=pList.get(10)%></td>
	                <td><%=pList.get(11)%></td>
	                 <td><%=pList.get(12)%></td>
	                <td><%=pList.get(13)%></td> --%>
	                
	                   <%
     	                if(pList.get(10)==null)
     	                {
     	                %>
     	                
     	                 <td><input type="file" name="lipid<%=pList.get(1)%>" id="lipid<%=pList.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,lipid<%=pList.get(1)%>.value,patinetID.value,'LipidFunctionTest')" value="save" class="btn btn-primary" ></td>
     	                
     	                
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(12)%>&fieldname=<%=pList.get(11)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %>
	                
	                
	                
	                
	                
	               
	             
	            </tr>
	            <%
                    }
                }
			  %>
  


 
 </table>
 </div>
      <%
 if(accessrole==1)
 {
	 %> 
	
	
	<%
	 
 }
 else
 {
 %>
 <br><input type="button" class="btn btn-primary" onclick="insRow('lipidTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('lipidprofile')" id="lipidprofile" value="Save Row" /><br><br>
 <%
 }
 
 %>
	 
	 
	 
	 
	<%	 
	 }
	 %>
	 
	 
	 <!--------------------------------------------------------------------------------------------------------------------------------->
	 
	 
	 
	  <!----------------------------------------------Thyroid function-------------------------------------------------------- -->
	 
	 
	 <h4><u><b>Thyroid Function</b></u></h4>
	 
	 <%
	 if(thyroidTable.isEmpty())
	 {
	 %>
	 
	 <div id="thyroidID">
	  <table border="1px" id="thyroidTable">
          <!-- <tr>
	<th class="text-center" rowspan="2" >DATE</th>
	<th class="text-center" colspan="3">TC</th>
	<th class="text-center" colspan="4">TRIGLYCERIDES</th>
	<th class="text-center" colspan="4">HDL</th>
</tr> -->
<tr>
    <th>DATE</th>
    <th>TS</th>
    <th>T4</th>
    <th>TSH</th>
    
</tr>
  
  
 
			
			<tr>
	                <td><input type="date" name="thyroidDate" id="thyroidDate" class="input_table_170px" ></td>
	                <td><input type="text" name="ts" id="ts" class="input_small_50px" ></td>
	                <td><input type="text" name="t4" id="t4" class="input_table_170px" ></td>
	                <td><input type="text" name="tsh" id="tsh" class="input_small_50px" ></td>
	               
	            </tr>
	            </table>
 </div>
 
 
 <%
 if(accessrole==1)
 {
	 %> 
	
	
	<%
	 
 }
 else
 {
 %>
 <br><input type="button" class="btn btn-primary" onclick="insRow('thyroidTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('thyroidfunction')" id="thyroidfunction" value="Save Row" /><br><br>
 <%
 }
 
 %>
     
	 
	 
	 
	 
	<%	 
	 }
	 else
	 {
	 %>
	 
	 <div id="thyroidID">
	  <table border="1px" id="thyroidTable">
         <!--  <tr>
	<th class="text-center" rowspan="2" >DATE</th>
	<th class="text-center" colspan="3">BILIRUBIN</th>
	<th class="text-center" colspan="4">ELECTROLYTES</th>
	<th class="text-center" colspan="4">ENZYMES</th>
	<th class="text-center" colspan="4" rowspan="2">UPLOAD</th>
</tr> -->
<tr>
    <th>DATE</th>
    <th>TS</th>
    <th>T4</th>
    <th>TSH</th>
    <th>UPLOAD</th>
  </tr>
  
  
  <%
			int count1 = 0;
            String color1 = "#f5f5f5";
         
            if (!thyroidTable.isEmpty()) 
           {          
                Iterator itr = thyroidTable.iterator();
                while (itr.hasNext()) 
                {
               	    if ((count1 % 2) == 0) 
                    {
                	   /*   color = "#eeffee";*/
                        color1 = "#f5f5f5";
                        
                        
                    } 
                    count1++;
                    ArrayList pList = (ArrayList) itr.next();
			%>
			
			
			<tr style="background-color:<%=color1%>;" >
	               <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
	                <td><%=pList.get(2)%></td>
	                <td><%=pList.get(3)%></td>
	                <td><%=pList.get(4)%></td>
	                <td><%=pList.get(5)%></td>
	               <%--  <td><%=pList.get(6)%></td>
	                <td><%=pList.get(7)%></td> --%>
	                <%-- <td><%=pList.get(8)%></td>
	                <td><%=pList.get(9)%></td>
	                <td><%=pList.get(10)%></td>
	                <td><%=pList.get(11)%></td>
	                 <td><%=pList.get(12)%></td>
	                <td><%=pList.get(13)%></td> --%>
	                
	                   <%
     	                if(pList.get(8)==null)
     	                {
     	                %>
     	                
     	                 <td><input type="file" name="thyroid<%=pList.get(1)%>" id="thyroid<%=pList.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,thyroid<%=pList.get(1)%>.value,patinetID.value,'ThyroidFunctionTest')" value="save" class="btn btn-primary" ></td>
     	                
     	                
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(10)%>&fieldname=<%=pList.get(9)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %>
	                
	                
	                
	                
	                
	               
	             
	            </tr>
	            <%
                    }
                }
			  %>
  


 
 </table>
 </div>
      <%
 if(accessrole==1)
 {
	 %> 
	
	
	<%
	 
 }
 else
 {
 %>
 <br><input type="button" class="btn btn-primary" onclick="insRow('thyroidTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('thyroidfunction')" id="thyroidfunction" value="Save Row" /><br><br>
 <%
 }
 
 %>
	 
	 
	 
	 
	<%	 
	 }
	 %>
	 
	 
	 
	 
	 
	 
	 <!--------------------------------------------------------------------------------------------------------------------------------->
	 
	 
	 
	 
	 
	 
	 <br><h4><u><b>OTHER TEST</b></u></h4>
	 
	 
	 <%
	 if(InvTestTable.isEmpty())
	 {
	 %>
	 <div id="otherID">
	  <table border="1px" id="otherTestTable">
	         <tr>
				<th class="text-center" colspan="4" >OTHER TEST</th>			
			</tr>
			
			
			<tr>
	                <td><input type="text" name="other1" id="other1" class="input_table_170px" maxlength="25" ></td>
	                <td><input type="text" name="other2" id="other2" class=input_table_170px maxlength="25" ></td>
	                <td><input type="text" name="other3" id="other3" class=input_table_170px maxlength="25" ></td>
	                <td><input type="text" name="other4" id="other4" class=input_table_170px maxlength="25" ></td>               
	             
	       </tr>
	            
	    
	</table>
	</div>
	
	 <%
	 if(accessrole==1)
	 {
	 %>

	<%		 
	 }
	 else
	 {
	%>
	 <br><input type="button" class="btn btn-primary" onclick="insRow('otherTestTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" id="othertest" onclick="saveTable('othertest')" value="Save Row" /><br><br>  
	
	<%
	 }
	 %> 
	
	
     <%
	 }
	 else
	 {
     %>
     
     <div id="otherID">
	  <table border="1px" id="otherTestTable">
	         <tr>
				<th class="text-center" colspan="4" >OTHER TEST</th>
				<th class="text-center" colspan="4" >Upload</th>			
			</tr>
			<%
					int count2 = 0;
		            String color2 = "#f5f5f5";
		         
		            if (!InvTestTable.isEmpty()) 
		           {          
		                Iterator itr = InvTestTable.iterator();
		                while (itr.hasNext()) 
		                {
		               	    if ((count2 % 2) == 0) 
		                    {
		                	   /*   color = "#eeffee";*/
		                        color2 = "#f5f5f5";
		                        
		                        
		                    } 
		                    count2++;
		                    ArrayList pList = (ArrayList) itr.next();		
			
			
			%>
			
			<tr style="background-color:<%=color2%>;" >
	               <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
	                <td><%=pList.get(2)%></td>
	                <td><%=pList.get(3)%></td> 
	                 <td><%=pList.get(4)%></td>
	                <td><%=pList.get(5)%></td>
	                
	                
	                 <%
	                if(pList.get(8)==null)
	                {
	                %>
	                 <td><input type="file" name="inves_other<%=pList.get(1)%>" id="inves_other<%=pList.get(1)%>"   class="uploadFile" value="Upload"/>
                	 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,inves_other<%=pList.get(1)%>.value,patinetID.value,'Other_Test')" value="save" class="btn btn-primary" ></td>
                   <%
	                }
	                else
	                {
	                %>
	                <td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(10)%>&fieldname=<%=pList.get(9)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
	                <%
	                }
	                %>               
	             
	       </tr>
	            
	               <%
                    }
                }
			  %>
			
			
			
			
		
	</table>
	</div>
	
	  <%
	 if(accessrole==1)
	 {
	 %>

	<%		 
	 }
	 else
	 {
	%>
	 <br><input type="button" class="btn btn-primary" onclick="insRow('otherTestTable')" value="Insert row">
	 <input type="button"  class="btn btn-primary" id="othertest" onclick="saveTable('othertest')" value="Save Row" /><br><br>  
	
	<%
	 }
	 %> 
	
     
     <%
	 }
	 %>
	 
	
	
	
	</div><br>
	
	
	 <%
	 if(accessrole==1)
	 {
	 %>

	<%		 
	 }
	 else
	 {
	%>
      <input type="button" class="btn btn-primary " id="p_invesitigationSubmit"  value="submit">
	<%
	 }
	 %> 
	
	
	 
		
</form>
	<!--  </div>   -->   
      </div>       
             	
  <!------------------------------------ Tab 1 End ------------------------------------------------->
  
  <!------------------------------------ Tab 2 Start------------------------------------------------>             
      <br>      
 <div role="tabpanel" class="tab-pane" id="tab2" style="height: 1135px; width: 1000px;"> 
  <script type="text/javascript">  
  <%
  if(accessrole==1)
  {
  %>
  $(document).ready(function () {
      $("#p_serologyForm *").prop("disabled", true);
  });
  
  <%
	  
  }
  
  
  %>
  
  
       function sero()
       {
    	  
    	   <%
    	   in = iDB.SelectIves_Main(PID);
   	    	sb = iDB.selectSerotab(PID);
    	   
    	   %>
    	   $('#sero').load(' #sero');
       }
         </script> 
 
  <!-- <div class="scroll"> -->
  <form method="post" id="p_serologyForm" >
  	 
      <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
     <input type="hidden"  name="Serology_updatedby" id="Serology_updatedby" value="<%=session.getAttribute("name")%>" required>
     <input type="hidden"  name="Serology_updatedtime" id="Serology_updatedtime" value="<%=lastAccessed%>" required>          
          <!-- <h4><u><b>SEROLOGY</b></u></h4>  -->
          <div id="sero">
          
           <input type="hidden" name="se_patinetID" id="se_patinetID" value=<%=sb.getPatientID() %>>    
      <input type="hidden"  name="tab2_updateflag" id="tab2_updateflag" value=<%=sb.getTab2_updateflag() %> required>
          <!-- <label class="col-md-2 col-sm-2 control-label"></label>    -->
    <%--   <table id="serology">
	       <tr>
				<th class="text-center" >HIV</th>
				<th class="text-center" >HBsAg</th>
				<th class="text-center" >HCV</th>
			</tr>
			<tr>
		    <td>
			    <select name="hiv" class="input_table_DD">
					    <option value="">select</oprion>
					    <option value="POSITIVE"<%=sb.getHiv().equals("POSITIVE")?"selected":""%>>POSITIVE</option>
					    <option value="NEGATIVE"<%=sb.getHiv().equals("NEGATIVE")?"selected":""%>>NEGATIVE</option>
			    </select>
			   	</td>
			    <td> 
			     <select name="hbsAg" class="input_table_DD">
					    <option value="">select</oprion>
					    <option value="POSITIVE" <%=sb.getHbsAg().equals("POSITIVE")?"selected":""%>>POSITIVE</option>
					    <option value="NEGATIVE"<%=sb.getHbsAg().equals("NEGATIVE")?"selected":""%>>NEGATIVE</option>
			     </select>
			    </td>
			    <td> 
			     <select name="hcv" class="input_table_DD">
					    <option value="">select</oprion>
					    <option value="POSITIVE" <%=sb.getHcv().equals("POSITIVE")?"selected":""%> >POSITIVE</option>
					    <option value="NEGATIVE" <%=sb.getHcv().equals("NEGATIVE")?"selected":""%>>NEGATIVE</option>
			     </select>
			    </td>
			</tr>
	</table><br> --%> 
	
 
	
	
	<%
	if(TumorMArker.isEmpty())
    {
		
	
	 %>
	   <h4><u><b>TUMOR MARKER</b></u></h4>
	 <div id="tu_id">
	<table id="tumor_marker"	  border="1px">
	
	
	<tbody>
	       <tr>
				<th class="text-center" >SERIAL NUMBER</th>
				<th class="text-center" >TUMOR MARKER</th>
				<th class="text-center" >VALUE</th>
				<!-- <th class="text-center" >UPLOAD FILE</th> -->
		</tr>
		
		
			<tr>
	                <td><input type="text" name="seri_number" id="seri_number" class="input_table_170px" maxlength="25" ></td>
	                <td><input type="text" name="tumor_number" id="tumor_number" class=input_table_170px ></td>
	                <td><input type="text" name="value" id="value" class=input_table_170px  ></td> 
	                
	         </tr>
	      
	
	  </table> 
	   </div>
	  	
	  	<%
	  	if(accessrole==1)
	  	{
	  	%>
		  	 
		 <%	  		
	  	}
	  	else
	  	{
	  	%>
	  	
	  	 <br><input type="button" class="btn btn-primary" onclick="insRow('tumor_marker')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('Tumor_markers')" id="Tumor_markers" value="Save Row" /><br><br>
	
	  	<%
	  		
	  	}
	  	%>
	  	
	<%
		
    }
	else
	{
		
		
    %>
     <h4><u><b>TUMOR MARKER</b></u></h4>
     
    <div id="tu_id">
	<table id="tumor_marker"  border="1px">
	
	
	<tbody>
	       <tr>
				<th class="text-center" >SERIAL NUMBER</th>
				<th class="text-center" >TUMOR MARKER</th>
				<th class="text-center" >VALUE</th>
				<th class="text-center" >UPLOAD FILE</th>
		</tr>
		
		<%
			int count5 = 0;
         String color5 = "#f5f5f5";      
         if (!TumorMArker.isEmpty()) 
        {          
             Iterator itr = TumorMArker.iterator();
             while (itr.hasNext()) 
             {
            	    if ((count5 % 2) == 0) 
                 {
             	   /*   color = "#eeffee";*/
                     color5 = "#f5f5f5";
                 } 
                 count5++;
                 ArrayList pList = (ArrayList) itr.next();
                 
 			    
 			  
                 %>
     			<tr style="background-color:<%=color5%>;" >
     			  <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
     	                <td><%=pList.get(2)%></td>
     	                <td><%=pList.get(3)%></td>
     	                <td><%=pList.get(4)%></td>
     	              
     	                
     	               <%             
     	                if(pList.get(8)==null)
     	                {
     	                %>

     	                	 <td><input type="file" name="tumor<%=pList.get(1)%>" id="tumor<%=pList.get(1)%>"   class="uploadFile" value="Upload"/>
     	                	 <input type="button" onclick="SaveImg(rowId<%=pList.get(1)%>.value,tumor<%=pList.get(1)%>.value,se_patinetID.value,'Tumor_marker')" value="save" class="btn btn-primary" ></td>
     	                 <%
     	                }
     	                else
     	                {
     	               	%>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(9)%>&fieldname=<%=pList.get(8)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                %> 
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>
     	 </tbody>
     	
     	  </table> 
     	   </div>
     	  
     	 <%
	  	if(accessrole==1)
	  	{
	  	%>
		  	
		
		 <%	  		
	  	}
	  	else
	  	{
	  	%>
	  	
	  	 <br><input type="button" class="btn btn-primary" onclick="insRow('tumor_marker')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('Tumor_markers')" id="Tumor_markers" value="Save Row" /><br><br>
	  	
	  	<%
	  		
	  	}
	  	%>
         
     	<%
     	}
	
     	%>
     	
     	
     	<!-----------------------------------------Cytology Start------------------------------------------------------------- -->
     	
     	
     	<%
	if(cyto_table.isEmpty())
    {
		
	
	 %>
	   <h4><u><b>CYTOLOGY</b></u></h4>
	 <div id="cytology_id">
	<table id="cytology" border="1px">
	
	
	<tbody>
	       <tr>
				<th class="text-center" >NUMBER</th>
				<th class="text-center" >DATE</th>
				<th class="text-center" >TYPE</th>
				<th class="text-center" >REMARKS</th>
				<th class="text-center" >GRADE</th>
				<!-- <th class="text-center" >UPLOAD FILE</th> -->
		</tr>
		
		
			<tr>
	                <td><input type="text" name="c1_num" id="c1_num" class="input_small_70px"></td>
	                <td><input type="date" name="c1_date" id="c1_date" class="input_table_170px" ></td>
	                <td><input type="text" list="type_list" name="c1_type" id="c1_type" onkeyup="getDiseaseType(this.value)" onchange='move("c1")' class="input_table_170px"></td>
	                <datalist id="type_list">	
     				<div id="DDDisplay">
               		</div>
               		<td><input type="text" name="c1_type_text" id="c1_type_text" class="input_table_170px" ></td>
	         		<td>
	         		<select id="c1_grade" name="c1_grade" class="input_table_DD">
		     			 <option value="">Select</option>
		     			 <option value="WELL DIFFERENTIATED">WELL DIFFERENTIATED</option>
		     			 <option value="MODERATELY DIFFERENTIATED">MODERATELY DIFFERENTIATED</option>
		     			 <option value="POORLY DIFFERENTIATED">POORLY DIFFERENTIATED</option>
     				</select>		
	         		</td>
	         </tr>
	      
	
	  </table> 
	   </div>
	  	
	  	<%
	  	if(accessrole==1)
	  	{
	  	%>
		  	 
		 <%	  		
	  	}
	  	else
	  	{
	  	%>
	  	
	  	 <br><input type="button" class="btn btn-primary" onclick="insRow('cytology')" value="Insert row">
	 <input type="button"  class="btn btn-primary" onclick="saveTable('Cytology_table')" id="Cytology_table" value="Save Row" /><br><br>
	
	  	<%
	  		
	  	}
	  	%>
	  	
	<%
		
    }
	else
	{
		
		
    %>
     <h4><u><b>CYTOLOGY</b></u></h4>
     
    <div id="cytology_id">
	<table id="cytology"  border="1px">
	
	
	<tbody>
	       <tr>
				<th class="text-center" >NUMBER</th>
				<th class="text-center" >DATE</th>
				<th class="text-center" >TYPE</th>
				<th class="text-center" >REMARKS</th>
				<th class="text-center" >GRADE</th>
		</tr>
		
		<%
		int count5 = 0;
         String color5 = "#f5f5f5";      
         if (!cyto_table.isEmpty()) 
        {          
             Iterator itr = cyto_table.iterator();
             while (itr.hasNext()) 
             {
            	    if ((count5 % 2) == 0) 
                 {
             	   /*   color = "#eeffee";*/
                     color5 = "#f5f5f5";
                 } 
                 count5++;
                 ArrayList pList = (ArrayList) itr.next();
                 
 			    
 			  
                 %>
     			<tr style="background-color:<%=color5%>;" >
     			  <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
     	                <td><%=pList.get(2)%></td>
     	                <td><%=pList.get(3)%></td>
     	                <td><%=pList.get(4)%></td>
     	                <td><%=pList.get(5)%></td>
     	                <td><%=pList.get(6)%></td>
     	              
     	                
     	               <%-- <%             
     	                if(pList.get(4)==null)
     	                {
     	                %>

     	                	 <td><input type="file" name="file<%=pList.get(1)%>" id="file<%=pList.get(1)%>"   class="uploadFile" value="Upload"/>
     	                	 <input type="button" onclick="SaveImg(rowId<%=pList.get(1)%>.value,file<%=pList.get(1)%>.value,se_patinetID.value,'Tumor_marker')" value="save" class="btn btn-primary" ></td>
     	                 <%
     	                }
     	                else
     	                {
     	               	%>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(9)%>&fieldname=<%=pList.get(8)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                %>  --%>
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>
     	 </tbody>
     	
     	  </table> 
     	   </div>
     	  
     	 <%
	  	if(accessrole==1)
	  	{
	  	%>
		  	
		
		 <%	  		
	  	}
	  	else
	  	{
	  	%>
	  	
	  	 <br><input type="button" class="btn btn-primary" onclick="insRow('cytology')" value="Insert row">
	    <input type="button"  class="btn btn-primary" onclick="saveTable('Cytology_table')" id="Cytology_table" value="Save Row" /><br><br>
	  	
	  	<%
	  		
	  	}
	  	%>
         
     	<%
     	}
	
     	%>
     	
     	
            
        <!-- -----------------------------------------End--------------------------------------------------------------------- -->     
             <%-- <h4><u><b>CYTOLOGY</b></u></h4> <br> 
              
            <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Number</label>  
     			<div class="col-md-2 ">
     			<input type="text" name="c1_num" id="c1_num" class="input_small_70px"  value="<%=sb.getC1_num() %>"  >		     
     			</div>			
     			<label align="center" class="col-md-2  control-label" align="right"> Date</label>  
     			<div class="col-md-3 col-sm-3">
     				<input type="date" name="c1_date" id="c1_date" class="input_table_170px"  value="<%=sb.getC1_date() %>"  >
     			</div>
     	     </div>
           </div><br>     
          
           
            <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Type</label>  
     			<div class="col-md-4 ">
     			<input type="text" list="type_list" name="c1_type" id="c1_type" onkeyup="getDiseaseType(this.value)" onchange='move("c1")' class="input_table_170px" value="<%=sb.getC1_type() %>" >	
     			<datalist id="type_list">	
     			<div id="DDDisplay">
                </div>
     		   </datalist>	     
     			</div>			 
     			<div class="col-md-2">
     				<input type="text" name="c1_type_text" id="c1_type_text" class="input_table_170px"  value="<%=sb.getC1_type_text() %>"  >
     			</div>			
     	     </div>
           </div><br>
           
           <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Grade</label>  
     			<div class="col-md-1 ">
     			<select id="c1_grade" name="c1_grade" class="input_table_DD">
     			<option value="">Select</option>
     			 <option value="WELL DIFFERENTIATED" <%=sb.getC1_grade().equals("WELL DIFFERENTIATED")?"selected":""%> >WELL DIFFERENTIATED</option>
     			 <option value="MODERATELY DIFFERENTIATED" <%=sb.getC1_grade().equals("MODERATELY DIFFERENTIATED")?"selected":""%>>MODERATELY DIFFERENTIATED</option>
     			 <option value="POORLY DIFFERENTIATED" <%=sb.getC1_grade().equals("POORLY DIFFERENTIATED")?"selected":""%>>POORLY DIFFERENTIATED</option>
     			
     			</select>		     
     			</div>			
     	     </div>
           </div><br>
           
        
        <%
        if(!sb.getC1_num().equals("") || !sb.getC1_date().equals("") || !sb.getC1_type().equals("") || !sb.getC1_type_text().equals("") || !sb.getC1_grade().equals(""))
        {
        %>
     	 
           <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Number</label>  
     			<div class="col-md-1 ">
     			<input type="text" name="c2_num" id="c1_num" class="input_small_70px"  value=<%=sb.getC2_num()%>>		     
     			</div>			
     			<label align="center" class="col-md-2  control-label" align="right"> Date</label>  
     			<div class="col-md-3 col-sm-3">
     				<input type="date" name="c2_date" id="c1_date" class="input_table_170px"  value="<%=sb.getC2_date() %>"  >
     			</div>
     	     </div>
           </div><br>     
              <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Type</label>  
     			<div class="col-md-4 ">
     			<input type="text" list="type_list" name="c2_type" id="c1_type" onkeyup="getDiseaseType(this.value)" onchange='move("c2")' class="input_table_170px" value="<%=sb.getC2_type() %>" >	
     			<datalist id="type_list">	
     			<div id="DDDisplay">
                 </div>
     			</datalist>	     
     			</div>			 
     			<div class="col-md-3">
     				<input type="text" name="c2_type_text" id="c2_type_text" class="input_table_170px"  value="<%=sb.getC2_type_text() %>"  >
     			</div>
     	     </div>
           </div><br>
           
           <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Grade</label>  
     			<div class="col-md-1 ">
     			<select id="c2_grade" name="c2_grade" class="input_table_DD">
     			 <option value="">Select</option>
     			 <option value="WELL DIFFERENTIATED" <%=sb.getC2_grade().equals("WELL DIFFERENTIATED")?"selected":""%> >WELL DIFFERENTIATED</option>
     			 <option value="MODERATELY DIFFERENTIATED" <%=sb.getC2_grade().equals("MODERATELY DIFFERENTIATED")?"selected":""%>>MODERATELY DIFFERENTIATED</option>
     			 <option value="POORLY DIFFERENTIATED" <%=sb.getC2_grade().equals("POORLY DIFFERENTIATED")?"selected":""%>>POORLY DIFFERENTIATED</option>
     			
     			</select>		     
     			</div>			
     	     </div>
           </div><br>
           
         <%
        }
        %> --%>
           
           
     <!-----------------------------------------Histopathology Start------------------------------------------------------------- -->
     	
     	
    <%
	if(histo_table.isEmpty())
    {
		
	
	 %>
	   <h4><u><b>HISTOPATHOLOGY</b></u></h4>
	 <div id="histo_id">
	<table id="histopathology" border="1px">
	
	
	<tbody>
	       <tr>
				<th class="text-center" >NUMBER</th>
				<th class="text-center" >DATE</th>
				<th class="text-center" >TYPE</th>
				<th class="text-center" >LAB NAME</th>
				<th class="text-center" >REMARKS</th>
				<th class="text-center" >GRADE</th>
				
				<!-- <th class="text-center" >UPLOAD FILE</th> -->
		</tr>
		
		
			<tr>
	                <td><input type="text" name="H1_num" id="H1_num" class="input_small_70px"></td>
	                <td><input type="date" name="H1_date" id="H1_date" class="input_table_170px" ></td>
	                <td><input type="text" list="type_list" name="H1_type" id="H1_type" onkeyup="getDiseaseType(this.value)" onchange='move("H1")' class="input_table_170px"></td>
	                <datalist id="type_list">	
     				<div id="DDDisplay">
               		</div>
               		<td><input type="text" name="H1_labname" id="H1_labname" class="input_table_170px" ></td>
               		<td><input type="text" name="H1_type_text" id="H1_type_text" class="input_table_170px" ></td>
	         		<td>
	         		<select id="H1_grade" name="H1_grade" class="input_table_DD">
		     			 <option value="">Select</option>
		     			 <option value="WELL DIFFERENTIATED">WELL DIFFERENTIATED</option>
		     			 <option value="MODERATELY DIFFERENTIATED">MODERATELY DIFFERENTIATED</option>
		     			 <option value="POORLY DIFFERENTIATED">POORLY DIFFERENTIATED</option>
     				</select>		
	         		</td>
	         </tr>
	
	  </table> 
	   </div>
	  	
	  	<%
	  	if(accessrole==1)
	  	{
	  	%>
		  	 
		 <%	  		
	  	}
	  	else
	  	{
	  	%>
	  	
	  	 <br><input type="button" class="btn btn-primary" onclick="insRow('histopathology')" value="Insert row">
	    <input type="button"  class="btn btn-primary" onclick="saveTable('Histopathology_table')" id="Histopathology_table" value="Save Row" /><br><br>
	
	  	<%
	  		
	  	}
	  	%>
	  	
	<%
		
    }
	else
	{
		
		
    %>
     <h4><u><b>HISTOPATHOLOGY</b></u></h4>
     
    <div id="histo_id">
	<table id="histopathology"  border="1px">
	
	
	<tbody>
	       <tr>
				<th class="text-center" >NUMBER</th>
				<th class="text-center" >DATE</th>
				<th class="text-center" >TYPE</th>
				<th class="text-center">LAB NAME</th>
				<th class="text-center" >REMARKS</th>
				<th class="text-center" >GRADE</th>
		</tr>
		
		<%
		int count5 = 0;
         String color5 = "#f5f5f5";      
         if (!histo_table.isEmpty()) 
        {          
             Iterator itr = histo_table.iterator();
             while (itr.hasNext()) 
             {
            	    if ((count5 % 2) == 0) 
                 {
             	   /*   color = "#eeffee";*/
                     color5 = "#f5f5f5";
                 } 
                 count5++;
                 ArrayList pList = (ArrayList) itr.next();
                 
 			    
 			  
                 %>
     			<tr style="background-color:<%=color5%>;" >
     			  <input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
     	                <td><%=pList.get(2)%></td>
     	                <td><%=pList.get(3)%></td>
     	                <td><%=pList.get(4)%></td>
     	                <td><%=pList.get(7)%></td>
     	                <td><%=pList.get(5)%></td>
     	                <td><%=pList.get(6)%></td>
     	              
     	                
     	               <%-- <%             
     	                if(pList.get(4)==null)
     	                {
     	                %>

     	                	 <td><input type="file" name="file<%=pList.get(1)%>" id="file<%=pList.get(1)%>"   class="uploadFile" value="Upload"/>
     	                	 <input type="button" onclick="SaveImg(rowId<%=pList.get(1)%>.value,file<%=pList.get(1)%>.value,se_patinetID.value,'Tumor_marker')" value="save" class="btn btn-primary" ></td>
     	                 <%
     	                }
     	                else
     	                {
     	               	%>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(9)%>&fieldname=<%=pList.get(8)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                %>  --%>
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>
     	 </tbody>
     	
     	  </table> 
     	   </div>
     	  
     	 <%
	  	if(accessrole==1)
	  	{
	  	%>
		  	
		
		 <%	  		
	  	}
	  	else
	  	{
	  	%>
	  	
	  	 <br><input type="button" class="btn btn-primary" onclick="insRow('histopathology')" value="Insert row">
	    <input type="button"  class="btn btn-primary" onclick="saveTable('Histopathology_table')" id="Histopathology_table" value="Save Row" /><br><br>
	  	
	  	<%
	  		
	  	}
	  	%>
         
     	<%
     	}
	
     	%> 
     	
     	
            
        <!-- -----------------------------------------End--------------------------------------------------------------------- -->    
           
           
           
           <%-- <h4><u><b>HISTOPATHOLOGY</b></u></h4> <br>   
                <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Number</label>  
     			<div class="col-md-1 ">
     			<input type="text" name="H1_num" id="H1_num" class="input_small_70px"  value="<%=sb.getH1_num() %>"  >		     
     			</div>			
     			<label align="center" class="col-md-2  control-label" align="right"> Date</label>  
     			<div class="col-md-3 col-sm-3">
     				<input type="date" name="H1_date" id="H1_date" class="input_table_170px"  value="<%=sb.getH1_date() %>"  >
     			</div>
     	     </div>
           </div><br>     
          
           
            <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Type</label>  
     			<div class="col-md-4 ">
     			<input type="text" list="type_list" name="H1_type" id="H1_type" onkeyup="getDiseaseType(this.value)" onchange='move("H1")' value="<%=sb.getH1_type() %>"    class="input_table_170px" >	
     			<datalist id="type_list">	
     			<div id="DDDisplay">
                 </div>
     		    </datalist>	     
     			</div>			 
     			<div class="col-md-3">
     				<input type="text" name="H1_type_text" id="H1_type_text" class="input_table_170px"  value="<%=sb.getH1_type_text() %>"  >
     			</div>
     	     </div>
           </div><br> 
           
            <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Grade</label>  
     			<div class="col-md-1 ">
     			<select id="H1_grade" name="H1_grade" class="input_table_DD">
     			 <option value="">Select</option>
     			 <option value="WELL DIFFERENTIATED" <%=sb.getH1_grade().equals("WELL DIFFERENTIATED")?"selected":""%>>WELL DIFFERENTIATED</option>
     			 <option value="MODERATELY DIFFERENTIATED" <%=sb.getH1_grade().equals("MODERATELY DIFFERENTIATED")?"selected":""%>>MODERATELY DIFFERENTIATED</option>
     			 <option value="POORLY DIFFERENTIATED" <%=sb.getH1_grade().equals("POORLY DIFFERENTIATED")?"selected":""%>>POORLY DIFFERENTIATED</option>
     			
     			</select>		     
     			</div>			
     	     </div>
           </div><br>   
           
          <%
           if(!sb.getH1_date().equals("") || !sb.getH1_num().equals("") || !sb.getH1_type().equals("") || !sb.getH1_type_text().equals("") || !sb.getH1_grade().equals(""))
           {
           %>
           <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Number</label>  
     			<div class="col-md-1 ">
     			<input type="text" name="H2_num" id="H2_num" class="input_small_70px"  value="<%=sb.getH2_num() %>"  >		     
     			</div>			
     			<label align="center" class="col-md-2  control-label" align="right"> Date</label>  
     			<div class="col-md-3 col-sm-3">
     				<input type="date" name="H2_date" id="H2_date" class="input_table_170px"  value="<%=sb.getH2_date() %>"  >
     			</div>
     	     </div>
           </div><br>     
          
           
            <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Type</label>  
     			<div class="col-md-4 ">
     			<input type="text" list="type_list" name="H2_type" id="H2_type" onkeyup="getDiseaseType(this.value)" onchange='move("H2")' class="input_table_170px" value="<%=sb.getH2_type() %>" >	
     			<datalist id="type_list">	
     			<div id="DDDisplay">
                 </div>
     		    </datalist>	     
     			</div>			 
     			<div class="col-md-3">
     				<input type="text" name="H2_type_text" id="H2_type_text" class="input_table_170px"  value="<%=sb.getH2_type_text() %>"  >
     			</div>
     	     </div>
           </div><br> 
           
            <div class="row"> 
               <div class="form-group" >
     			<label align="center" class="col-md-2 col-sm-2 control-label">Grade</label>  
     			<div class="col-md-1 ">
     			<select id="H2_grade" name="H2_grade" class="input_table_DD">
     			 <option value="">Select</option>
     			
     			 <option value="WELL DIFFERENTIATED" <%=sb.getH2_grade().equals("WELL DIFFERENTIATED")?"selected":""%>>WELL DIFFERENTIATED</option>
     			 <option value="MODERATELY DIFFERENTIATED" <%=sb.getH2_grade().equals("MODERATELY DIFFERENTIATED")?"selected":""%>>MODERATELY DIFFERENTIATED</option>
     			 <option value="POORLY DIFFERENTIATED" <%=sb.getH2_grade().equals("POORLY DIFFERENTIATED")?"selected":""%>>POORLY DIFFERENTIATED</option>
     			
     			</select>		     
     			</div>			
     	     </div>
           </div><br>  
           
            
         <% 
         }
         %>  --%>
           
           
            <h4><u><b>IMMUNO HISTO CHEMISTRY</b></u></h4>	
     		  
     		  
     		  <%
     		  if(Immuno.isEmpty())
     	         {
     			  %>
     			  <div id="im_id">	   
     	<table  id="immuno_histo" border="1PX"> 
     	 
     	 <tbody >
     		   <tr>
     			 <th class="text-center" >Serial Number</th>
     			 <th class="text-center" >Immuno Histo Chemical Maker</th>
     			 <th class="text-center" >Result</th>	 
     		  </tr>	
     		  
     		  
     		  
     		
     			<tr >
     	                <td><input type="text"  name="Seril_number" id="Seril_number" class="input_small_50px " maxlength="05"></td>
     	                <td><input type="text" name="immunoHistoMaker" id="immunoHistoMaker" class="input_table_170px" ></td>
     	                <td><input type="text" name="Result" id="Result" class="input_small_70px" ></td> 
     	               
     	         </tr>
     	          
     	 </tbody> 
     	 
        </table>  <br>
     	</div>

				<%				
			  	if(accessrole==1)
			  	{
		  		%>
		  	
			  	
			  	<%
			  		
			  	} 
			  	else
			  	{
			  	%>
			  	<input type="button" class="btn btn-primary" onclick="insRow('immuno_histo')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('Immuno')" id="Immuno" value="Save Row" /><br><br>
     	
			  	
			  	<%
			  	}
				 %>
				
				  		
       		
     			  
     			 <%
     	         }
     		  else
     		  {
     		  %>
     		  <div id="im_id">	   
     	<table  id="immuno_histo" border="1PX"> 
     	 
     	 <tbody >
     		   <tr>
     			 <th class="text-center"  >Serial Number</th>
     			 <th class="text-center" >Immuno Histo Chemical Maker</th>
     			 <th class="text-center" >Result</th>	 
     		  </tr>	
     		  
     		  
     		  
     		 <%
     			int count4 = 0;
              String color4 = "#f5f5f5";
           
              if (!Immuno.isEmpty()) 
             {          
                  Iterator itr = Immuno.iterator();
                  while (itr.hasNext()) 
                  {
                 	    if ((count4 % 2) == 0) 
                      {
                  	   /*   color = "#eeffee";*/
                          color4 = "#f5f5f5";
                      } 
                      count4++;
                      ArrayList pList = (ArrayList) itr.next();
     			%>
     			<tr style="background-color:<%=color4%>;" >
     			<input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
     	                <td><%=pList.get(0)%></td>
     	                <td><%=pList.get(1)%></td>
     	                <td><%=pList.get(2)%></td> 
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>
     	 </tbody> 
     	 
        </table>  <br>
     	</div>	   		
       		<%				
			  	if(accessrole==1)
			  	{
		  		%>
		  		
			  	<%
			  		
			  	}
			  	else
			  	{
			  	%>
			  	<input type="button" class="btn btn-primary" onclick="insRow('immuno_histo')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('Immuno')" id="Immuno" value="Save Row" /><br><br>
     	
			  	
			  	<%
			  	}
				 %>
     		  
     		  <%		  
     		  }
     		  		  
     		  %>
           
           
           <div class="row">
     	  <div class="form-group">
     	        <label align="center" class="col-md-2 col-sm-2 control-label">Impression</label>  
     			<div class="col-md-4 ">
     			<input type="text"  name="impression" id="impression"  class="input_table_170px" value="<%=in.getImpression() %>" >		     
     			</div>	
     			<label align="center" class="col-md-3 col-sm-2 control-label">Chromosomal Abberation</label>  
     			<div class="col-md-2 ">
     			<input type="text"  name="chrom_abb" id="chrom_abb"  class="input_table_170px" value="<%=in.getChrom_abb() %>" >		     
     			</div>			
     	  </div>
     	</div><br>
           
           
           
                
         </div>      
              
              <%				
			  	if(accessrole==1)
			  	{
		  		%>
		  		
			  	<%
			  		
			  	}
			  	else
			  	{
			  	%>
			    <br><input type="button" class="btn btn-primary " id="p_serologySubmit"  value="submit">    
     	
			  	
			  	<%
			  	}
				 %> 
             
               
               
         
       </form>        
       <!-- </div>  -->    
      </div>
     	
  <!------------------------------------ Tab 2 End ------------------------------------------------->
                  
                    
  <!---------------------------------------- Tab 3 Start ------------------------------------------->
     		 <div role="tabpanel" class="tab-pane" id="tab3"><br>
     		<!--  <div class="scroll"> -->
     		 <script type="text/javascript">        
     	       function immuno()
     	       {
     	    	  
     	    	   <%
     	    	   in = iDB.SelectIves_Main(PID);
     	   	    	sb = iDB.selectSerotab(PID);
     	    	   
     	    	   %>
     	    	   $('#immuno').load(' #immuno');
     	       }
              </script> 
     		 	
     		 <form method="post" id="immuno_tab">
     		  
              
                 <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
          <input type="hidden"  name="immuno_updatedby" id="immuno_updatedby" value="<%=session.getAttribute("name")%>" required>
          <input type="hidden"  name="immuno_updatedtime" id="immuno_updatedtime" value="<%=lastAccessed%>" required>  
     		<div id="immuno">
     		<input type="hidden" name="Tab3_patinetID" id="Tab3_patinetID" value= <%=in.getPatientID()%>  >  
              <input type="hidden"  name="updateflag" id="updateflag" value= <%=in.getTab3_updateflage() %>>		 
     		   <%--  <h4><u><b>IMMUNO HISTO CHEMISTRY</b></u></h4>	
     		  
     		  
     		  <%
     		  if(Immuno.isEmpty())
     	         {
     			  %>
     			  <div id="im_id">	   
     	<table  id="immuno_histo" border="1PX"> 
     	 
     	 <tbody >
     		   <tr>
     			 <th class="text-center"  >Serial Number</th>
     			 <th class="text-center" >Immuno Histo Chemical Maker</th>
     			 <th class="text-center" >Result</th>	 
     		  </tr>	
     		  
     		  
     		  
     		
     			<tr >
     	                <td><input type="text"  name="Seril_number" id="Seril_number" class="input_small_50px " maxlength="05"></td>
     	                <td><input type="text" name="immunoHistoMaker" id="immunoHistoMaker" class="input_table_170px" maxlength="25"></td>
     	                <td><input type="text" name="Result" id="Result" class="input_small_70px" maxlength="25"></td> 
     	               
     	         </tr>
     	          
     	 </tbody> 
     	 
        </table>  <br>
     	</div>	   		
       		<input type="button" class="btn btn-primary" onclick="insRow('immuno_histo')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('Immuno')" id="Immuno" value="Save Row" /><br><br>
     	
     			  
     			  <%
     	         }
     		  else
     		  {
     		  %>
     		  <div id="im_id">	   
     	<table  id="immuno_histo" border="1PX"> 
     	 
     	 <tbody >
     		   <tr>
     			 <th class="text-center"  >Serial Number</th>
     			 <th class="text-center" >Immuno Histo Chemical Maker</th>
     			 <th class="text-center" >Result</th>	 
     		  </tr>	
     		  
     		  
     		  
     		 <%
     			int count4 = 0;
              String color4 = "#f5f5f5";
           
              if (!Immuno.isEmpty()) 
             {          
                  Iterator itr = Immuno.iterator();
                  while (itr.hasNext()) 
                  {
                 	    if ((count4 % 2) == 0) 
                      {
                  	   /*   color = "#eeffee";*/
                          color4 = "#f5f5f5";
                      } 
                      count4++;
                      ArrayList pList = (ArrayList) itr.next();
     			%>
     			<tr style="background-color:<%=color4%>;" >
     	                <td><%=pList.get(0)%></td>
     	                <td><%=pList.get(1)%></td>
     	                <td><%=pList.get(2)%></td> 
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>
     	 </tbody> 
     	 
        </table>  <br>
     	</div>	   		
       		<input type="button" class="btn btn-primary" onclick="insRow('immuno_histo')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('Immuno')" id="Immuno" value="Save Row" /><br><br>
     	
     		  
     		  <%		  
     		  }
     		  		  
     		  %> --%>
     	
     	<%-- <div class="row">
     	  <div class="form-group">
     	        <label align="center" class="col-md-2 col-sm-2 control-label">Impression</label>  
     			<div class="col-md-4 ">
     			<input type="text"  name="impression" id="impression"  class="input_table_170px" value="<%=in.getImpression() %>" >		     
     			</div>	
     			<label align="center" class="col-md-3 col-sm-2 control-label">Chromosal Abberation</label>  
     			<div class="col-md-2 ">
     			<input type="text"  name="chrom_abb" id="chrom_abb"  class="input_table_170px" value="<%=in.getChrom_abb() %>" >		     
     			</div>			
     	  </div>
     	</div><br> --%>
     	
     	 <h4><u><b>ENDOSCOPY</b></u></h4>
     	 
     	 <%
     	 if(Endoscopy.isEmpty())
          {
     	 %>
     	  <div id="endo_id">	
     	 <table  id="endo" border="1px">
     	 <tbody> 
     		   <tr>
     			 <th class="text-center"  >DATE</th>
     			 <th class="text-center"  ></th>
     			 <th class="text-center"  ></th>				 
     		  </tr>	
     		 
     			<tr>  
     			   <td><input class="input_table_170px" type="date" name="endo_date" id="endo_date"></td>
     	                <td>
     	                <select class="input_table_DD" name="endo_select" id="endo_select"><option value="">Select</optio><option value="OGD">OGD</option> <option value="FOB">FOB</option><option value="COLONOSCOPY">COLONOSCOPY</option><option value="DL SCOPY">DL SCOPY</option> <option value="IDL">IDL</option> <option value="CYSTOCOPY">CYSTOCOPY</option><option value="ERCP">ERCP</option> </select>
     	                     	               
     	                </td>
     	               <!--  <td><input class="input_table_170px" type="TEXT" ></td> -->
                        <td><textarea  rows="4" cols="70" name="endo_text" id="endo_text"></textarea></td> 
     	               
     	         </tr>
     	          		  
     		  		  
     	</tbody>
        </table>
        </div><br>
        
            <%
            if(accessrole==1)
            {
            %>
            <!--  <input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('endo')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('endoscopy')" id="endoscopy" value="Save Row" /><br><br>
     	 -->
     	 
            
            
            <%
            }
            else
            {
           	%>
           	 <input type="button" class="btn btn-primary" onclick="insRow('endo')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('endoscopy')" id="endoscopy" value="Save Row" /><br><br>
     	
     	 
               
               
             <%	           	
            }
            %>
            
             
     	 
     	 <%
          }
     	 else
     	 {
     	 %>
     	  <div id="endo_id">	
     	 <table  id="endo" border="1px">
     	 <tbody> 
     		   <tr>
     			 <th class="text-center"  >DATE</th>
     			 <th class="text-center"  ></th>
     			 <th class="text-center"  ></th>
     			 <th class="text-center"  ></th>					 
     		  </tr>	
     		  <%
     			int count3 = 0;
              String color3 = "#f5f5f5";
           
              if (!Endoscopy.isEmpty()) 
             {          
                  Iterator itr = Endoscopy.iterator();
                  while (itr.hasNext()) 
                  {
                 	    if ((count3 % 2) == 0) 
                      {
                  	   /*   color = "#eeffee";*/
                          color3 = "#f5f5f5";
                      } 
                      count3++;
                      ArrayList pList1 = (ArrayList) itr.next();
     			%>
     			<tr style="background-color:<%=color3%>;" >
     			
     					<input type="hidden" name="rowId<%=pList1.get(1)%>" id="rowId<%=pList1.get(1)%>" value="<%=pList1.get(1)%>">
     	                <td><%=pList1.get(2)%></td>
     	                <td><%=pList1.get(3)%></td>
     	                <td><%=pList1.get(4)%></td> 
     	                
     	                
     	                 <%
     	                if(pList1.get(7)==null)
     	                {
     	                %>
     	                
     	                 <%-- <td><input type="file" name="file<%=pList1.get(1)%>" id="file<%=pList1.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(rowId<%=pList1.get(1)%>.value,file<%=pList1.get(1)%>.value,Tab3_patinetID.value,'Endoscopy')" value="save" class="btn btn-primary" ></td> --%>
     	                
     	                 <td><input type="file" name="endo<%=pList1.get(1)%>" id="endo<%=pList1.get(1)%>" value="Upload"/>
     	                 <input type="button" onclick="SaveImg(rowId<%=pList1.get(1)%>.value,endo<%=pList1.get(1)%>.value,Tab3_patinetID.value,'Endoscopy')" value="save" class="btn btn-primary" ></td>
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList1.get(0)%>&imgname=<%=pList1.get(9)%>&fieldname=<%=pList1.get(8)%>&rowno=<%=pList1.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %>
     	                
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>		  
     		  		  
     	</tbody>
        </table>
        </div><br>
        
            
              <%
            if(accessrole==1)
            {
            %>
            <!--  <input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('endo')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('endoscopy')" id="endoscopy" value="Save Row" /><br><br>
     	
     	  -->
            
            
            <%
            }
            else
            {
           	%>
           	 <input type="button" class="btn btn-primary" onclick="insRow('endo')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('endoscopy')" id="endoscopy" value="Save Row" /><br><br>
     	
     	 
               
               
             <%	           	
            }
            %>
     	 
     	 
     	 <%
     	 }
     	 %>
     	 
     	 
     	 
     	 
     	  <h4><u><b>CARDIAC INVESTIGATION</b></u></h4>
     	  
     	  <%
     	  if(cardiac.isEmpty())
     	  {
     	   %>
     	    <div id="card_id">
     	  
	     	  <table id="cardiac" border="1px">
	     	  	<tbody> 
     		   <tr>
     			 <th class="text-center"></th>
     			 <th class="text-center">Date</th>
     			 <th class="text-center">Remarks / Description</th>
     			 <!-- <th class="text-center">Upload Image</th> -->					 
     		  </tr>	
     		  
     		  <tr>  
     			   <td><select class="input_table_DD" name="cardiac_select" id="cardiac_select" >
     			       <option value="">Select</option>
     			       <option>ECG</option>
     			       <option>ECHO</option>
     			       </select></td>
     	           <td><input type="date" name="cardiac_date" id="cardiac_date" class="input_table_170px" ></td>
     	           <td><textarea  rows="4" cols="70" name="cardiac_desc" id="cardiac_desc"></textarea></td> 
     	               
     	         </tr>
     	         
     	         
     	         </tbody>
	     	  
	     	  
	     	  
	     	  </table>
	     	  
	     	  <%
	     	  if(accessrole==1)
	     	  {
	     		 %>
		     	  
		     	 <!--   <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('cardiac')" value="Insert row">
	     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('cardiac')" id="endoscopy" value="Save Row" /><br><br>
	     	  
		     	   -->
		     	  
		     	  <% 
	     		  
	     	  }
	     	  else
	     	  {
	     	  %>
	     	  
	     	   <br><input type="button" class="btn btn-primary" onclick="insRow('cardiac')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('cardiac')" id="endoscopy" value="Save Row" /><br><br>
     	  
	     	  
	     	  
	     	  <%     		  
	     	  }
	     	  %>
	     	  
	     	   
     	  
     	  </div>
     	   
     	   
     	   
     	   <%
     	  }
     	  else
     	  {
     	%>
     	
     	   <div id="card_id">
     	  
	     	  <table id="cardiac" border="1px">
	     	  	<tbody> 
     		   <tr>
     			 <th class="text-center"></th>
     			 <th class="text-center">Date</th>
     			 <th class="text-center">Remarks / Description</th>
     			  <th class="text-center">Upload</th>				 
     		  </tr>	
     		     <%
     			int count3 = 0;
              String color3 = "#f5f5f5";
           
              if (!cardiac.isEmpty()) 
             {          
                  Iterator itr = cardiac.iterator();
                  while (itr.hasNext()) 
                  {
                 	    if ((count3 % 2) == 0) 
                      {
                  	   /*   color = "#eeffee";*/
                          color3 = "#f5f5f5";
                      } 
                      count3++;
                      ArrayList pList = (ArrayList) itr.next();
                      
                     
     			%>
     			<tr style="background-color:<%=color3%>;" >
     			
     					<input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="1">
     	                <td><%=pList.get(2)%></td>
     	                <td><%=pList.get(3)%></td>
     	                <td><%=pList.get(4)%></td> 
     	                
     	                
     	                <%
     	                if(pList.get(5)==null)
     	                {
     	                %>
     	                
     	                 <td><input type="file" name="cardio<%=pList.get(1)%>" id="cardio<%=pList.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,cardio<%=pList.get(1)%>.value,Tab3_patinetID.value,'Cardiac_Investigation')" value="save" class="btn btn-primary" ></td>
     	                
     	                
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(7)%>&fieldname=<%=pList.get(6)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %> 
     	                
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>	
     	         
     	         
     	         </tbody>
	     	  
	     	  
	     	  
	     	  </table>
	     	  
	     	   
	     	  <%
	     	  if(accessrole==1)
	     	  {
	     		 %>
		     	  
		    <!--  	   <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('cardiac')" value="Insert row">
	     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('cardiac')" id="endoscopy" value="Save Row" /><br><br>
	     	   -->
		     	  
		     	  
		     	  <% 
	     		  
	     	  }
	     	  else
	     	  {
	     	  %>
	     	  
	     	   <br><input type="button" class="btn btn-primary" onclick="insRow('cardiac')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('cardiac')" id="endoscopy" value="Save Row" /><br><br>
     	  
	     	  
	     	  
	     	  <%     		  
	     	  }
	     	  %>
	     	  
     	  
     	  </div>
     	
     	<%
     	  }
     	  %>
     	  
     	 
     	
     	</div> 
     	 	
     	 	<!-- <br><input type="button" class="btn btn-primary " id="inv_ImmunoSubmit"  value="submit">  -->
     		</form>   				  
     	     <!-- </div> -->
     	      </div>
   
   <!------------------------------------ Tab 3 End -------------------------------------------------> 
   
   
   <!---------------------------------------- Tab 4 Start ------------------------------------------>              
              <br>
     	     <div role="tabpanel" class="tab-pane tab-img" id="tab4">
     	            <h4><u><b>Imaging</b></u></h4><br>
     	             <script type="text/javascript">
     	             
     	            <% 
     	         
     	           if(accessrole==1)
     	           {
     	           %>
     	           $(document).ready(function () {
     	               $("#tab4_other_ivestigation *").prop("disabled", true);
     	           });
     	           
     	           <%
     	           }
     	           %>
     	             
     		       function others()
     		       {
     		    	  
     		    	   <%
     		    	   in = iDB.SelectIves_Main(PID);
     		   	    	sb = iDB.selectSerotab(PID);
     		    	   
     		    	   %>
     		    	   $('#others').load(' #others');
     		       }
              </script> 
     	       <!-- <div class="scroll">       -->
     		    <form method="post" name="tab4_other_ivestigation" id="tab4_other_ivestigation">         
     			    
     		         <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
          <input type="hidden"  name="others_updatedby" id="others_updatedby" value="<%=session.getAttribute("name")%>" required>
          <input type="hidden"  name="others_updatedtime" id="others_updatedtime" value="<%=lastAccessed%>" required>  
     		
     		<div id="others">
 		         <input type="hidden" name="Tab4_patinetID" id="Tab4_patinetID" value=<%=in.getPatientID() %>   >  
 		         <input type="hidden"  name="tab4_updateflag" id="tab4_updateflag" value=<%=in.getTab4_updateflag() %> >
 			<%--  <div class="row">
     			  <div class="form-group">
     			        <label  class="col-md-2 col-sm-2 control-label">X-Ray</label>  
     					<div class="col-md-2 ">
     					<textarea rows="2" cols="80" name="xray" id="xray"><%=in.getXray() %></textarea>		     
     					</div>							
     			  </div>
     			</div><br>
     			
     			 <div class="row">
     			  <div class="form-group">
     			        <label  class="col-md-2 col-sm-2 control-label">CT-Scan</label>  
     					<div class="col-md-2 ">
     					<textarea rows="2" cols="80" name="ctscan" id="ctscan"><%=in.getCtscan() %></textarea>		     
     					</div>							
     			  </div>
     			</div><br>
     			
     			 <div class="row">
     			  <div class="form-group">
     			        <label  class="col-md-2 col-sm-2 control-label">MRI/MCP</label>  
     					<div class="col-md-2 ">
     					<textarea rows="2" cols="80" name="mri_mcp" id="mri_mcp"><%=in.getMri_mcp() %></textarea>		     
     					</div>							
     			  </div>
     			</div><br>
     			
     			 <div class="row">
     			  <div class="form-group">
     			        <label  class="col-md-2 col-sm-2 control-label">Echo</label>  
     					<div class="col-md-2 ">
     					<textarea rows="2" cols="80" name="echo" id="echo"><%=in.getEcho() %></textarea>		     
     					</div>							
     			  </div>
     			</div><br>
     			
     			<div class="row">
     			  <div class="form-group">
     			        <label  class="col-md-2 col-sm-2 control-label">ECG</label>  
     					<div class="col-md-2 ">
     					<textarea rows="2" cols="80" name="ecg" id="ecg"><%=in.getEcg() %></textarea>		     
     					</div>							
     			  </div>
     			</div><br> --%>
     			
     			
     			<%
		     	  if(imgTable.isEmpty())
		     	  {
		     	   %>
     			
     			
     			
     			 <div id="image">
     	  
	     	  <table id="imaging_table" border="1px">
	     	  	<tbody> 
     		   <tr>
     			 <th class="text-center">Image Type</th>
     			 <th class="text-center">Date</th>
     			 <th class="text-center">Remarks / Description</th>
     			 <!-- <th class="text-center">Upload Image</th> -->					 
     		  </tr>	
     		  
     		  <tr>  
     			   <td><select class="input_table_DD" name="image_select" id="image_select" >
     			       <option value="">Select</option>
     			       <option>X-Ray</option>
     			       <option>MRI</option>
     			       <option>CT-Scan</option>
     			       <option>USG</option>
     			       <option>MAMMOGRAPHY</option>
     			       </select></td>
     	           <td><input type="date" name="image_date" id="image_date" class="input_table_170px" ></td>
     	           <td><textarea  rows="2" cols="30" name="image_desc" id="image_desc"></textarea></td> 
     	               
     	         </tr>
     	         
     	         
     	         </tbody>
	     	  
	     	  
	     	  
	     	  </table>
	     	  
	     	   <% 
     	           if(accessrole==1)
     	           {
     	        	  %>
     	        	<!--   <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('imaging_table')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('img')" id="endoscopy" value="Save Row" /><br><br>
     	   -->
       	          	
       	          	<%
     	        	   
     	           }
     	           else
     	           {
     	          	%>
     	          	<br><input type="button" class="btn btn-primary" onclick="insRow('imaging_table')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('img')" id="endoscopy" value="Save Row" /><br><br>
     	  
     	          	
     	          	<%
     	           }
     	           %>
	     	  
	     	  
	     	    
     	  
     	  </div>
     	  
     	  <%
     	  }
   			
     	  else
     	  {
     	  %>
     	  
     	   <div id="image">
     	  
	     	  <table id="imaging_table" border="1px">
	     	  	<tbody> 
     		   <tr>
     			 <th class="text-center">Image Type</th>
     			 <th class="text-center">Date</th>
     			 <th class="text-center">Remarks / Description</th>
     			<th class="text-center">Upload Image</th>
     		   </tr> 
     		
     		
     		<!-- <tr>  
     			   <td><select class="input_table_DD" name="image_select" id="image_select" >
     			       <option>Select</option>
     			       <option>X-Ray</option>
     			       <option>MRI</option>
     			       <option>CT-Scan</option>
     			       </select></td>
     	           <td><input type="date" name="image_date" id="image_date" class="input_table_170px" ></td>
     	           <td><textarea  rows="2" cols="30" name="image_desc" id="image_desc"></textarea></td> 
     	               
     	         </tr> -->
     	         
     	         <%
     			int count3 = 0;
              String color3 = "#f5f5f5";
           
              if (!imgTable.isEmpty()) 
             {          
                  Iterator itr = imgTable.iterator();
                  while (itr.hasNext()) 
                  {
                 	    if ((count3 % 2) == 0) 
                      {
                  	   /*   color = "#eeffee";*/
                          color3 = "#f5f5f5";
                      } 
                      count3++;
                      ArrayList pList = (ArrayList) itr.next();
                      
                      
     			%>
     			<tr style="background-color:<%=color3%>;" >
     			
     					<input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="<%=pList.get(1)%>">
     	                <td><%=pList.get(2)%></td>
     	                <td><%=pList.get(3)%></td>
     	                <td><%=pList.get(4)%></td> 
     	                
     	                
     	                <%
     	                if(pList.get(5)==null)
     	                {
     	                %>
     	                
     	                 <td><input type="file" name="img<%=pList.get(1)%>" id="img<%=pList.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,img<%=pList.get(1)%>.value,Tab3_patinetID.value,'X-Ray_CT_MRI')" value="save" class="btn btn-primary" ></td>
     	                
     	                
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(7)%>&fieldname=<%=pList.get(6)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %> 
     	                
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>	
     	      
     	         
     	         
     	         </tbody>
	     	  
	     	  
	     	  
	     	  </table>
	     	  
	     	     <% 
     	           if(accessrole==1)
     	           {
     	        	  %>
     	        	 <!--  <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('imaging_table')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('img')" id="endoscopy" value="Save Row" /><br><br>
     	   -->
       	          	
       	          	<%
     	        	   
     	           }
     	           else
     	           {
     	          	%>
     	          	<br><input type="button" class="btn btn-primary" onclick="insRow('imaging_table')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('img')" id="endoscopy" value="Save Row" /><br><br>
     	  
     	          	
     	          	<%
     	           }
     	           %>
     	  
     	  </div>
     	  
     	  
     	  
     	 <%	  
     	  }
     	 %>
     	 
     	 
     	 
     	 <legend>Nuclear Imaging</legend>
     	 
     	 
     	 <%
     	  if(nuclearTable.isEmpty())
     	  {
     	   %>
     	 
     	 <div id="nuc_table">
     	  
	     	  <table id="nuclear_table" border="1px">
	     	  	<tbody> 
     		   <tr>
     			 <th class="text-center">Image Type</th>
     			 <th class="text-center">Date</th>
     			 <th class="text-center">Remarks / Description</th>
     			 <!-- <th class="text-center">Upload Image</th> -->					 
     		  </tr>	
     		  
     		  <tr>  
     			   <td><select class="input_table_DD" name="nuclear_select" id="nuclear_select" >
     			        <option value="">Select</option>
     			       <option>PET SCAN</option>
     			       <option>BONE SCAN</option>
     			       <option>RENAL SCAN</option>
     			        <option>THYROID SCAN</option>
     			       <option>SENTINAL SCAN</option>
     			       <option>OTHERS</option>
     			       </select></td>
     	           <td><input type="date" name="nuclear_date" id="nuclear_date" class="input_table_170px" ></td>
     	           <td><textarea  rows="2" cols="30" name="nuclear_desc" id="nuclear_desc"></textarea></td> 
     	               
     	         </tr>
     	         
     	         
     	         </tbody>
	     	  
	     	  </table>
	     	  
	     	   <% 
   	           if(accessrole==1)
   	           {
   	           %>
   	          <!--  <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('nuclear_table')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('nuclear')" id="endoscopy" value="Save Row" /><br><br>
     	   -->
   	           
   	           
   	           <%   
   	           }
   	           else
   	           {
   	        	%>
   	        	<br><input type="button" class="btn btn-primary" onclick="insRow('nuclear_table')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('nuclear')" id="endoscopy" value="Save Row" /><br><br>
     	  
    	        <% 
   	           }
   	        	%>
	     	  
	     	    
     	  
     	  </div>
     	  
     	  <%
     	  }
     	  else
     	  {
     	 %>
     	 
     	  <div id="nuc_table">
     	  
	     	  <table id="nuclear_table" border="1px">
	     	  	<tbody> 
     		   <tr>
     			 <th class="text-center">Image Type</th>
     			 <th class="text-center">Date</th>
     			 <th class="text-center">Remarks / Description</th>
     			 <th class="text-center">Upload Image</th> 				 
     		  </tr>	
     		  
     		
     	         
     	         <%
     			int count3 = 0;
              String color3 = "#f5f5f5";
           
              if (!nuclearTable.isEmpty()) 
             {          
                  Iterator itr = nuclearTable.iterator();
                  while (itr.hasNext()) 
                  {
                 	    if ((count3 % 2) == 0) 
                      {
                  	   /*   color = "#eeffee";*/
                          color3 = "#f5f5f5";
                      } 
                      count3++;
                      ArrayList pList = (ArrayList) itr.next();
                      
                      
     			%>
     			<tr style="background-color:<%=color3%>;" >
     			
     					<input type="hidden" name="rowId<%=pList.get(1)%>" id="rowId<%=pList.get(1)%>" value="1">
     	                <td><%=pList.get(2)%></td>
     	                <td><%=pList.get(3)%></td>
     	                <td><%=pList.get(4)%></td> 
     	                
     	                
     	                <%
     	                if(pList.get(5)==null)
     	                {
     	                %>
     	                
     	                 <td><input type="file" name="nuclear<%=pList.get(1)%>" id="nuclear<%=pList.get(1)%>"   value="Upload"/>
     	                 <input type="button" onclick="SaveImg(<%=pList.get(1)%>,nuclear<%=pList.get(1)%>.value,Tab3_patinetID.value,'Nuclear_Image')" value="save" class="btn btn-primary" ></td>
     	                
     	                
     	                
     	                <%
     	                }
     	                else
     	                {
     	                %>
     	                	<td><input type="button" onClick="window.open('RetrieveImage.jsp?id=<%=pList.get(0)%>&imgname=<%=pList.get(7)%>&fieldname=<%=pList.get(6)%>&rowno=<%=pList.get(1)%>','mywindow','width=900px,height=800px')" value="view image"></td>
     	                <%
     	                }
     	                
     	                %> 
     	                
     	               
     	         </tr>
     	            <%
                      }
                  }
     			  %>	
     	      
     	         
     	         
     	         
     	         </tbody>
	     	  
	     	  
	     	  
	     	  </table>
	     	  
	     	    <% 
   	           if(accessrole==1)
   	           {
   	           %>
   	         <!--   <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('nuclear_table')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('nuclear')" id="endoscopy" value="Save Row" /><br><br>
     	   -->
   	           
   	           
   	           <%   
   	           }
   	           else
   	           {
   	        	%>
   	        	<br><input type="button" class="btn btn-primary" onclick="insRow('nuclear_table')" value="Insert row">
     	 	<input type="button"  class="btn btn-primary" onclick="saveTable('nuclear')" id="endoscopy" value="Save Row" /><br><br>
     	  
    	        <% 
   	           }
   	        	%>
     	  
     	  </div>
     	 
     	 <% 
     	  }
     	  %>
     		     			<br><div class="row">
     			  
     			        <label  class="col-md-2 col-sm-2 control-label"></label>  
     			    
     					<div class="col-md-6">
     					<table border="1px">
     					<tbody>
     						<tr>
     							<th colspan="2">Other Test</th>
     						</tr>
     						<tr>
     							<td><input name ="other_inv_1" id="other_inv_1" class="input_table_170px" value="<%=in.getOther_inv_1()%>"></td>
     							<td><input name ="other_inv_2" id="other_inv_2" class="input_table_170px" value="<%=in.getOther_inv_2()%>"></td>
     						</tr>
     						<tr>
     							<td><input name ="other_inv_3" id="other_inv_3" class="input_table_170px" value="<%=in.getOther_inv_3() %>" ></td>
     							<td><input name ="other_inv_4" id="other_inv_4" class="input_table_170px" value="<%=in.getOther_inv_4()%>"></td>
     						</tr>
     						<tr>
     							<td><input name ="other_inv_5" id="other_inv_5" class="input_table_170px" value="<%=in.getOther_inv_5()%>"></td>
     							<td><input name ="other_inv_6" id="other_inv_6" class="input_table_170px" value="<%=in.getOther_inv_6()%>"></td>
     						</tr>
     					
     					</tbody>
     					
     					
     					</table>		     
     					</div>							
     			
     			</div><br>
     			
     			
     			<%-- <%
     			
     			System.out.print(in.getTreatment_policy());
     			%> --%>
     			<div class="row">
     			  <div class="form-group">
     			        <label  class="col-md-2 col-sm-2 control-label required">Treatment Policy</label>  
     					<div class="col-md-2 ">
     					<select name = "treatment_policy" id="treatment_policy" class="input_table_DD" required>
     						<option value="">Select</option>
     						<option value="CURATIVE" <%=in.getTreatment_policy().equals("CURATIVE")?"selected":""%>>CURATIVE</option>	
     						<option value="PALLIATIVE" <%=in.getTreatment_policy().equals("PALLIATIVE")?"selected":""%>>PALLIATIVE</option>				
     					
     				     </select>		     
     					</div>							
     			  </div>
     			</div><br>
     		         
     		         
     		         
     		     </div>     
     		         
     		            <% 
   	           if(accessrole==1)
   	           {
   	           %>
   	          <!--  <br><input type="button" disabled="disabled" class="btn btn-primary" onclick="insRow('nuclear_table')" value="Insert row">
     	 	<input type="button" disabled="disabled"  class="btn btn-primary" onclick="saveTable('nuclear')" id="endoscopy" value="Save Row" /><br><br>
     	   -->
   	           
   	           
   	           <%   
   	           }
   	           else
   	           {
   	        	%>
   	        	   <br><input type="button" class="btn btn-primary " id="other_investigationSubmit"  value="submit"> 
     	  
    	        <% 
   	           }
   	        	%>
     		         
     		         
     		      
     		           
     		    </form>
     		  <!--  </div>   -->    
        
     		</div>
     
   <!------------------------------------ Tab 4 End ------------------------------------------------->   		
        
         </div>
     </div>
           
      
                 
                 
                 
             </div>
     	</div>
    
     </body>
     
    
     <!-- 
      <script type="text/javascript">
        document.querySelector("#myTabs").addEventListener('click',()=>{
        	
    	   document.body.scrollTop=0;
    	   
       }) 
      
     
      
      </script>  --> 

     <!-- <script src="js/Investifation.js"></script>
     <script src="js/InvestigationSave.js"></script>
      <script src="css/bootstrap/js/bootstrap.min.js"></script> -->
      
      
      
     <!-- script to view the page from first -->
      
 <script>
				$(document).ready(function(){
				  // Add smooth scrolling to all links
				  $("a").on('click', function(event) {
				    // Make sure this.hash has a value before overriding default behavior
				    if (this.hash !== "") {
				      // Prevent default anchor click behavior
				      event.preventDefault();
				
				      // Store hash
				      var hash = this.hash;
				
				      // Using jQuery's animate() method to add smooth page scroll
				      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
				      $('html, body').stop().animate({
				        scrollTop: $(hash).offset().top
				      }, 0)
				      
				      
				      
				      
				      /* , function(){
				   
				        // Add hash (#) to URL when done scrolling (default click behavior)
				        window.location.hash = hash;
				      }); */
				      
				      
				    } // End if
				  });
				});
</script>
      
      
      
     
     </html>
     
     
     			
     			
     			