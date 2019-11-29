<%@page import="com.HospitalEMR.ReadFile.web.readFile"%>
<%@page import="java.util.Date"%>
<%@page import="com.HospitalEMR.CaseHistory.web.Model.hiddenFieldBean"%>
<%@page import="com.HospitalEMR.patinentInfo.web.Model.TumorBean"%>
<%@page import="com.HospitalEMR.patinentInfo.web.Model.ReferralBean"%>
<%@page import="com.HospitalEMR.patinentInfo.web.Model.ClinicalBean"%>
<%@page import="com.HospitalEMR.patinentInfo.web.Dao.patinetInfoDB"%>
<%@page import="com.HospitalEMR.patinentInfo.web.Model.patientInfoBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%    
readFile f = new readFile();
String title = f.Title(request);


    //String P_id="3";
	String P_id=request.getParameter("p_id");  
	int patientID = Integer.parseInt(P_id);
	
	
	//String saccessrole="2";
	String saccessrole=request.getParameter("accessrole");
	int accessrole=Integer.parseInt(saccessrole);
	
	
	//System.out.println(accessrole);
	
	
	/* Beanclass*/
	patientInfoBean p = new patientInfoBean();
	ClinicalBean cb = new ClinicalBean();
	ReferralBean pr = new ReferralBean();
	TumorBean pt = new TumorBean();
	patinetInfoDB pd = new patinetInfoDB();	
	hiddenFieldBean hf = new hiddenFieldBean();
	
	
	if (patientID == 0)
	{
		p=pd.Selectdata(patientID);
		cb=pd.selectClinical(patientID);
		pr=pd.selectRef(patientID);	
		pt=pd.selectTumor(patientID);
		hf=pd.selectHiddenField(patientID);
	} 
	else
	{
		p=pd.Selectdata(patientID);
		cb=pd.selectClinical(patientID);
		pr=pd.selectRef(patientID);
		pt=pd.selectTumor(patientID);
		hf=pd.selectHiddenField(patientID);
    }
	
	
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="image/LOGO.png" type="image/gif">
<title>Demography</title>
<link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="all"> 
<link href="css/icon_display.css" rel="stylesheet" media="all"> 
 <link href="css/radio_button.css" rel="stylesheet">
 <link rel="stylesheet" href="css/my_design.css">
 
 <style type="text/css">
 
 

 
 .checkbox{
 
 zoom:2}
 
 
 #previewPicture
{
   
    width: 200px;
    height: 250px;
}

 </style>

 
 
 <!-- --------------------------Ajex to submit the form which has ID="patientinfo"----------------------------------->
  <script src="js/jquery.min.js"></script>
  
 <script type="text/javascript">
 
 
 history.pushState(null, null, location.href);
	window.onpopstate = function () 
	{
	    history.go(1);
	};
 
 
 
 
 
      $(document).ready(function (){   
        	
            var form = $('#patientinfo');            
            $("#p_infoID").click(function (){ 
            	
               $.ajax({
                    url: 'PatientInfo', //server url
                    type: 'POST',    //passing data as post method
                    dataType: 'json', // returning data as json 	           
                    data: form.serialize(),
                    success: function (json){
                    	
                    }
                }); 
               });
        });
         
        <!-- ---------------------form which has ID="clinicalstage"--------------------------------->
        
       $(document).ready(function (){   
        	//alert("clinical welocme");
            var form = $('#clinicalstage');            
            $("#clinicle_infoID").click(function (){ 
            	//alert("clinical After button");
               $.ajax({
                    url: 'ClinicalMain', //server url
                    type: 'POST',    //passing data as post method
                    dataType: 'json', // returning data as json 	           
                    data: form.serialize(),
                    success: function (pid) {
                      
                      
                        document.getElementById("Rp_id").value=pid[0];
                      
                        
                        document.getElementById("rf_sex").value=pid[1];
                        
                        
                        $('#myTabs li:nth-child(3) a').tab('show');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                       
                        	
                       
                    }
                }); 
               });
        }); 
 
       <!-- ----------------------- the form which has ID="referal"--------------------------------->
       
       /* $(document).ready(function (){   
        	//alert("referal welocme");
            var form = $('#referal');            
            $("#referral_sub").click(function (e){ 
            	//alert("referal After button");
            	e.preventDefault();
               $.ajax({
                    url: 'referralMain', //server url
                    type: 'POST',    //passing data as post method
                    dataType: 'json', // returning data as json 	           
                    data: form.serialize(),
                    success: function (json) {
                       
                      
                        document.getElementById("Tp_id").value=json[0];                        
                        document.getElementById("tb_sex").value=json[1];
                       
                        $('#myTabs li:nth-child(4) a').tab('show');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                         
                    }
                }); 
               });
        });  */
       
 <!-------------------------the form which has ID="tumor"--------------------------------->
       
      /*  $(document).ready(function (){   
        	//alert("tumor welocme");
            var form = $('#tumor');            
            $("#tumor_sub").click(function (){ 
            	//alert("tumor After button"); 
               $.ajax({
                    url: 'TumorMain', //server url
                    type: 'POST',    //passing data as post method
                    dataType: 'json', // returning data as json 	           
                    data: form.serialize(),
                    success: function (pid) {
                       
                                
                   	    var successUrl = "Case_History.jsp?PatientID="+pid[0]+"&accessrole="+pid[2]; // might be a good idea to return this URL in the successful AJAX call
                   	    
                   	    
                   	 
                   	    window.location.href = successUrl;
                      
                       
                        	
                       
                    }
                }); 
               });
        });  */
           
       	/* get the button value from clinical and concatenate */
       	
       	/* $(document)
				.ready(
						function() {

							$(
									'input[name=t1],input[name=t2],input[name=n1],input[name=n2],input[name=m1],input[name=m2]')
									.click(
											function() {

												t1 = $('input[name=t1]:checked')
														.val();

												if (t1 == undefined) {
													t1 = "";
												}

												t2 = $('input[name=t2]:checked')
														.val();

												if (t2 == undefined) {
													t2 = "";
												}
												n1 = $('input[name=n1]:checked')
														.val();
												if (n1 == undefined) {
													n1 = "";
												}
												n2 = $('input[name=n2]:checked')
														.val();
												if (n2 == undefined) {
													n2 = "";
												}
												m1 = $('input[name=m1]:checked')
														.val();
												if (m1 == undefined) {
													m1 = "";
												}
												m2 = $('input[name=m2]:checked')
														.val();
												if (m2 == undefined) {
													m2 = "";
												}

												concatenated_string = "T" + t1
														+ t2 + "N" + n1 + n2
														+ "M" + m1 + m2;
												//alert(concatenated_string);
												$("#stage").val(
														concatenated_string);

											});

       	
       	
       	
       	 */
       
		  /* to get the selected organ type and sub-type */
		  
		  function dis(id)
		  {
			 
			     var organ = $("select#diagnosis").val();
				        
				        $.get('Diag_type',
				        		{
				                organName : organ
				        },
				        function(response) 
				        {
			
				        var select = $('#sub_types');
				        select.find('option').remove();
				          $.each(response, function(index, value) {
				          $('<option>').val(value).text(value).appendTo(select);
				      });;
				        });
				     
		  }
		  
		  
		  
		 
		  function dis_organ()
		  {
			  //alert("working");
			  var organ = $("select#organ").val();
		       // alert(organ);
		        $.get('organTypeJson',
		        		{
		                organName : organ
		        },
		        function(response) 
		        {
	
		        var select = $('#subtypes');
		        select.find('option').remove();
		          $.each(response, function(index, value) {
		          $('<option>').val(value).text(value).appendTo(select);
		      });;
		        });
		  }
		
        
    </script>
     <script type="text/javascript">
     
     function check(a,b,c,d,e,f,g)
	 {
		
		 concatenated_string = "T" + a.value
			+ b.value + "N" + c.value + d.value
			+ "M" + e.value + f.value;			
	    $(g).val(concatenated_string);
	
	 }
     
     </script>
     
    
 <script>
 
 $(document).ready(function (){
<%

//String t="tabActive";
String t = request.getParameter("tabActive");
	
	if(t.equals("active"))
	{
%>
document.getElementById("tab1").className = "tab-pane active";
document.getElementById("tab2").className = "tab-pane ";

 
 <%}%>
 });
 
 
function Refferalsubmit()
{
	//alert("checking");
	
	var form = $('#referal');            
    /* $("#referral_sub").click(function (e){ 
    	//alert("referal After button");
    	e.preventDefault(); */
       $.ajax({
            url: 'referralMain', //server url
            type: 'POST',    //passing data as post method
            dataType: 'json', // returning data as json 	           
            data: form.serialize(),
            success: function (json) {
               
              
                document.getElementById("Tp_id").value=json[0];                        
                document.getElementById("tb_sex").value=json[1];
               
                $('#myTabs li:nth-child(4) a').tab('show');
                $('html, body').animate({ scrollTop: 0 }, 0);
                 
            }
       /*  });  */
       });
	}
 
 
 
 function TumorSubmit()
 {
	 var form = $('#tumor');   
	//alert("tumor submit");
        $.ajax({
             url: 'TumorMain', //server url
             type: 'POST',    //passing data as post method
             dataType: 'json', // returning data as json 	           
             data: form.serialize(),
             success: function (pid) {
            	
                         
            	    var successUrl = "Case_History.jsp?PatientID="+pid[0]+"&accessrole="+pid[2]; // might be a good idea to return this URL in the successful AJAX call
            	    
            	    
            	 
            	    window.location.href = successUrl;
               
                
                 	
                
             }
         }); 
      
 }
 
 
 </script>
  <style type="text/css">
 
}
  
  </style>
 
 
