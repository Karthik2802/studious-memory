<%@page import="java.util.Date"%>

<%@page import="com.HospitalEMR.ReadFile.web.readFile"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    <%
	readFile f = new readFile();
	String title = f.Title(request);   
    
    
	//String saccessrole="2";
	String saccessrole=request.getParameter("accessrole");
	int accessrole=Integer.parseInt(saccessrole);	
	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="image/LOGO.png" type="image/gif">
<title>Search</title>
 <script src="js/jquery.min.js"></script>
 <link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="all"> 
<link href="css/icon_display.css" rel="stylesheet" media="all"> 
 <link rel="stylesheet" href="css/my_design.css"> 
 
 
</head>
<body align="center">
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
                        <a style="color: red;" href="logout.jsp" >Logout</a>
                       
                        
                    </li>
                    
                    
                      <%
	                	Date lastAccessed = new Date(session.getLastAccessedTime());
	            		
	                	session=request.getSession(false);
	            	 /*    if(session.getAttribute("name") == null)
	                    { 
 	                    	 response.sendRedirect("Login.jsp");
 	                    	 return;
	               		}   */
	                     
	                    %>
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <br>
    <br>
    <br>
    <div class="container">
    <script type="text/javascript">
    
    history.pushState(null, null, location.href);
	window.onpopstate = function () 
	{
	    history.go(1);
	};

  function empty(form)
{
	 
	
    if(form.elements['s_name'].value == "" && form.elements['s_age'].value == "" && form.elements['s_cd_no'].value == "" && form.elements['s_Diagnosis'].value == "" && form.elements['organ'].value=="" && form.elements['subtypes'].value=="")
    	{
	    	alert("Please enter any one field!");
	        return false;
    	}
        else
       	{
        	form.submit();
            return true;
    	
    	}
}
  