</head>
<body id="body">
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
         <!--  <li>
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
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <br>
    <br>
   
   

   
    <div class="container-fluid header-fixed">
    
     <a class="navbar-brand" href="Home_Page.jsp">
                    <img id="brand" src="image/EMR-1.jpg" width="260" height="75" alt="">
                </a>
                
		<ul  class="nav nav-tabs " role="tablist">
		<%
		if(patientID == 0)
		{
		%>
		  <li class="active"><a><img src="image/patine.png" width="80" data-toggle="tab"> Demography</a></li>
		  <li><a><img src="image/case_history.png" width="80" height="30"   ><figcaption>Case History</figcaption></a></li>
		  <li><a><img src="image/general_info.png" width="80" height="30"   ><figcaption>General Info</figcaption></a></li>
		  <li><a><img src="image/investigation.jpg" width="80" height="50"  ><figcaption>Investigation</figcaption></a></li>
		  <li><a><img src="image/Surgery.png" width="80" height="50" ><figcaption>Surgery</figcaption></a></li>
		  <li><a><img src="image/post_operative.png" width="80" height="30"  ><figcaption>Post Operative</figcaption></a></li>
		  <li><a><img src="image/chemo.png" width="80" height="50"  ><figcaption>Chemo</figcaption></a></li>
		  <li><a><img src="image/Radio_external.jpg" width="80" height="30"   ><figcaption>Radio-External</figcaption></a></li>
		 <li><a><img src="image/Radio_brachy.png" width="80" height="30"   ><figcaption>Radio-Brachy</figcaption></a></li>
		  <li><a ><img src="image/Radio_brachy.png" width="80" height="30"  data-toggle="tab" ><figcaption>Nuclear Therapy</figcaption></a></li>
		  <li><a><img src="image/FOLLOW-UP.png" width="80" height="30"   ><figcaption>Follow-ups</figcaption></a></li>
		
		
		<%	
		}
		else
		{
			/* if(p.getUpdateflag().equals("YES"))
			{ */
				
				
				%>
				  <li class="active"><a href="Demography.jsp?p_id=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>&tabActive=Inactive" class="thumbnail"><img src="image/patine.png" width="80"  data-toggle="tab"><figcaption> Demography</figcaption></a></li>
				  <li><a  href="Case_History.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/case_history.png" width="80" height="30"  data-toggle="tab" ><figcaption>Case History</figcaption></a></li>
				  <li><a  href="General_examination.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/general_info.png" width="80" height="30"   data-toggle="tab" ><figcaption>General Info</figcaption></a></li>
				  <li><a  href="Investigation.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/investigation.jpg" width="80" height="50" data-toggle="tab" ><figcaption>Investigation</figcaption></a></li>
				  <li><a  href="Surgery.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/Surgery.png" width="80" height="50" data-toggle="tab"><figcaption>Surgery</figcaption></a></li>
				  <li><a  href="Post_operative_period.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/post_operative.png" width="80" height="30" data-toggle="tab" ><figcaption>Post Operative</figcaption></a></li>
				  <li><a  href="Chemotherapy.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/chemo.png" width="80" height="50" data-toggle="tab" ><figcaption>Chemo</figcaption></a></li>
				  <li><a  href="RadiotherapyExternal.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/Radio_external.jpg" width="80" height="30"  data-toggle="tab" ><figcaption>Radio-External</figcaption></a></li>
				  <li><a  href="RadioBrachy.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/Radio_brachy.png" width="80" height="30"  data-toggle="tab" ><figcaption>Radio-Brachy</figcaption></a></li>
				  <li><a  href="Nuclear_therapy.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/Radio_brachy.png" width="80" height="30"  data-toggle="tab" ><figcaption>Nuclear Therapy</figcaption></a></li>
				  <li><a  href="Followup.jsp?PatientID=<%=p.getPatientID()%>&accessrole=<%=saccessrole%>"><img src="image/FOLLOW-UP.png" width="80" height="30"  data-toggle="tab" ><figcaption>Follow-ups</figcaption></a></li>
				
				<%
			}
		%>		 
		</ul>
		
		
		
		
		
	</div>
	<div class="container-fluid">
	<div class="row">
		<!-- <h1>Side Navigation Bar</h1> -->
		
        <div role="tabpanel">
            <div class=" col-md-2 col-sm-2 col-xm-2 col-lg-2 top">
           <div class="wrimagecard wrimagecard-topimage" > 
            
                <ul class="nav nav-pills brand-pills nav-stacked" id="myTabs" role="tablist" style="background-color: #C0C0C0;">
             <%
             //String tabID="tabActive";
             
               String tabID = request.getParameter("tabActive");
              
               
               if(tabID.equals("active"))
               {
               %> 
               
                
                 <li role="presentation" class="brand-nav active "><a href="#tab1" onclick="PatinetInfo();" aria-controls="tab1" role="tab" data-toggle="tab"><b>Patient Information</b></a></li>
                  <li role="presentation" class="brand-nav  "><a href="#tab2" onclick="clinical();" aria-controls="tab2" role="tab" data-toggle="tab"><b>Clinical Stage</b></a></li>
                  <li role="presentation" class="brand-nav"><a href="#tab3" onclick="referral();" aria-controls="tab3" role="tab" data-toggle="tab"><b>Referral Information</b></a></li>
                  <li role="presentation" class="brand-nav"><a href="#tab4" onclick="tumorBoardPolicy();" aria-controls="tab4" role="tab" data-toggle="tab"><b>Tumor Board Policy</b></a></li>
           			
           			<h4><u>Patient Information</u></h4>
           			<h4>Patient ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getP_id() %></h4>
           			<h4>Patient Name:<%=hf.getPname() %></h4>
           			<h4>Index No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getCd_no() %></h4>
				    <h4>Diagnosis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getDiagnosis()%></h4>
				    <h4>Organ Of Interest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getOrgan_of_interest()%></h4>
           <%
               }
               
               
               else if(tabID.equals("Search"))
               {
            	   %> 
                   
                   
                   <li role="presentation" class="brand-nav active "><a href="#tab1" onclick="PatinetInfo();" aria-controls="tab1" role="tab" data-toggle="tab"><b>Patient Information</b></a></li>
                    <li role="presentation" class="brand-nav  "><a href="#tab2" onclick="clinical();" aria-controls="tab2" role="tab" data-toggle="tab"><b>Clinical Stage</b></a></li>
                    <li role="presentation" class="brand-nav"><a href="#tab3" onclick="referral();" aria-controls="tab3" role="tab" data-toggle="tab"><b>Referral Information</b></a></li>
                    <li role="presentation" class="brand-nav"><a href="#tab4" onclick="tumorBoardPolicy();" aria-controls="tab4" role="tab" data-toggle="tab"><b>Tumor Board Policy</b></a></li>
             			
             		<h4><u>Patient Information</u></h4>
           			<h4>Patient ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getP_id()%></h4>
           			<h4>Patient Name:<%=hf.getPname() %></h4>
           			<h4>Index No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getCd_no() %></h4>
				    <h4>Diagnosis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getDiagnosis()%></h4>
				    <h4>Organ Of Interest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getOrgan_of_interest()%></h4>
             <%
            	   
               }
               else
               {
            	%>
            	<li role="presentation" class="brand-nav active "><a href="#tab1" onclick="PatinetInfo();" aria-controls="tab1" role="tab" data-toggle="tab"><b>Patient Information</b></a></li>
                  <li role="presentation" class="brand-nav"><a href="#tab2" onclick="clinical();" aria-controls="tab2" role="tab" data-toggle="tab"><b>Clinical Stage</b></a></li>
                  <li role="presentation" class="brand-nav"><a href="#tab3" onclick="referral();" aria-controls="tab3" role="tab" data-toggle="tab"><b>Referral Information</b></a></li>
                  <li role="presentation" class="brand-nav"><a href="#tab4" onclick="tumorBoardPolicy();" aria-controls="tab4" role="tab" data-toggle="tab"><b>Tumor Board Policy</b></a></li>
            	
            	   <h4><u>Patient Information</u></h4>
           			<h4>Patient ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getP_id() %></h4>
           			<h4>Patient Name:<%=hf.getPname() %></h4>
           			<h4>Index No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getCd_no() %></h4>
				    <h4>Diagnosis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getDiagnosis()%></h4>
				    <h4>Organ Of Interest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=hf.getOrgan_of_interest()%></h4>
            	
            	<%
               }
               
               
               if(!hf.getFileName().equals("")) {
            	   
               %>
               <div >
                <img class="size" src="Upload/<%=hf.getPatientID() %>/<%=hf.getFolderName()%>/<%=hf.getFileName()%>" id="previewPicture"/> 
               </div>   
               
               
            	<%   
               }
               %>   
               
                  
                
                </ul>
                
               
                </div>
            </div>
<div class="col-md-6 col-sm-6 col-xm-6 col-lg-6 tab-content1 demo"  >
   <div class="tab-content">
   
   
        
        <script type="text/javascript">
        <%      
        if(accessrole==1 && p.getUpdateflag().equals("YES"))
        {
        %>
        $(document).ready(function () {
        	
       
            $("#patientinfo *").prop("disabled", true);
        });
        
        <%
        }
        %>
        </script> 
        <br> 
     <div role ="tabpanel" class="tab-pane active" id="tab1"> 
			 
			 
			 
			 
			
			 
			   <script type="text/javascript">        
			       function PatinetInfo()
			       {
			    	  
			    	
			    	   $('#PatinetInfo').load(' #PatinetInfo');
			    	  
			       }
		
			     
			      
			         </script> 
			         
			           
     
     
      
         <form action="PatientInfo" name="patientinfo" id="patientinfo" method="post" 	>
          <%		    	   
			    	  
			    	   p=pd.Selectdata(patientID);
			    	   
			%>
	         <!-- hidden field  id="patientinfo"  -->
	         <input type="hidden" name="p_id" id="p_id" value=<%=patientID%>>
	         
	          <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
       	     <input type="hidden"  name="updatedby" id="updatedby" value="<%=session.getAttribute("name")%>" required>
       	     <input type="hidden"  name="updatedtime" id="updatedtime" value="<%=lastAccessed%>" required>      
	      
	       
         <div id="PatinetInfo">
         
          <input type="hidden"  name="updateflag" id="updateflag" value="<%=p.getUpdateflag()%>" required>
              <input type="hidden" name="sex_button" value="<%=p.getSex() %>" />
	        <%-- <input type="hidden" name="age_button" value="<%=p.getAge() %>" />  --%>
           
          <h3><u><b>Patient Information</b></u></h3><br>          
        
						
						<%
						if(!hf.getPname().equals("")) {
							
							
							if(hf.getFileName().equals("")){
								
							
						%>	
						
						<script>
						alert("you can upload Profile Picture...");
						</script>
						<input type="button" class="btn btn-primary" value="Open a Popup Window" onclick="window.open('UploadProfile.jsp?p_id=<%=patientID%>&accessrole=<%=accessrole%>','CaseHistory','titlebar=no,toolbar=no,scrollbars=yes,resizable=yes,top=100,left=100,width=500,height=500');">
						
							
						<%
						}
							
						} else {
					    %>
					    
					    <%
						}
						
						%>
          
                        <div class="row">
                                <label class="col-md-2 col-sm-3 control-label">HospitalName</label>  
								<div class="col-md-4 col-sm-4">
								  <select name="hospitalname" id="hospitalname"  class="form-control"  > 
								   		<option value="">Select</option>								   		
								   		  <option value="Bangalore Cancer Centre" <%=p.getHospitalname().equals("Bangalore Cancer Centre")?"selected":""%>>Bangalore Cancer Centre</option>
								   		<option value="Baptist Hospital" <%=p.getHospitalname().equals("Baptist Hospital")?"selected":""%>>Baptist Hospital</option>
								   		<option value="Fortis Hospital" <%=p.getHospitalname().equals("Fortis Hospital")?"selected":""%>>Fortis Hospital</option>
								   		<option value="Macs Clinic" <%=p.getHospitalname().equals("Macs Clinic")?"selected":""%>>Macs Clinic</option>
								   		<option value="Apollo Hospital" <%=p.getHospitalname().equals("Apollo Hospital")?"selected":""%>>Apollo Hospital</option>
								   		
								   		<option value="Shankara Hospital" <%=p.getHospitalname().equals("Shankara Hospital")?"selected":""%>>Shankara Hospital</option>
								   		<option value="Others" <%=p.getHospitalname().equals("Others")?"selected":""%>>Others</option>   

								   			
							     </select>
								</div>
					    </div>
					  	<br>  


									
	<div class="row"> 
       <div class="form-group " >
			<label class="col-md-2  control-label required">Protocol</label>  
			<div class="col-md-3 ">
			  <select name="secondprimary" class="form-control" required > 
			   		<option value=" ">Select</option>
				   	<option value="Inpatient"<%=p.getSecondprimary().equals("Inpatient")?"selected":""%>>Inpatient</option>
				   	<option value="Outpatient"<%=p.getSecondprimary().equals("Outpatient")?"selected":""%>>Outpatient</option>
			    
			     </select>
			</div>			
			<label class="col-md-2   control-label required" align="right"> Date of Admission</label>  
			<div class="col-md-3 ">
				<input type="date" name="dateofadmission" id="dateofadmission" class="form-control" maxlength="25" value="<%=p.getDateofadmission() %>"  >
			</div>
	  </div>
       </div> <br>
       
            
      <div class="row"> 
       <div class="form-group" >
			<label class="col-md-6 col-sm-4 control-label">Can we use your Data For Research Purpose..?</label>  
			<div class="col-md-3 col-sm-3">
			
			<%
			if(p.getPatient_agreement().equals("on"))
			{
			%>
			
			<input type="checkbox" checked="checked" name="patient_agreement" class="checkbox"  >
			<%
			}
			else
			{
			%>
			<input type="checkbox" name="patient_agreement" class="checkbox"  >		
			
			<%
			}
			%>
			
				
			</div>			
			
	  </div>
       </div> <br>
					  
					  
					  <div class="row"> 
					       <div class="form-group" >
								<label class="col-md-2 col-sm-2 control-label required">Name</label>  
								<div class="col-md-3 col-sm-3">
								 <input type="text" name="uname" id="uname" autocomplete="off" class="form-control" value="<%=p.getPname() %>" required>
								</div>
								
								<label class="col-md-2 col-sm-3 control-label required" align="right"> Patient Id</label>  
								<div class="col-md-3 col-sm-3">
								 <!-- cd:no   was changed to patiend ID -->
									<input type="text" name="cd_no" id="cd_no" class="form-control" value="<%=p.getCd_no()%>" required>
								</div>								
						  </div>
					  </div>  <br>
					  
					  
					  
					 
					  
					  
					  <div class="row"> 
					       <div class="form-group" >
								<label class="col-md-2 col-sm-2 control-label">Hospital No</label>  
								<div class="col-md-3 col-sm-3">
								 <input type="text" name="index_no" id="index_no" value="<%=p.getIndex_no()%>" class="form-control" >
								</div>
								
								<label class="col-md-2 col-sm-3 control-label required" align="right"> Age</label>  
								<div class="col-md-3 col-sm-3">
								
									<input type="number" name="age" id="age" class="form-control" value="<%=p.getAge()%>" required>
								</div>								
						  </div>
					  </div><br>
					  
					  
					 <div class="row"> 
					       <div class="form-group" >
								<label class="col-md-2 col-sm-2 control-label">Religion</label>  
								<div class="col-md-3 col-sm-3">
								 <input type="text" name="religion" id="religion" value="<%=p.getReligion() %>"  class="form-control" >
								</div>
								
											
						  </div>
					  </div><br>
					  
					  	
					 <div class = "row">
					 
					 
				            								                   
	                    <div class="form-group ">  
						    <label class="col-md-2 col-sm-2 control-label required">Sex</label>
						 <%
							if(p.getUpdateflag().equals("YES"))
							{
								if(p.getSex().equals("Male"))
								{
									 %>	
									 <div class="col-md-2 col-sm-2">											        
							         <button type="button" class="btn btn-primary button1" style="background-color:#d4d5d6"   id="Male" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;} ; sex_bg(this.value)" value="Male" >Male</button>
							         </div> 						         
							         
							          <div class="col-md-2 col-sm-2">											        
					         	      <button type="button" class="btn btn-primary button1" id="Female" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Female" <%=p.getSex().equals("Female")?"selected":""%>>Female</button>
					                  </div> 
					        
								         <div class="col-md-2 col-sm-2">											        
								          <button type="button" class="btn btn-primary button1"  id="Transgender" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Transgender" <%=p.getSex().equals("Transgender")?"selected":""%>>Transgender</button>
								        </div>   							         
							         <%									
								}
								if(p.getSex().equals("Female"))
								{
								%>
								 <div class="col-md-2 col-sm-2">											        
						         <button type="button" class="btn btn-primary button1"  id="Male" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;} ; sex_bg(this.value)" value="Male">Male</button>
						        </div> 
						        
						         <div class="col-md-2 col-sm-2">											        
						         	 <button type="button" class="btn btn-primary button1" style="background-color:#d4d5d6" id="Female" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Female" <%=p.getSex().equals("Female")?"selected":""%>>Female</button>
						        </div> 
						        
						         <div class="col-md-2 col-sm-2">											        
						          <button type="button" class="btn btn-primary button1"  id="Transgender" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Transgender" <%=p.getSex().equals("Transgender")?"selected":""%>>Transgender</button>
						        </div>  	
							    <%  
								}
								if(p.getSex().equals("Transgender"))
								{
								%>
								
								<div class="col-md-2 col-sm-2">											        
					         <button type="button" class="btn btn-primary button1"  id="Male" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;} ; sex_bg(this.value)" value="Male">Male</button>
					        </div> 
					        
					         <div class="col-md-2 col-sm-2">											        
					         	 <button type="button" class="btn btn-primary button1" id="Female" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Female" <%=p.getSex().equals("Female")?"selected":""%>>Female</button>
					        </div> 
					        
					         <div class="col-md-2 col-sm-2">											        
					          <button type="button" class="btn btn-primary button1" style="background-color:#d4d5d6"  id="Transgender" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Transgender" <%=p.getSex().equals("Transgender")?"selected":""%>>Transgender</button>
					        </div>  
								
								
							 <% 	
								}
							}
							else
							{
							%>
							
							 <div class="col-md-2 col-sm-2">											        
					         <button type="button" class="btn btn-primary button1"  id="Male" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;} ; sex_bg(this.value)" value="Male">Male</button>
					        </div> 
					        
					         <div class="col-md-2 col-sm-2">											        
					         	 <button type="button" class="btn btn-primary button1" id="Female" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Female" <%=p.getSex().equals("Female")?"selected":""%>>Female</button>
					        </div> 
					        
					         <div class="col-md-2 col-sm-2">											        
					          <button type="button" class="btn btn-primary button1"  id="Transgender" onclick="{document.patientinfo.sex_button.value=this.value;document.patientinfo;}; sex_bg(this.value)" value="Transgender" <%=p.getSex().equals("Transgender")?"selected":""%>>Transgender</button>
					        </div>  	
								 
							<%
							}
						 %>		
						</div>
					</div>
					
					<br>
											
					 <div class="row"> 
					       <div class="form-group" >	
								<label class="col-md-2 col-sm-2 control-label">Phone Number</label>  
								<div class="col-md-3 col-sm-3">
								 <input type="text" name="pnumber" id="pnumber" class="form-control" value="<%=p.getPhone_num()%>">
								</div>			
								<label class="col-md-2 col-sm-3 control-label">Occupation</label>  
								<div class="col-md-3 col-sm-3">
									<input type="text" name="ocu" id="ocu" class="form-control" value="<%=p.getOccupation()%>">
								</div>
						  </div>
					  </div> 
					  <br>
					  <div class="row">
						   <div class="form-group" >
						   <label class="col-md-2 col-sm-2 control-label">Address</label>
						   <div class="col-md-3 col-sm-3">
									<textarea name="add" id="add" rows="3" cols="60"><%=p.getAddress()%></textarea>
							</div>
						   
						   </div>	  
					  </div>
					  
					         
					  
					  <br>
					 <div class="row"> 
					       <div class="form-group" >
								<label class="col-md-2 col-sm-2 control-label required">Diagnosis</label>  
								<div class="col-md-3 col-sm-3">
								  <%-- <select name="diagnosis" id="diagnosis" onchange="dis('diagnosis')"  class="form-control" required> 
								   		<option value="">Select </option>								   		
								   		<option value="CARCINOMA" <%=p.getDiagnosis().equals("CARCINOMA")?"selected":""%>>CARCINOMA</option>
								   		<option value="SARCOMA" <%=p.getDiagnosis().equals("SARCOMA")?"selected":""%>>SARCOMA</option>
								   		<option value="OTHERS" <%=p.getDiagnosis().equals("OTHERS")?"selected":""%>>OTHERS</option>
							   </select>
							  
 --%>	
 								<input type="text" name="diagnosis" id="diagnosis"  onchange="dis('diagnosis')" class="form-control" value="<%=p.getDiagnosis()%>">
 							</div>
 

								<label class="col-md-2 col-sm-2 control-label required">Histology</label>  
								<div class="col-md-3 col-sm-3">
								  <select name="diagnosis_sub_types" id="sub_types" value="<%=p.getDiagnosis_sub_types() %>" class="form-control" required> 
								   		<option value="">Select </option>
								   		
								   		
									  	<option value="ADENOCARCINOMA" <%=p.getDiagnosis_sub_types().equals("ADENOCARCINOMA")?"selected":""%> >ADENOCARCINOMA</option>
									   	<option value="ANAPLASTIC CARCINOMA" <%=p.getDiagnosis_sub_types().equals("ANAPLASTIC CARCINOMA")?"selected":""%>>ANAPLASTIC CARCINOMA</option>
									   	<option value="BASAL CELL CARCINOMA" <%=p.getDiagnosis_sub_types().equals("BASAL CELL CARCINOMA")?"selected":""%>>BASAL CELL CARCINOMA</option>
									   	<option value="BONE SARCOMA" <%=p.getDiagnosis_sub_types().equals("BONE SARCOMA")?"selected":""%>>BONE SARCOMA</option>
									   	<option value="CARCINOMA" <%=p.getDiagnosis_sub_types().equals("CARCINOMA")?"selected":""%>>CARCINOMA</option>
									   	<option value="CHONDROSARCOMA" <%=p.getDiagnosis_sub_types().equals("CHONDROSARCOMA")?"selected":""%> >CHONDROSARCOMA</option>
									   	<option value="CHORIO CARCINOMA" <%=p.getDiagnosis_sub_types().equals("CHORIO CARCINOMA")?"selected":""%>>CHORIO CARCINOMA</option>
									   	<option value="EWINGS SARCOMA" <%=p.getDiagnosis_sub_types().equals("EWINGS SARCOMA")?"selected":""%>>EWINGS SARCOMA</option>									   	
									   	<option value="FOLLICULAR CARCINOMA" <%=p.getDiagnosis_sub_types().equals("FOLLICULAR CARCINOMA")?"selected":""%>>FOLLICULAR CARCINOMA</option>
									   	<option value="GASTRO INTESTINAL STROMAL TUMOUR" <%=p.getDiagnosis_sub_types().equals("GASTRO INTESTINAL STROMAL TUMOUR")?"selected":""%>>GASTRO INTESTINAL STROMAL TUMOUR</option>
									   	<option value="GERM CELL CARCINOMA" <%=p.getDiagnosis_sub_types().equals("GERM CELL CARCINOMA")?"selected":""%>>GERM CELL CARCINOMA</option>
									   	<option value="HEPATOCELLULAR CARCINOMA" <%=p.getDiagnosis_sub_types().equals("HEPATOCELLULAR CARCINOMA")?"selected":""%>>HEPATOCELLULAR CARCINOMA</option>
									   	<option value="HODGKINS LYMPHOMA" <%=p.getDiagnosis_sub_types().equals("HODGKINS LYMPHOMA")?"selected":""%>>HODGKINS LYMPHOMA</option>
									   	<option value="INFILTRATING DUCTAL CARCINOMA-NOS" <%=p.getDiagnosis_sub_types().equals("INFILTRATING DUCTAL CARCINOMA-NOS")?"selected":""%>>INFILTRATING DUCTAL CARCINOMA-NOS</option>
									   	<option value="LARGE CELL CARCINOMA" <%=p.getDiagnosis_sub_types().equals("LARGE CELL CARCINOMA")?"selected":""%>>LARGE CELL CARCINOMA</option>
									   	<option value="LEUKAEMIA" <%=p.getDiagnosis_sub_types().equals("LEUKAEMIA")?"selected":""%>>LEUKAEMIA</option>
									   	<option value="LOBULAR CARCINOMA" <%=p.getDiagnosis_sub_types().equals("LOBULAR CARCINOMA")?"selected":""%>>LOBULAR CARCINOMA</option>
									   	<option value="LYMPHOPROLIFERATIVE" <%=p.getDiagnosis_sub_types().equals("LYMPHOPROLIFERATIVE")?"selected":""%>>LYMPHOPROLIFERATIVE</option>
									   	<option value="MEDULLARY CARCINOMA" <%=p.getDiagnosis_sub_types().equals("MEDULLARY CARCINOMA")?"selected":""%>>MEDULLARY CARCINOMA</option>
									   	<option value="MELANOMA" <%=p.getDiagnosis_sub_types().equals("MELANOMA")?"selected":""%>>MELANOMA</option>
									   	<option value="MUCINOUS CYSTADENO CARCINOMA" <%=p.getDiagnosis_sub_types().equals("MUCINOUS CYSTADENO CARCINOMA")?"selected":""%>>MUCINOUS CYSTADENO CARCINOMA</option>
									   	<option value="MULTIPLE MYELOMA"<%=p.getDiagnosis_sub_types().equals("MULTIPLE MYELOMA")?"selected":""%>>MULTIPLE MYELOMA</option>									   	
									   	<option value="NEURO ENDOCRINE TUMOUR" <%=p.getDiagnosis_sub_types().equals("NEURO ENDOCRINE TUMOUR")?"selected":""%>>NEURO ENDOCRINE TUMOUR</option>
									   	<option value="NON -HODGKINS LYMPHOMA" <%=p.getDiagnosis_sub_types().equals("NON -HODGKINS LYMPHOMA")?"selected":""%>>NON -HODGKINS LYMPHOMA</option>
									   	<option value="NON-SEMINOMATOUS GERM CELL TUMOUR" <%=p.getDiagnosis_sub_types().equals("NON-SEMINOMATOUS GERM CELL TUMOUR")?"selected":""%>>NON-SEMINOMATOUS GERM CELL TUMOUR</option>
									   	<option value="OSTEOSARCOMA" <%=p.getDiagnosis_sub_types().equals("OSTEOSARCOMA")?"selected":""%>>OSTEOSARCOMA</option>
									   	<option value="PAPILLARY CARCINOMA" <%=p.getDiagnosis_sub_types().equals("PAPILLARY CARCINOMA")?"selected":""%>>PAPILLARY CARCINOMA</option>
									   	<option value="PAPILLARY CYSTADENO CARCINOMA" <%=p.getDiagnosis_sub_types().equals("PAPILLARY CYSTADENO CARCINOMA")?"selected":""%> >PAPILLARY CYSTADENO CARCINOMA</option>
									   	<option value="PLASMA CELL DYSCRASIAS" <%=p.getDiagnosis_sub_types().equals("PLASMA CELL DYSCRASIAS")?"selected":""%>>PLASMA CELL DYSCRASIAS</option>
									   	<option value="SEMINOMA" <%=p.getDiagnosis_sub_types().equals("SEMINOMA")?"selected":""%>>SEMINOMA</option>
									   	<option value="SMALL CELL CARCINOMA" <%=p.getDiagnosis_sub_types().equals("SMALL CELL CARCINOMA")?"selected":""%>>SMALL CELL CARCINOMA</option>
									   	<option value="SOFT TISSUE SARCOMA" <%=p.getDiagnosis_sub_types().equals("SOFT TISSUE SARCOMA")?"selected":""%>>SOFT TISSUE SARCOMA</option>
									   	<option value="SQUAMOUS CELL CARCINOMA" <%=p.getDiagnosis_sub_types().equals("SQUAMOUS CELL CARCINOMA")?"selected":""%>>SQUAMOUS CELL CARCINOMA</option>
							   </select>
								</div>		
								
								
								
								
											
								
						  </div>
					  </div> 
					  
					  
					  
					  <br>
					 <div class="row"> 
					       <div class="form-group" >
					       
					       
					      <label class="col-md-2 col-sm-3 control-label required">Organ of Interest</label>  
								<div class="col-md-3 col-sm-3">
							<select name="organ" id="organ" onchange="dis_organ('organ')" class="form-control" required>
		                        <option value="">Select Organ</option>
								<option value="HEAD AND NECK" <%= p.getOrgan_of_interest().equals("HEAD AND NECK")?"selected":""%>>HEAD AND NECK</option>
								
								<option value="GYNAECOLOGICAL" <%= p.getOrgan_of_interest().equals("GYNAECOLOGICAL")?"selected":""%>>GYNAECOLOGICAL</option>
								<option value="GASTRO INTESTINAL TRACT" <%= p.getOrgan_of_interest().equals("GASTRO INTESTINAL TRACT")?"selected":""%>>GASTRO INTESTINAL TRACT</option>
								<option value="GENITO URINARY" <%= p.getOrgan_of_interest().equals("GENITO URINARY")?"selected":""%>>GENITO URINARY</option>
								
								<option value="HEPATOPANCREATO BILIARY" <%=p.getOrgan_of_interest().equals("HEPATOPANCREATO BILIARY")?"selected":""%>>HEPATOPANCREATO BILIARY</option>
								<option value="SKIN MALIGNANCY" <%= p.getOrgan_of_interest().equals("SKIN MALIGNANCY")?"selected":""%>>SKIN MALIGNANCY</option>
								<option value="MUSCULOSKELETAL" <%= p.getOrgan_of_interest().equals("MUSCULOSKELETAL")?"selected":""%>>MUSCULOSKELETAL</option>
								<option value="LYMPHOMAS" <%= p.getOrgan_of_interest().equals("LYMPHOMAS")?"selected":""%>>LYMPHOMAS</option>
								<option value="LEUKEMIAS" <%= p.getOrgan_of_interest().equals("LEUKEMIAS")?"selected":""%>>LEUKEMIAS</option>
								<option value="MYELOMAS" <%= p.getOrgan_of_interest().equals("MYELOMAS")?"selected":""%>>MYELOMAS</option>
								<option value="UNASSIGNED" <%=p.getOrgan_of_interest().equals("UNASSIGNED")?"selected":""%>>UNASSIGNED</option>
								<option value="BRAIN" <%= p.getOrgan_of_interest().equals("BRAIN")?"selected":""%>>BRAIN</option>
								<option value="THROAX" <%= p.getOrgan_of_interest().equals("THROAX")?"selected":""%>>THROAX</option>
							</select>
								</div> 
		
		
							<label class="col-md-2 col-sm-2 control-label required">Histology</label>  
								<div class="col-md-3 col-sm-3">
								  <select name="organ_subtypes" id="subtypes" class="form-control" required>
						<option value="">Select Sub Types</option>		
						<!-- to set the subtype value to create the new form -->
						
						
						<option value="HEAD AND NECK - LARYNX" <%=p.getSub_type().equals("HEAD AND NECK - LARYNX")?"selected":""%> >HEAD AND NECK - LARYNX</option>						
						<option value="HEAD AND NECK - NASAL CAVITY" <%=p.getSub_type().equals("HEAD AND NECK - NASAL CAVITY")?"selected":""%> >HEAD AND NECK - NASAL CAVITY</option>
						<option value="HEAD AND NECK - EYE" <%=p.getSub_type().equals("HEAD AND NECK - EYE")?"selected":""%> >HEAD AND NECK - EYE</option>						
						<option value="HEAD AND NECK - EAR" <%=p.getSub_type().equals("HEAD AND NECK - EAR")?"selected":""%> >HEAD AND NECK - EAR</option>
						<option value="HEAD AND NECK - HYPOPHARYNX" <%=p.getSub_type().equals("HEAD AND NECK - HYPOPHARYNX")?"selected":""%>  >HEAD AND NECK - HYPOPHARYNX</option>						
						<option value="HEAD AND NECK - OROPHARYNX" <%=p.getSub_type().equals("HEAD AND NECK - OROPHARYNX")?"selected":""%>  >HEAD AND NECK - OROPHARYNX</option>
						<option value="HEAD AND NECK - NASOPHARYNX" <%=p.getSub_type().equals("HEAD AND NECK - NASOPHARYNX")?"selected":""%> >HEAD AND NECK - NASOPHARYNX</option>						
						<option value="HEAD AND NECK - PARANASAL SINUSES" <%=p.getSub_type().equals("HEAD AND NECK - PARANASAL SINUSES")?"selected":""%> >HEAD AND NECK - PARANASAL SINUSES</option>
						<option value="HEAD AND NECK - SALIVARY GLANDS" <%=p.getSub_type().equals("HEAD AND NECK - SALIVARY GLANDS")?"selected":""%>  >HEAD AND NECK - SALIVARY GLANDS</option>						
						<option value="HEAD AND NECK - ORAL CAVITY" <%=p.getSub_type().equals("HEAD AND NECK - ORAL CAVITY")?"selected":""%> >HEAD AND NECK - ORAL CAVITY</option>
						<option value="HEAD AND NECK - THYROID" <%=p.getSub_type().equals("HEAD AND NECK - THYROID")?"selected":""%> >HEAD AND NECK - THYROID</option>
						<option value="HEAD AND NECK - PARAPHARANGEAL SPACE TUMORS" <%=p.getSub_type().equals("HEAD AND NECK - PARAPHARANGEAL SPACE TUMORS")?"selected":""%> >HEAD AND NECK - PARAPHARANGEAL SPACE TUMORS</option>
						<option value="GYNAECOLOGICAL - UTERINE" <%=p.getSub_type().equals("GYNAECOLOGICAL - UTERINE")?"selected":""%>  >GYNAECOLOGICAL - UTERINE</option>
						<option value="GYNAECOLOGICAL - FALLOPIAN TUBE" <%=p.getSub_type().equals("GYNAECOLOGICAL - FALLOPIAN TUBE")?"selected":""%> >GYNAECOLOGICAL - FALLOPIAN TUBE</option>						
						<option value="GYNAECOLOGICAL - OVARIAN" <%=p.getSub_type().equals("GYNAECOLOGICAL - OVARIAN")?"selected":""%> >GYNAECOLOGICAL - OVARIAN</option>
						<option value="GYNAECOLOGICAL - CERVIX" <%=p.getSub_type().equals("GYNAECOLOGICAL - CERVIX")?"selected":""%>  >GYNAECOLOGICAL - CERVIX</option>						
						<option value="GYNAECOLOGICAL - VAGINA" <%=p.getSub_type().equals("GYNAECOLOGICAL - VAGINA")?"selected":""%>  >GYNAECOLOGICAL - VAGINA</option>
						<option value="GYNAECOLOGICAL - VULVA" <%=p.getSub_type().equals("GYNAECOLOGICAL - VULVA")?"selected":""%>  >GYNAECOLOGICAL - VULVA</option>						
						<option value="GASTRO INTESTINAL TRACT - ESOPHAGUS" <%=p.getSub_type().equals("GASTRO INTESTINAL TRACT - ESOPHAGUS")?"selected":""%> >GASTRO INTESTINAL TRACT - ESOPHAGUS</option>
						<option value="GASTRO INTESTINAL TRACT - STOMACH" <%=p.getSub_type().equals("GASTRO INTESTINAL TRACT - STOMACH")?"selected":""%> >GASTRO INTESTINAL TRACT - STOMACH</option>
						<option value="GASTRO INTESTINAL TRACT - COLORECTAL" <%=p.getSub_type().equals("GASTRO INTESTINAL TRACT - COLORECTAL")?"selected":""%> >GASTRO INTESTINAL TRACT - COLORECTAL</option>
						<option value="GASTRO INTESTINAL TRACT - ANAL" <%=p.getSub_type().equals("GASTRO INTESTINAL TRACT - ANAL")?"selected":""%> >GASTRO INTESTINAL TRACT - ANAL</option>						
						<option value="GENITO URINARY - KIDNEY" <%=p.getSub_type().equals("GENITO URINARY - KIDNEY")?"selected":""%> >GENITO URINARY - KIDNEY</option>
						<option value="GENITO URINARY - URINARY BLADDER" <%=p.getSub_type().equals("GENITO URINARY - URINARY BLADDER")?"selected":""%> >GENITO URINARY - URINARY BLADDER</option>
						<option value="GENITO URINARY - URETERS" <%=p.getSub_type().equals("GENITO URINARY - URETERS")?"selected":""%> >GENITO URINARY - URETERS</option>						
						<option value="GENITO URINARY - PROSTRATE" <%=p.getSub_type().equals("GENITO URINARY - PROSTRATE")?"selected":""%>  >GENITO URINARY - PROSTRATE</option>
						<option value="GENITO URINARY - TESTIS" <%=p.getSub_type().equals("GENITO URINARY - TESTIS")?"selected":""%>  >GENITO URINARY - TESTIS</option>
						<option value="GENITO URINARY - PENIS" <%=p.getSub_type().equals("GENITO URINARY - PENIS")?"selected":""%>  >GENITO URINARY - PENIS</option>
						