</script>
	
	<form action="SearchMain" method="post">
	<div class="jumbotron">
	<input type="hidden"  name="accessrole" id="accessrole" value="<%=accessrole%>"required>
	 <div class="row"> 
       <div class="form-group" >
			<label class="col-md-2 col-sm-2 control-label">Name</label>  
			<div class="col-md-3 col-sm-3">
			 	<input type="text" name="s_name" id="s_name" class="form-control" autocomplete="off">
			 	
			</div>			
	  </div>
	   <div class="form-group" >
			<label class="col-md-2 col-sm-2 control-label">Age</label>  
			<div class="col-md-3 col-sm-3">
			 	 <input type="text" name="s_age" id="s_age" class="form-control" autocomplete="off"> 
			 <!-- 	<select name="s_age" id="s_age" class="form-control">
			 	<option value="">select Age Range</option>
			 	<option value="1-10">1-10</option>
			 	<option value="11-20">11-20</option>
			 	<option value="21-30">21-30</option>
			 	<option value="31-40">31-40</option>
			 	<option value="41-50">41-50</option>
			 	<option value="51-60">51-60</option>
			 	<option value="61-70">61-70</option>
			 	<option value="71 to >80">71 to >80</option>
			 	</select> -->
			</div>			
	  </div>
       </div><br><br>
        <div class="row"> 
       <div class="form-group" >
			<label class="col-md-2 col-sm-2 control-label">Index No</label>  
			<div class="col-md-3 col-sm-3">
			 	<input type="text" name="s_cd_no" id="s_cd_no" class="form-control" autocomplete="off">
			</div>			
	  </div>
	   <div class="form-group" >
			<label class="col-md-2 col-sm-2 control-label">Diagnosis</label>  
			<div class="col-md-3 col-sm-3">
			 	<input type="text" name="s_Diagnosis" id="s_Diagnosis" class="form-control" autocomplete="off">
			</div>			
	  </div>
       </div><br><br>
       <div class="row"> 
       <div class="form-group" >
			<label class="col-md-2 col-sm-2 control-label">Organ of Interest</label>  
			<div class="col-md-3 col-sm-3">
							<select name="organ" id="organ" onchange="dis_organ()" class="form-control" >
		                        <option value="">Select Organ</option>
								<option value="HEAD AND NECK" >HEAD AND NECK</option>
								<option value="BRAIN">BRAIN</option>
								<option value="THROAX">THROAX</option>
								<option value="GYNAECOLOGICAL">GYNAECOLOGICAL</option>
								<option value="GASTRO INTESTINAL TRACT" >GASTRO INTESTINAL TRACT</option>
								<option value="GENITO URINARY">GENITO URINARY</option>
								
								<option value="HEPATOPANCREATO BILIARY">HEPATOPANCREATO BILIARY</option>
								<option value="SKIN MALIGNANCY" >SKIN MALIGNANCY</option>
								<option value="MUSCULOSKELETAL">MUSCULOSKELETAL</option>
								<option value="LYMPHOMAS" >LYMPHOMAS</option>
								<option value="LEUKEMIAS" >LEUKEMIAS</option>
								<option value="MYELOMAS" >MYELOMAS</option>
								<option value="UNASSIGNED">UNASSIGNED</option>
							</select>
								</div> 			
	  </div>
	   <div class="form-group" >
			<label class="col-md-2 col-sm-2 control-label">Histology</label>  
			<div class="col-md-3 col-sm-3">
			 	<select name="organ_subtypes" id="subtypes" class="form-control" >
						<option value="">Select Sub Types</option>		
						<!-- to set the subtype value to create the new form -->
						
						<option value="BRAIN">BRAIN</option>
						<option value="THROAX">THROAX</option>
						<option value="HEAD AND NECK - LARYNX" >HEAD AND NECK - LARYNX</option>						
						<option value="HEAD AND NECK - NASAL CAVITY">HEAD AND NECK - NASAL CAVITY</option>
						<option value="HEAD AND NECK - EYE">HEAD AND NECK - EYE</option>						
						<option value="HEAD AND NECK - EAR">HEAD AND NECK - EAR</option>
						<option value="HEAD AND NECK - HYPOPHARYNX">HEAD AND NECK - HYPOPHARYNX</option>						
						<option value="HEAD AND NECK - OROPHARYNX">HEAD AND NECK - OROPHARYNX</option>
						<option value="HEAD AND NECK - NASOPHARYNX">HEAD AND NECK - NASOPHARYNX</option>						
						<option value="HEAD AND NECK - PARANASAL SINUSES">HEAD AND NECK - PARANASAL SINUSES</option>
						<option value="HEAD AND NECK - SALIVARY GLANDS">HEAD AND NECK - SALIVARY GLANDS</option>						
						<option value="HEAD AND NECK - ORAL CAVITY">HEAD AND NECK - ORAL CAVITY</option>
						<option value="HEAD AND NECK - THYROID">HEAD AND NECK - THYROID</option>
						<option value="HEAD AND NECK - PARAPHARANGEAL SPACE TUMORS">HEAD AND NECK - PARAPHARANGEAL SPACE TUMORS</option>
						<option value="GYNAECOLOGICAL - UTERINE">GYNAECOLOGICAL - UTERINE</option>
						<option value="GYNAECOLOGICAL - FALLOPIAN TUBE">GYNAECOLOGICAL - FALLOPIAN TUBE</option>						
						<option value="GYNAECOLOGICAL - OVARIAN">GYNAECOLOGICAL - OVARIAN</option>
						<option value="GYNAECOLOGICAL - CERVIX">GYNAECOLOGICAL - CERVIX</option>						
						<option value="GYNAECOLOGICAL - VAGINA">GYNAECOLOGICAL - VAGINA</option>
						<option value="GYNAECOLOGICAL - VULVA">GYNAECOLOGICAL - VULVA</option>						
						<option value="GASTRO INTESTINAL TRACT - ESOPHAGUS">GASTRO INTESTINAL TRACT - ESOPHAGUS</option>
						<option value="GASTRO INTESTINAL TRACT - STOMACH">GASTRO INTESTINAL TRACT - STOMACH</option>
						<option value="GASTRO INTESTINAL TRACT - COLORECTAL">GASTRO INTESTINAL TRACT - COLORECTAL</option>
						<option value="GASTRO INTESTINAL TRACT - ANAL">GASTRO INTESTINAL TRACT - ANAL</option>						
						<option value="GENITO URINARY - KIDNEY" >GENITO URINARY - KIDNEY</option>
						<option value="GENITO URINARY - URINARY BLADDER">GENITO URINARY - URINARY BLADDER</option>
						<option value="GENITO URINARY - URETERS">GENITO URINARY - URETERS</option>						
						<option value="GENITO URINARY - PROSTRATE">GENITO URINARY - PROSTRATE</option>
						<option value="GENITO URINARY - TESTIS" >GENITO URINARY - TESTIS</option>
						<option value="GENITO URINARY - PENIS" >GENITO URINARY - PENIS</option>
						
						<!-- <option value="LUNG - NON SMALL CELL" >LUNG - NON SMALL CELL</option> -->
						<option value="HEPATOPANCREATO BILIARY - LIVER"  >HEPATOPANCREATO BILIARY - LIVER</option>						
						<option value="HEPATOPANCREATO BILIARY - PANCREAS"  >HEPATOPANCREATO BILIARY - PANCREAS</option>
						<option value="HEPATOPANCREATO BILIARY - GALL BLADDER"  >HEPATOPANCREATO BILIARY - GALL BLADDER</option>
						<option value="HEPATOPANCREATO BILIARY - BILE DUCT"  >HEPATOPANCREATO BILIARY - BILE DUCT</option>
						<option value="HEPATOPANCREATO BILIARY - AMPULLA"  >HEPATOPANCREATO BILIARY - AMPULLA</option>
						<option value="MUSCULOSKELETAL - SOFT TISSUE SARCOMA"  >MUSCULOSKELETAL - SOFT TISSUE SARCOMA</option>
						<option value="MUSCULOSKELETAL - BONE TUMORS" >MUSCULOSKELETAL - BONE TUMORS</option> 
						
					</select>
			</div>			
	  </div>
       </div><br><br>
       
       <div class="row">
       <div class="col-md-3 "> 
        	<input type="submit" value="search" class="btn btn-primary" onClick="return empty(form)" >
       </div>
       
	</div>
	
	
	
	
	
	 <fieldset class="row1">
                <h2 align="center"><font color="#">Search Results</font></h2>
				
			
				<table  width="1000px"  class="table table-dark" align="center"  border="1px" style="border:3px solid #000000; ">
					<tr style="background-color:lightgrey;">
		                <td><h5><b>ID&nbsp;</b></h5></td>
		                <td><b>Patient Name</b> &nbsp;</td>	
		                 <td><b>Patient ID</b></td>
		                <td><b>Index No</b></td>
		                	               
		                <td><b>Age</b>&nbsp;</td>
		                <td><b>Sex&nbsp; </b></td>
		               
		                <td><b>Address&nbsp;</b></td>
		                <td><b>Phone Number&nbsp;</b></td>
		                <td><b>Diagnosis&nbsp;</b></td>
		                
		                 <td><b>Organ Of Interest&nbsp;</b></td>
		                  <td><b>Histology&nbsp;</b></td>
		                
		                <td><b>Discharge Summary&nbsp;</b></td>
		               <td><b>Treatment Summary&nbsp;</b></td>
		            </tr>
           			 
           			  <%
		                int count = 0;
		                String color = "#fff";
		                
		                if (request.getAttribute("SearchDeatil") != null) 
		                {
		                    ArrayList al = (ArrayList) request.getAttribute("SearchDeatil");
		                   
		                    
		                    Iterator itr = al.iterator();
		                    
		                    while (itr.hasNext()) 
		                    {
		 
		                        if ((count % 2) == 0) 
		                        {
		                            color = "#fff";
		                        }
		                        count++;
		                        ArrayList pList = (ArrayList) itr.next();
		           		 %>
				            <tr style="background-color:<%=color%>;">
				                <td><a href = "Demography.jsp?p_id=<%=pList.get(0)%>&accessrole=<%=accessrole%>&tabActive=Search"/> <%=pList.get(0)%></td>
				                <td><%=pList.get(1)%></td>
				                <td><%=pList.get(4)%></td>				                			                
				                <td><%=pList.get(10)%></td>				                
				                <td><%=pList.get(2)%></td>
				                <td><%=pList.get(3)%></td>				                			               
				                <td><%=pList.get(5)%></td>
				                <td><%=pList.get(6)%></td>
				                <td><%=pList.get(7)%></td>
				                 <td><%=pList.get(8)%></td>
				                <td><%=pList.get(9)%></td>
				               <td><a href = "Ramakrishna_DS.jsp?p_id=<%=pList.get(0)%>&DSF=Display">DISCHAGE SUMMARY</a></td> 
				               <td><a href = "Treatment_Summary.jsp?p_id=<%=pList.get(0)%>&DSF=Display">TREATMENT SUMMARY</a></td>
				               
				               
				            </tr>
		            	<%
		                    }
		                }
		                
			                if (count == 0)
		               		{
				     	%>
				            <tr>
				                <td colspan=13 align="center"
				                    style="background-color:#fff"><b>No Record Found..</b></td>
				            </tr>
		            	<%           
		            		}
		             	%>
				</table>
			
			</fieldset>
	
						
		
	
</form>

</div>


</body>





<script type="text/javascript">
/* function dis_organ()
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
} */

</script>
</html>