<%-- 						<option value="LUNG - NON SMALL CELL" <%=p.getSub_type().equals("LUNG - NON SMALL CELL")?"selected":""%>  >LUNG - NON SMALL CELL</option>
 --%>						<option value="HEPATOPANCREATO BILIARY - LIVER" <%=p.getSub_type().equals("HEPATOPANCREATO BILIARY - LIVER")?"selected":""%> >HEPATOPANCREATO BILIARY - LIVER</option>						
						<option value="HEPATOPANCREATO BILIARY - PANCREAS" <%=p.getSub_type().equals("HEPATOPANCREATO BILIARY - PANCREAS")?"selected":""%> >HEPATOPANCREATO BILIARY - PANCREAS</option>
						<option value="HEPATOPANCREATO BILIARY - GALL BLADDER" <%=p.getSub_type().equals("HEPATOPANCREATO BILIARY - GALL BLADDER")?"selected":""%> >HEPATOPANCREATO BILIARY - GALL BLADDER</option>
						<option value="HEPATOPANCREATO BILIARY - BILE DUCT" <%=p.getSub_type().equals("HEPATOPANCREATO BILIARY - BILE DUCT")?"selected":""%> >HEPATOPANCREATO BILIARY - BILE DUCT</option>
						<option value="HEPATOPANCREATO BILIARY - AMPULLA" <%=p.getSub_type().equals("HEPATOPANCREATO BILIARY - AMPULLA")?"selected":""%> >HEPATOPANCREATO BILIARY - AMPULLA</option>
						<option value="MUSCULOSKELETAL - SOFT TISSUE SARCOMA" <%=p.getSub_type().equals("MUSCULOSKELETAL - SOFT TISSUE SARCOMA")?"selected":""%>  >MUSCULOSKELETAL - SOFT TISSUE SARCOMA</option>
						<option value="MUSCULOSKELETAL - BONE TUMORS" <%=p.getSub_type().equals("MUSCULOSKELETAL - BONE TUMORS")?"selected":""%> >MUSCULOSKELETAL - BONE TUMORS</option>
						<option value="SKIN MALIGNANCY" <%=p.getSub_type().equals("SKIN MALIGNANCY")?"selected":""%> >SKIN MALIGNANCY</option>
						<option value="LYMPHOMAS" <%=p.getSub_type().equals("LYMPHOMAS")?"selected":""%> >LYMPHOMAS</option>
						<option value="LEUKEMIAS" <%=p.getSub_type().equals("LEUKEMIAS")?"selected":""%> >LEUKEMIAS</option>
						<option value="MYELOMAS" <%=p.getSub_type().equals("MYELOMAS")?"selected":""%> >MYELOMAS</option>
						<option value="UNASSIGNED" <%=p.getSub_type().equals("UNASSIGNED")?"selected":""%> >UNASSIGNED</option>
						<option value="BRAIN" <%=p.getSub_type().equals("BRAIN")?"selected":""%>>BRAIN</option>
						<option value="THROAX" <%=p.getSub_type().equals("THROAX")?"selected":""%> >THROAX</option>
						
					</select>
								</div>	
								
								
								
										
								
						  </div>
					  </div>
					  
					   <div class="row"> 
					       <div class="form-group" >
					       		 <label class="col-md-2 col-sm-3 control-label"></label>  
								<div class="col-md-3 col-sm-3">
									<input type="text" name="others" id="others" class="form-control" value="<%=p.getOthers() %>" onchange="load();" placeholder="others">
								</div>
					       
					       </div>
					       
					       </div>
					       
					       
					        
					  
					  
					  
		</div>	
		
		
		 <%      
        if(accessrole==1 && p.getUpdateflag().equals("YES"))
        {
        %>
      
        <%
        }
        else
        {
        %>
        
        	<input type="submit" class="btn btn-primary"  value="submit"> 
        
        <%
        }
		 
        %>		
       
        
         
		
		
		
				  
					 
					 <!--id="p_infoID"   <button  class="btn btn-primary" id="p_infoID"><span class="glyphicon glyphicon glyphicon-ok-sign"></span> Submit</button> -->
        </form>
     </div>
             
    
     <div role="tabpanel" class="tab-pane" id="tab2">
         
         <script type="text/javascript">
         <% 
        if(accessrole==1 && cb.getUpdateFlage().equals("YES"))
        {
        %>
        $(document).ready(function () {
            $("#clinicalstage *").prop("disabled", true);
        });
        
        <%
        }
        %>
        </script> 
        
		        <script type="text/javascript">        
			       function clinical()
			       {
			    	  
			    	   <%
			    	   cb=pd.selectClinical(patientID);
			    	   
			    	   %>
			    	   $('#clinical').load(' #clinical');
			       }
		         </script> 
        
                    
   <form id="clinicalstage" name="clinicalstage">
 <!------------------------------------ hidden field------------------------------------------ -->
 
    
     <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
     <input type="hidden"  name="updatedby" id="updatedby" value="<%=session.getAttribute("name")%>" required>
     <input type="hidden"  name="updatedtime" id="updatedtime" value="<%=lastAccessed%>" required> 
    
   
    <input type="hidden"  name="sex" id="c_sex" value="<%=hf.getSex() %>" >
     
     <div id="clinical">
     <input type="hidden" name="cp_id" id="cp_id" value="<%=cb.getPatientID() %>" required>
      <input type="hidden"  name="updateflag" id="updateflag" value="<%=cb.getUpdateFlage()%>" required>
     
    
     
     
     
     
        <h3><u><b>TNM Stage</b></u></h3><br>
         
		 <div class="row">         
		   <div class="form-group ">  
		     <label class="col-md-2 col-sm-3 control-label">T - TUMOR</label>
			    <%
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("X"))
			    {
			    %>
			     <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp X<input type="radio" value="X" name = "t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
			    </div> 	        	
			   <%	  
			    }
			    else
			    {
			    %>  
			  	  <div class="col-md-1 col-sm-1">											        
			     <label class="radio">&nbsp&nbsp&nbsp X<input type="radio" value="X" name = "t1"onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" ><span class="checkround"></span></label>
			   </div> 
			   <%   
			    }
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("0"))
			    {
			    %>	
		    	<div class="col-md-1 col-sm-1">
		         <label class="radio">&nbsp&nbsp&nbsp 0<input type="radio" value="0" name = "t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
		       </div> 
			    <%	
			    }
			    else
			    {
			    %>
			    <div class="col-md-1 col-sm-1">
		         <label class="radio">&nbsp&nbsp&nbsp 0<input type="radio" value="0" name = "t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" ><span class="checkround"></span></label>
		       </div> 
			      	
			    <%	
			    }
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("IS"))
			    {
			    %>
			     <div class="col-md-1 col-sm-1"> 
		         <label class="radio">&nbsp&nbsp&nbsp IS<input type="radio" value="IS" name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  checked="checked"><span class="checkround"></span></label>
		        </div>			    
			    <%	
			    }
			    else
			    {
		    	 %>
			     <div class="col-md-1 col-sm-1"> 
		         <label class="radio">&nbsp&nbsp&nbsp IS<input type="radio" value="IS" name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
		        </div>			    
			    <%				    	
			    }
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("1"))
			    {
			    %>
			      <div class="col-md-1 col-sm-1">  
		         <label class="radio">&nbsp&nbsp&nbsp 1<input type="radio" value="1" name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
		       </div>			    
			    <%	
			    }
			    else
			    {
		    	 %>
			      <div class="col-md-1 col-sm-1">  
		         <label class="radio">&nbsp&nbsp&nbsp 1<input type="radio" value="1" name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
		       </div>		    
			    <%				    	
			    }
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("2"))
			    {
			    %>
			     <div class="col-md-1 col-sm-1">  
		           <label class="radio">&nbsp&nbsp&nbsp 2<input type="radio" value="2"  name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
			     </div>		    
			    <%	
			    }
			    else
			    {
		    	 %>
			      <div class="col-md-1 col-sm-1">  
		           <label class="radio">&nbsp&nbsp&nbsp 2<input type="radio" value="2"  name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
			     </div>			    
			    <%				    	
			    }
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("3"))
			    {
			    %>
			     <div class="col-md-1 col-sm-1">  
		           <label class="radio">&nbsp&nbsp&nbsp 3<input type="radio" value="3" name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
		         </div>		    
			    <%	
			    }
			    else
			    {
		    	 %>
			     <div class="col-md-1 col-sm-1">  
		           <label class="radio">&nbsp&nbsp&nbsp 3<input type="radio" value="3" name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
		         </div>			    
			    <%				    	
			    }
			    if(cb.getUpdateFlage().equals("YES") && cb.getTum1().equals("4"))
			    {
			    %>
			     <div class="col-md-1 col-sm-1">  
				    <label class="radio">&nbsp&nbsp&nbsp 4<input type="radio" value="4"   name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
				 </div>	    
			    <%	
			    }
			    else
			    {
		    	 %>
			      <div class="col-md-1 col-sm-1">  
				    <label class="radio">&nbsp&nbsp&nbsp 4<input type="radio" value="4"   name="t1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
				 </div>	  		    
			    <%				    	
			    }	    
			    %>
			    
		  </div>
	</div>
	
	<br>
	
	<div class="row">
	  <div class="form-group "> 
	  <label class="col-md-2 col-sm-3 control-label"></label> 
		  <%
		  if(cb.getUpdateFlage().equals("YES") && cb.getTum2().equals("a"))
		  {
		  %>
			 <div class="col-md-1 col-sm-1">											        
	           <label class="radio">&nbsp&nbsp&nbsp a<input type="radio" value="a"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
	         </div>
		 <%	  
		  }
		  else
		  {
		   %>
			  <div class="col-md-1 col-sm-1">											        
	           <label class="radio">&nbsp&nbsp&nbsp a<input type="radio" value="a"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" ><span class="checkround"></span></label>
	          </div>
         <%
		  }
		  if(cb.getUpdateFlage().equals("YES") && cb.getTum2().equals("b"))
		  {
		  %>
			 <div class="col-md-1 col-sm-1">
               <label class="radio">&nbsp&nbsp&nbsp b<input type="radio" value="b"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
           </div> 
		 <%	  
		  }
		  else
		  {
		   %>
			<div class="col-md-1 col-sm-1">
               <label class="radio">&nbsp&nbsp&nbsp b<input type="radio" value="b"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
           </div> 
         <%
		  }
		  if(cb.getUpdateFlage().equals("YES") && cb.getTum2().equals("c"))
		  {
		  %>
			 <div class="col-md-1 col-sm-1">
               <label class="radio">&nbsp&nbsp&nbsp c<input type="radio" value="c"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
           </div> 
		 <%	  
		  }
		  else
		  {
		   %>
			<div class="col-md-1 col-sm-1">
               <label class="radio">&nbsp&nbsp&nbsp c<input type="radio" value="c"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
           </div> 
         <%
		  }
		  if(cb.getUpdateFlage().equals("YES") && cb.getTum2().equals("d"))
		  {
		  %>
			 <div class="col-md-1 col-sm-1">
               <label class="radio">&nbsp&nbsp&nbsp d<input type="radio" value="d"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
           </div> 
		 <%	  
		  }
		  else
		  {
		   %>
			<div class="col-md-1 col-sm-1">
               <label class="radio">&nbsp&nbsp&nbsp d<input type="radio" value="d"   name="t2" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
           </div> 
         <%
		  }
		  %>
		</div>
	</div>
		<legend><b></b></legend>						 
	 <div class = "row">					                   									        
         <div class="form-group ">  
		   <label class="col-md-2 col-sm-3 control-label">N-Nodal</label>
		   <%
		   if(cb.getUpdateFlage().equals("YES") && cb.getNod1().equals("X"))
		   {
		   %>
		   <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp X<input type="radio" value="X"   name="n1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
	       </div>  
		  <%  
		   }
		   else
		   {
			%>
		   <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp X<input type="radio" value="X"   name="n1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"><span class="checkround"></span></label>
	       </div> 
		   <% 	   
		   }
		   if(cb.getUpdateFlage().equals("YES") && cb.getNod1().equals("0"))
		   {
		   %>
		   <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 0<input type="radio" value="0" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"   name="n1" checked="checked"><span class="checkround"></span></label>
		   </div> 	 
		  <%  
		   }
		   else
		   {
			%>
		  <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 0<input type="radio" value="0"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="n1"><span class="checkround"></span></label>
		   </div> 
		   <% 	   
		   }
		   if(cb.getUpdateFlage().equals("YES") && cb.getNod1().equals("1"))
		   {
		   %>
		   <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 1<input type="radio" value="1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"   name="n1" checked="checked"><span class="checkround"></span></label>
		   </div> 	 
		  <%  
		   }
		   else
		   {
			%>
		  <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 1<input type="radio" value="1"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="n1"><span class="checkround"></span></label>
		   </div> 
		   <% 	   
		   }
		   if(cb.getUpdateFlage().equals("YES") && cb.getNod1().equals("2"))
		   {
		   %>
		   <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 2<input type="radio" value="2"   onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="n1" checked="checked"><span class="checkround"></span></label>
		   </div> 	 
		  <%  
		   }
		   else
		   {
			%>
		  <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 2<input type="radio" value="2"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="n1"><span class="checkround"></span></label>
		   </div> 
		   <% 	   
		   }
		   if(cb.getUpdateFlage().equals("YES") && cb.getNod1().equals("3"))
		   {
		   %>
		   <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 3<input type="radio" value="3" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"   name="n1" checked="checked"><span class="checkround"></span></label>
		   </div> 	 
		  <%  
		   }
		   else
		   {
			%>
		  <div class="col-md-1 col-sm-1">
		     <label class="radio">&nbsp&nbsp&nbsp 3<input type="radio" value="3"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="n1"><span class="checkround"></span></label>
		   </div> 
		   <% 	   
		   }
		   %>
		 </div>
   </div>
   	<br>												
	<div class="row">
		<div class="form-group ">  
	     <label class="col-md-2 col-sm-3 control-label"></label>
	     <%
	     if(cb.getUpdateFlage().equals("YES") && cb.getNod2().equals("a"))
	     {
	      %>
	      <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp a<input type="radio" value="a" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="n2" checked="checked"><span class="checkround"></span></label>
	       </div>      
	     <%	 
	     }	
	     else
	     {
	     %>
	      <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp a<input type="radio" value="a"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="n2"><span class="checkround"></span></label>
	       </div> 
	      <%	 
	     }
	     if(cb.getUpdateFlage().equals("YES") && cb.getNod2().equals("b"))
	     {
	      %>
	      <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp b<input type="radio" value="b" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="n2" checked="checked"><span class="checkround"></span></label>
	       </div>      
	     <%	 
	     }	
	     else
	     {
	     %>
	      <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp b<input type="radio" value="b"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="n2"><span class="checkround"></span></label>
	       </div> 
	      <%	 
	     }
	     if(cb.getUpdateFlage().equals("YES") && cb.getNod2().equals("c"))
	     {
	      %>
	      <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp c<input type="radio" value="c" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="n2" checked="checked"><span class="checkround"></span></label>
	       </div>      
	     <%	 
	     }	
	     else
	     {
	     %>
	      <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp c<input type="radio" value="c" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="n2"><span class="checkround"></span></label>
	       </div> 
	      <%	 
	     }
	     %>
		</div>
	</div>		
		<legend><b></b></legend>		
	<div class = "row">
       <div class="form-group ">  
		  <label class="col-md-2 col-sm-3 control-label">M-Metastasis</label>
		  <%
		  if(cb.getUpdateFlage().equals("YES") && cb.getMeta1().equals("X"))
		  {
		  %>
		   <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp X<input type="radio" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" value="X" name="m1" checked="checked"><span class="checkround"></span></label>
		   </div> 
		  <%	  
		  }
		  else
		  {
		   %> 
		    <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp X<input type="radio" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" value="X"   name="m1"><span class="checkround"></span></label>
		   </div>
		     
		  <%  
		  }
		  if(cb.getUpdateFlage().equals("YES") && cb.getMeta1().equals("0"))
		  {
		  %>
		   <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp 0<input type="radio"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" value="0" name="m1" checked="checked"><span class="checkround"></span></label>
		   </div> 
		  <%	  
		  }
		  else
		  {
		   %> 
		    <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp 0<input type="radio" value="0"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="m1"><span class="checkround"></span></label>
		   </div>
		     
		  <%  
		  }
		  if(cb.getUpdateFlage().equals("YES") && cb.getMeta1().equals("1"))
		  {
		  %>
		   <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp 1<input type="radio" value="1" name="m1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" checked="checked"><span class="checkround"></span></label>
		   </div> 
		  <%	  
		  }
		  else
		  {
		   %> 
		    <div class="col-md-1 col-sm-1">											        
			    <label class="radio">&nbsp&nbsp&nbsp 1<input type="radio" value="1" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="m1"><span class="checkround"></span></label>
		   </div>
		     
		  <%  
		  }
		  %>
	  </div>
	</div>
	 <br>
	<div class="row">
	   <div class="form-group ">  
	      <label class="col-md-2 col-sm-3 control-label"></label>
	     <%
	     if(cb.getUpdateFlage().equals("YES") && cb.getMeta2().equals("a"))
	     {
	     %> 
		     <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp a<input type="radio" value="a" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="m2" checked="checked"><span class="checkround"></span></label>
	        </div>		    	
	    <%	 
	     }
	     else
	     {
	     %>
	        <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp a<input type="radio" value="a" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="m2"><span class="checkround"></span></label>
	        </div>
	    <%	 
	     }
	     if(cb.getUpdateFlage().equals("YES") && cb.getMeta2().equals("b"))
	     {
	     %> 
		     <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp b<input type="radio" value="b" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="m2" checked="checked"><span class="checkround"></span></label>
	        </div>		    	
	    <%	 
	     }
	     else
	     {
	     %>
	        <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp b<input type="radio" value="b"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="m2"><span class="checkround"></span></label>
	        </div>
	    <%	 
	     }
	     if(cb.getUpdateFlage().equals("YES") && cb.getMeta2().equals("c"))
	     {
	     %> 
		     <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp c<input type="radio" value="c" onclick="check(t1,t2,n1,n2,m1,m2,'#stage')"  name="m2" checked="checked"><span class="checkround"></span></label>
	        </div>		    	
	    <%	 
	     }
	     else
	     {
	     %>
	        <div class="col-md-1 col-sm-1">											        
	          <label class="radio">&nbsp&nbsp&nbsp c<input type="radio" value="c"  onclick="check(t1,t2,n1,n2,m1,m2,'#stage')" name="m2"><span class="checkround"></span></label>
	        </div>
	    <%	 
	     }
	     %> 
       </div>
	</div>
	 <br>
	<div class = "row">
	    <div class="form-group "> 
		 <label class="col-md-2 col-sm-3 control-label">Stage</label>
		 <%
		 if(cb.getUpdateFlage().equals("YES") && !cb.getStg().equals(""))
		 {
		%>
		<div class="col-md-3 col-sm-5">
               <input type="text" name="stg" id="stage" class="form-control" value="<%=cb.getStg() %>"  readonly="readonly" >
        </div>		
	    <%	 
		 }
		 else
		 {
	    %>
	    <div class="col-md-3 col-sm-5">
               <input type="text" name="stg" id="stage" class="form-control"readonly="readonly" >
          </div>
		<%	 
		 }
		 %>
     	   
	    </div>
	</div>     	
		<br>		
                                <legend><b></b></legend>	
	 <div class = "row">
        <div class="form-group ">  
			       <label class="col-md-2 col-sm-3 control-label">Stage Group</label>
			      <%
			      if(cb.getUpdateFlage().equals("YES") && cb.getStg1().equals("I"))
			      {
			      %>
			      <div class="col-md-1 col-sm-1">											        
		          	<label class="radio">&nbsp&nbsp&nbsp I<input type="radio" value="I"  name="sg" checked="checked"><span class="checkround"></span></label>
		          </div>  
			    	  
			      <%	  
			      }
			      else
			      {
			       %>
			        <div class="col-md-1 col-sm-1">											        
		          	<label class="radio">&nbsp&nbsp&nbsp I<input type="radio" value="I"  name="sg"><span class="checkround"></span></label>
		          </div> 
			      <%	  
			      }
			      
			      if(cb.getUpdateFlage().equals("YES") && cb.getStg1().equals("II"))
			      {
			      %>
			      <div class="col-md-1 col-sm-1">
		         	 <label class="radio">&nbsp&nbsp&nbsp II<input type="radio" value="II" name="sg" checked="checked"><span class="checkround"></span></label>
		          </div>   
			    	  
			      <%	  
			      }
			      else
			      {
			       %>
			        <div class="col-md-1 col-sm-1">
		         	 <label class="radio">&nbsp&nbsp&nbsp II<input type="radio" value="II" name="sg"><span class="checkround"></span></label>
		          </div>  
			      <%	  
			      }
			      if(cb.getUpdateFlage().equals("YES") && cb.getStg1().equals("III"))
			      {
			      %>
			      <div class="col-md-1 col-sm-1">
		          	<label class="radio">&nbsp&nbsp&nbsp III<input type="radio" value="III"  name="sg" checked="checked"><span class="checkround"></span></label>
		          </div>   
			    	  
			      <%	  
			      }
			      else
			      {
			       %>
			        <div class="col-md-1 col-sm-1">
		          	<label class="radio">&nbsp&nbsp&nbsp III<input type="radio" value="III"  name="sg"><span class="checkround"></span></label>
		          </div>    
			      <%	  
			      }
			      if(cb.getUpdateFlage().equals("YES") && cb.getStg1().equals("IV"))
			      {
			      %>
				     <div class="col-md-1 col-sm-1">  
			         	 <label class="radio">&nbsp&nbsp&nbsp IV<input type="radio" value="IV"  name="sg" checked="checked"><span class="checkround"></span></label>
			         </div>  
			    	  
			      <%	  
			      }
			      else
			      {
			       %>
			        <div class="col-md-1 col-sm-1">  
			         	 <label class="radio">&nbsp&nbsp&nbsp IV<input type="radio" value="IV"  name="sg"><span class="checkround"></span></label>
			         </div>    
			      <%	  
			      }
			      %> 
		</div>
	</div>		
	<br>		
	<div class="row">
		<div class="form-group ">  
			  <label class="col-md-2 col-sm-3 control-label"></label>
			  <%
			  if(cb.getUpdateFlage().equals("YES") && cb.getStg2().equals("A"))
			  {
			  %>
			  <div class="col-md-1 col-sm-1">											        
		          <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" value="A"  name="sg1" checked="checked"><span class="checkround"></span></label>
		      </div> 
			  
			  <%	  
			  }
			  else
			  {
			   %>	  
				<div class="col-md-1 col-sm-1">											        
		          <label class="radio">&nbsp&nbsp&nbsp A<input type="radio" value="A"  name="sg1"><span class="checkround"></span></label>
		      </div>
		    <%   
			  }
			  
			  if(cb.getUpdateFlage().equals("YES") && cb.getStg2().equals("B"))
			  {
			  %>
			  <div class="col-md-1 col-sm-1">
		          <label class="radio">&nbsp&nbsp&nbsp B<input type="radio"  value="B" name="sg1" checked="checked"><span class="checkround"></span></label>
		      </div> 			  
			  <%	  
			  }
			  else
			  {
			   %>	  
				<div class="col-md-1 col-sm-1">
		          <label class="radio">&nbsp&nbsp&nbsp B<input type="radio"  value="B" name="sg1"><span class="checkround"></span></label>
		      </div>
		    <%   
			  }
			  if(cb.getUpdateFlage().equals("YES") && cb.getStg2().equals("C"))
			  {
			  %>
			   <div class="col-md-1 col-sm-1">
		          <label class="radio">&nbsp&nbsp&nbsp C<input type="radio" value="C"  name="sg1" checked="checked"><span class="checkround"></span></label>
		        </div>		  
			  <%	  
			  }
			  else
			  {
			   %>	  
				 <div class="col-md-1 col-sm-1">
		          <label class="radio">&nbsp&nbsp&nbsp C<input type="radio" value="C"  name="sg1"><span class="checkround"></span></label>
		        </div>
		    <%   
			  }
			  %>
			</div>
       </div> 
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
        <input type="button" class="btn btn-primary" id="clinicle_infoID"  value="submit">
        
        <%
        }
        %>
        
            
        
      
       
       
       
       
       
                
  </form>  
</div>
     
    
        
            

             
               
<!---------------------------------------- referral section------------------------------------------------------------- -->
              
              
              
 <div role="tabpanel" class="tab-pane " id="tab3">
	 <h3><u><b>Referral Information</b></u></h3>
	   <script type="text/javascript">
         <% 
        if(accessrole==1 && pr.getUpdateFlage().equals("YES"))
        {
        %>
        $(document).ready(function () {
            $("#referal *").prop("disabled", true);
        });
        
        <%
        }
        %>
        </script> 
        
        <script type="text/javascript">        
       function referral()
       {
    	  
    	   <%
    	   pr=pd.selectRef(patientID);
    	   
    	   %>
    	   $('#referral').load(' #referral');
       }
         </script>
        
	 <form method="post" name ="referal" id="referal">
	 
    
     <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
     <input type="hidden"  name="Referal_updatedby" id="Referal_updatedby" value="<%=session.getAttribute("name")%>" required>
     <input type="hidden"  name="Referal_updatedtime" id="Referal_updatedtime" value="<%=lastAccessed%>" required>
    
		 <input type="hidden"  name="sex" id="rf_sex" value="<%=hf.getSex() %>" >
		 
		 <div id="referral">
		 <input type="hidden" name="p_id" id="Rp_id" value="<%=pr.getPatientID() %>" required>
    <input type="hidden"  name="updateflag" id="updateflag" value="<%=pr.getUpdateFlage()%>" required> 
		 	   
    <br>
          <div class="row"> 
		       <div class="form-group" >
					<label class="col-md-2 col-sm-2 control-label">Recorded by</label>  
					<div class="col-md-3 col-sm-3">
					 <input type="text" name="rec_by" id="rec_by" value="<%=pr.getRecorded_by() %>" class="form-control">
					</div>			
					<label class="col-md-2 col-sm-3 control-label">Consultant</label>  
					<div class="col-md-3 col-sm-3">
						<input type="text" name="cont" id="cont" value="<%=pr.getConsultant() %>" class="form-control">
					</div>
			  </div>
	      </div> 
					  
			<br>		  
			<div class="row"> 
					       <div class="form-group" >
								<label class="col-md-2 col-sm-2 control-label">Referral Physician</label>  
								<div class="col-md-3 col-sm-3">
								 <input type="text" name="ref_phy" id="ref_phy" value="<%=pr.getReferral_phy() %>" class="form-control">
								</div>			
								<label class="col-md-2 col-sm-3 control-label">Referral Hospital</label>  
								<div class="col-md-3 col-sm-3">
									<input type="text" name="ref_doc" id="ref_doc" value="<%=pr.getReferral_doc() %>" class="form-control">
								</div>
						  </div>
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
        <input type="button" class="btn btn-primary"  onClick="Refferalsubmit()"  value="submit"><!-- id="referral_sub" -->
        
        <%
        }
        %> 
		
		</div><br>	
		
      </form>     
</div>
         <!---------------------------------------- tumor section------------------------------------------------------------- -->     
         
   <div role="tabpanel" class="tab-pane " id="tab4">
    <script type="text/javascript">
         <% 
        if(accessrole==1 && pt.getUpdateFlage().equals("YES"))
        {
        %>
        $(document).ready(function () {
        	
      
            $("#tumor *").prop("disabled", true);
        });
        
        <%
        }
        %>
        </script> 
        <script type="text/javascript">        
       function tumorBoardPolicy()
       {
    	  
    	   <%
    	   pt=pd.selectTumor(patientID);
    	   
    	   %>
    	   $('#tumorBoardPolicy').load(' #tumorBoardPolicy');
       }
         </script>
        
   <form method="post" id="tumor">
   
   <input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
     <input type="hidden"  name="tumor_updatedby" id="tumor_updatedby" value="<%=session.getAttribute("name")%>" required>
     <input type="hidden"  name="tumor_updatedtime" id="tumor_updatedtime" value="<%=lastAccessed%>" required>
   
      
   <input type="hidden"  name="sex" id="tb_sex" value="<%=hf.getSex() %>" >
   
   <div id="tumorBoardPolicy">
   <input type="hidden" name="p_id" id="Tp_id" value="<%=pt.getPatientID() %>" required>
   <input type="hidden"  name="updateflag" id="updateflag" value="<%=pt.getUpdateFlage()%>" required>  
              <h3><u><b>Tumor Board Policy</b></u></h3><br>
       <div class="row"> 
		  <div class="form-group" >
				 <label class="col-md-1 col-sm-2 control-label">Date</label>  
				 <div class="col-md-3 col-sm-3">
				    <input type="date" name="t_date" id="t_date" value="<%=pt.getTumor_date() %>" class="form-control">
				</div>			
				<label class="col-md-2 col-sm-3 control-label">Policy Number</label>  
				<div class="col-md-3 col-sm-3">
					<input type="text" name="p_number" id="p_number" value="<%=pt.getPolicy_number() %>" class="form-control">
				</div>
		  </div>
     </div> 
	  <br>
	 <div class="row"> 
		 <div class="form-group" >
			 <label class="col-md-1 col-sm-2 control-label">Therapy</label>  
			 <div class="col-md-3 col-sm-3">
				 <textarea rows="5" cols="60" name="therapy" id="therapy" ><%=pt.getTumor_therapy() %></textarea>
			 </div>			
			
	     </div>
	 </div> 
	 <br>
	 
	 
	 </div>
	 
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
        
        	 <input type="button" class="btn btn-primary" onClick="TumorSubmit()" value="submit"><!-- id="tumor_sub"  -->
        
        <%
        }
        %>
      
	 
	 </div><br>
	 
	 
        
        
	 
	 
	 
	</form>	        
    </div>

    
    </div>
</div>
      
      
      
      
           <!--  <div class="col-md-3 col-sm-6">
			<div class="wrimagecard wrimagecard-topimage">
		    <a href="#">
			          <div class="wrimagecard-topimage_header" style="background-color:#fdfdfd ">
			            <marquee width="100%" height="300px" direction="up" style="font-family:Book Antiqua;  scrolldelay="90" onmouseover="this.stop();" onmouseout="this.start();"><a href="http://www.janaanalysis.com/"><h3><li>Jana Analysis</li></a></h3><a href="http://www.jananetworks.com/"><h3><li>ManoHaran</li></h3></a><a href="http://www.jananetworks.com/Farah_index.html"><h3><li>Khaja Mohideen</li></h3></a><a href="https://www.youtube.com/"><h3><li>Gopi Chandran</li></h3></a><a href="https://www.facebook.com/"><h3><li>Ragavendiran</li></h3></a></marquee>
			            
			          </div>       
		        </a>
		    </div>
	   </div>
             -->
            
            
            
        </div>
	</div>
</div>


 
    
    
    
    
    
    
    

 <script src="js/PatientInfo_form.js"></script>
<!-- <script src="js/jquery.min.js"></script> -->
 <script src="css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>