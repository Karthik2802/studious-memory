/**
 * 
 */

/* function to add rows */

function insRow(id) {

	

	/* this will work if id ="InvestigationTable" */

	if (id == "InvestigationTable") {
		var filas = document.getElementById("InvestigationTable").rows.length;
		var a = document.getElementById(id).insertRow(filas);
		
		if (!document.getElementById("investicationdate") == "")
		{
			alert("Please enter the data and Save...!");
			return false;
		}
		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);
		var s = a.insertCell(3);
		var t = a.insertCell(4);
		var w = a.insertCell(5);
		var x = a.insertCell(6);
		var z = a.insertCell(7);
		
		/*var b = a.insertCell(8);
		var c = a.insertCell(9);
		var d = a.insertCell(10);
		var e = a.insertCell(11);
		var f = a.insertCell(12);
		var g = a.insertCell(13);*/

		p.innerHTML = '<input type="date" name="investicationdate" id="investicationdate"  class="input_table_170px">';
		q.innerHTML = '<input type="text" name="hb" id="hb" class="input_small_50px"  >';
		r.innerHTML = '<input type="text" name="tc" id="tc" class="input_small_50px"  >';
		s.innerHTML = '<input type="text" name="dc" id="dc" class="input_small_50px"  >';
		t.innerHTML = '<input type="text" name="platelets" id="platelets" class="input_small_70px"  >';
		w.innerHTML = '<input type="text" name="Rbs" id="Rbs" class="input_small_50px"  >';
		x.innerHTML = '<input type="text" name="Fbs" id="Fbs" class="input_small_50px"  >';
		z.innerHTML = '<input type="text" name="Ppbs" id="Ppbs" class="input_small_50px"  >';
		/*b.innerHTML = '<input type="text" name="Urea" id="Urea" class="input_small_50px"  >';
		c.innerHTML = '<input type="text" name="Creatinine" id="Creatinine" class="input_small_70px"  >';
		d.innerHTML = '<input type="text" name="Sodium" id="Sodium" class="input_small_70px"  >';
		e.innerHTML = '<input type="text" name="potassium" id="potassium" class="input_small_70px"  >';
		f.innerHTML = '<input type="text" name="Chloride" id="Chloride" class="input_small_70px"  >';
		g.innerHTML = '<input type="text" name="Bicarbonates" id="Bicarbonates" class="input_small_70px"  >';*/

	} else if (id == "liverFunctionTable") {
		var filas = document.getElementById("liverFunctionTable").rows.length;
		var a = document.getElementById(id).insertRow(filas);
		if (!document.getElementById("liverDate") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}
		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);
		var s = a.insertCell(3);
		var t = a.insertCell(4);
		var w = a.insertCell(5);
		var x = a.insertCell(6);
		var y = a.insertCell(7)
		var z = a.insertCell(8);
		var b = a.insertCell(9);
		var c = a.insertCell(10);
		var d = a.insertCell(11);

		p.innerHTML = '<input type="date" name="liverDate" id="liverDate" class="input_table_170px" >';
		q.innerHTML = '<input type="text" name="bilirubintotal" id="bilirubintotal" class="input_small_50px" >';
		r.innerHTML = '<input type="text" name="Direct" id="Direct" class="input_small_50px" >';
		s.innerHTML = '<input type="text" name="Indirect" id="Indirect" class="input_small_50px" >';
		t.innerHTML = '<input type="text" name="proteintotal" id="proteintotal" class="input_small_50px">';
		w.innerHTML = '<input type="text" name="Albumin" id="Albumin" class="input_small_50px">';
		x.innerHTML = '<input type="text" name="Globumin" id="Globumin" class="input_small_50px" >';
		y.innerHTML = '<input type="text" name="Ratio" id="Ratio" class="input_small_50px">';
		z.innerHTML = '<input type="text" name="SGOT" id="SGOT" class="input_small_50px">';
		b.innerHTML = '<input type="text" name="SGPT" id="SGPT" class="input_small_50px" >';
		c.innerHTML = '<input type="text" name="ALP" id="ALP" class="input_small_50px" >';
		d.innerHTML = '<input type="text" name="GGT" id="GGT" class="input_small_50px" >';

	}

	else if (id == "otherTestTable") {
		var filas = document.getElementById("otherTestTable").rows.length;
		var a = document.getElementById(id).insertRow(filas);
		if (!document.getElementById("other1") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}
		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);
		var s = a.insertCell(3);

		p.innerHTML = '<input type="text" name="other1" id="other1" class="input_table_170px" maxlength="25" >';
		q.innerHTML = '<input type="text" name="other2" id="other2" class=input_table_170px maxlength="25" >';
		r.innerHTML = '<input type="text" name="other3" id="other3" class=input_table_170px maxlength="25" >';
		s.innerHTML = '<input type="text" name="other4" id="other4" class=input_table_170px maxlength="25" >';

	} else if (id == "tumor_marker") {
		var filas = document.getElementById("tumor_marker").rows.length;
		var a = document.getElementById(id).insertRow(filas);

		if (!document.getElementById("seri_number") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}

		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);
		//var s = a.insertCell(3);

		p.innerHTML = '<input type="text" name="seri_number" id="seri_number" class="input_table_170px" maxlength="25" >';
		q.innerHTML = '<input type="text" name="tumor_number" id="tumor_number" class=input_table_170px>';
		r.innerHTML = '<input type="text" name="value" id="value" class=input_table_170px  >';
		//s.innerHTML = '<input type="file" name="file" id="file<%=pList.get(0)%>" class=uploadFile value="Upload"/><input type="button" onclick="SaveImg(rowId<%=pList.get(0)%>.value,se_patinetID.value,file<%=pList.get(0)%>.value,"Tumor Marker")" class="btn btn-primary"  value="Save">';
		

	} else if (id == "immuno_histo") {
		var filas = document.getElementById("immuno_histo").rows.length;
		var a = document.getElementById(id).insertRow(filas);

		if (!document.getElementById("Seril_number") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}

		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);

		p.innerHTML = '<input type="text"  name="Seril_number" id="Seril_number" class="input_small_50px " maxlength="05">';
		q.innerHTML = '<input type="text" name="immunoHistoMaker" id="immunoHistoMaker" class="input_table_170px" maxlength="25">';
		r.innerHTML = '<input type="text" name="Result" id="Result" class="input_small_70px" maxlength="25">';

	} else if (id == "endo") {

		var filas = document.getElementById("endo").rows.length;
		var a = document.getElementById(id).insertRow(filas);

		if (!document.getElementById("endo_date") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}

		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);

		p.innerHTML = '<input class="input_table_170px" type="date" name="endo_date" id="endo_date">';
		q.innerHTML = '<select class="input_table_DD" name="endo_select" id="endo_select"><option value="">Select</optio><option value="OGD">OGD</option> <option value="FOB">FOB</option><option value="COLONOSCOPY">COLONOSCOPY</option><option value="DL SCOPY">DL SCOPY</option> <option value="IDL">IDL</option> <option value="CYSTOCOPY">CYSTOCOPY</option><option value="ERCP">ERCP</option></select>';

		r.innerHTML = '<textarea  rows="3" cols="50" name="endo_text" id="endo_text"></textarea>';

	}
	
	else if (id == "renaltable")
		{
		
		var filas = document.getElementById("renaltable").rows.length;
		var a = document.getElementById(id).insertRow(filas);
		
		if (!document.getElementById("renalDate") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}
		
		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);
		var s = a.insertCell(3);
		var t = a.insertCell(4);
		var w = a.insertCell(5);
		var x = a.insertCell(6);
		var y = a.insertCell(7)
		var z = a.insertCell(8);
		
		
		p.innerHTML = '<input type="date" name="renalDate" id="renalDate"  class="input_table_170px">';	
		q.innerHTML = '<input type="text" name="Urea" id="Urea" class="input_small_50px"  >';
		r.innerHTML = '<input type="text" name="Creatinine" id="Creatinine" class="input_small_70px"  >';
		s.innerHTML = '<input type="text" name="Sodium" id="Sodium" class="input_small_70px"  >';
		t.innerHTML = '<input type="text" name="potassium" id="potassium" class="input_small_70px"  >';
		w.innerHTML = '<input type="text" name="Chloride" id="Chloride" class="input_small_70px"  >';
		x.innerHTML = '<input type="text" name="calcium" id="calcium" class="input_small_70px"  >';
		y.innerHTML = '<input type="text" name="megnisium" id="megnisium" class="input_small_50px"  >';
		z.innerHTML = '<input type="text" name="Bicarbonates" id="Bicarbonates" class="input_small_70px"  >';
		
		}
	
	else if (id == "cardiac")
		{
		
		var filas = document.getElementById("cardiac").rows.length;
		var a = document.getElementById(id).insertRow(filas);
		
		if (!document.getElementById("cardiac_date") == "") {
			alert("Please enter the data and Save...!");
			return false;
		}
		
		
		var p = a.insertCell(0);
		var q = a.insertCell(1);
		var r = a.insertCell(2);
		
		
		p.innerHTML = '<select class="input_table_DD" name="cardiac_select" id="cardiac_select"" ><option value="">Select</option><option>ECG</option><option>ECHO</option></select>';	
		q.innerHTML = '<input type="date" name="cardiac_date" id="cardiac_date" class="input_table_170px" >';
		r.innerHTML = '<textarea  rows="3" cols="50" name="cardiac_desc" id="cardiac_desc"></textarea>';
		
		}
	
	else if (id == "imaging_table")
	{
	
	var filas = document.getElementById("imaging_table").rows.length;
	var a = document.getElementById(id).insertRow(filas);
	
	if (!document.getElementById("image_date") == "") {
		alert("Please enter the data and Save...!");
		return false;
	}
	
	
	var p = a.insertCell(0);
	var q = a.insertCell(1);
	var r = a.insertCell(2);
	
	
	p.innerHTML = '<select class="input_table_DD" name="image_select" id="image_select" ><option value="">Select</option><option>X-Ray</option><option>MRI</option><option>CT-Scan</option><option>USG</option><option>MAMMOGRAPHY</option</select>';	
	q.innerHTML = '<input type="date" name="image_date" id="image_date" class="input_table_170px" >';
	r.innerHTML = '<textarea  rows="2" cols="30" name="image_desc" id="image_desc"></textarea>';
	
	}
	
	else if (id == "nuclear_table")
	{
	
	var filas = document.getElementById("nuclear_table").rows.length;
	var a = document.getElementById(id).insertRow(filas);
	
	if (!document.getElementById("nuclear_date") == "") {
		alert("Please enter the data and Save...!");
		return false;
	}
	
	
	var p = a.insertCell(0);
	var q = a.insertCell(1);
	var r = a.insertCell(2);
	
	
	p.innerHTML = '<select class="input_table_DD" name="nuclear_select" id="nuclear_select" ><option value="">Select</option><option>PET SCAN</option><option>BONE SCAN</option><option>RENAL SCAN</option><option>THYROID SCAN</option><option>SENTINAL SCAN</option><option>OTHERS</option></select>';	
	q.innerHTML = '<input type="date" name="nuclear_date" id="nuclear_date" class="input_table_170px" >';
	r.innerHTML = '<textarea  rows="2" cols="30" name="nuclear_desc" id="nuclear_desc"></textarea>';
	
	}
	
	else if (id == "lipidTable")
	{
	
	var filas = document.getElementById("lipidTable").rows.length;
	var a = document.getElementById(id).insertRow(filas);
	
	if (!document.getElementById("lipidDate") == "") {
		alert("Please enter the data and Save...!");
		return false;
	}
	
	var p = a.insertCell(0);
	var q = a.insertCell(1);
	var r = a.insertCell(2);
	var s = a.insertCell(3);
	var t = a.insertCell(4);
	var w = a.insertCell(5);
	
	p.innerHTML = '<input type="date" name="lipidDate" id="lipidDate" class="input_table_170px" >';	
	q.innerHTML = '<input type="text" name="tc" id="tc" class="input_small_50px" >';
	r.innerHTML = '<input type="text" name="tryg" id="tryg" class="input_table_170px" >';
	s.innerHTML = '<input type="text" name="hdl" id="hdl" class="input_small_50px" >';
	t.innerHTML = '<input type="text" name="ldl" id="ldl" class="input_small_50px">';
	w.innerHTML = '<input type="text" name="vldl" id="vldl" class="input_small_50px">';
	
	}
	
	
	else if (id == "thyroidTable")
	{
	
	var filas = document.getElementById("thyroidTable").rows.length;
	var a = document.getElementById(id).insertRow(filas);
	
	if (!document.getElementById("thyroidDate") == "") {
		alert("Please enter the data and Save...!");
		return false;
	}
	
	var p = a.insertCell(0);
	var q = a.insertCell(1);
	var r = a.insertCell(2);
	var s = a.insertCell(3);
	//var t = a.insertCell(4);
	//var w = a.insertCell(5);
	
	
	p.innerHTML = '<input type="date" name="thyroidDate" id="thyroidDate" class="input_table_170px" >';	
	q.innerHTML = '<input type="text" name="ts" id="ts" class="input_small_50px" >';
	r.innerHTML = '<input type="text" name="t4" id="t4" class="input_table_170px" >';
	s.innerHTML = '<input type="text" name="tsh" id="tsh" class="input_small_50px" >';
	//t.innerHTML = '<input type="text" name="ldl" id="ldl" class="input_small_50px">';
	//w.innerHTML = '<input type="text" name="vldl" id="vldl" class="input_small_50px">';
		}
	
	
	else if (id == "cytology")
	{
	
	var filas = document.getElementById("cytology").rows.length;
	var a = document.getElementById(id).insertRow(filas);
	
	if (!document.getElementById("c1_num") == "") {
		alert("Please enter the data and Save...!");
		return false;
	}
	
	var p = a.insertCell(0);
	var q = a.insertCell(1);
	var r = a.insertCell(2);
	//var s = a.insertCell(3);
	//var t = a.insertCell(4);
	var w = a.insertCell(3);
	var x = a.insertCell(4);
	
	p.innerHTML = '<input type="text" name="c1_num" id="c1_num" class="input_small_70px">';	
	q.innerHTML = '<input type="date" name="c1_date" id="c1_date" class="input_table_170px" >';
	r.innerHTML = '<input type="text" list="type_list" name="c1_type" id="c1_type" onkeyup="getDiseaseType(this.value)" onchange="move("c1")" class="input_table_170px"><datalist id="type_list"><div id="DDDisplay"></div>';
	//s.innerHTML = '<datalist id="type_list1">';
	//t.innerHTML = '<div id="DDDisplay1"></div>';
	w.innerHTML = '<input type="text" name="c1_type_text" id="c1_type_text" class="input_table_170px" >';
	x.innerHTML = '<select id="c1_grade" name="c1_grade" class="input_table_DD"><option value="">Select</option><option value="WELL DIFFERENTIATED">WELL DIFFERENTIATED</option><option value="MODERATELY DIFFERENTIATED">MODERATELY DIFFERENTIATED</option><option value="POORLY DIFFERENTIATED">POORLY DIFFERENTIATED</option></select>';
	
		}
	
	
	
	else if (id == "histopathology")
	{
	
	var filas = document.getElementById("histopathology").rows.length;
	var a = document.getElementById(id).insertRow(filas);
	
	if (!document.getElementById("H1_num") == "") {
		alert("Please enter the data and Save...!");
		return false;
	}
	
	var p = a.insertCell(0);
	var q = a.insertCell(1);
	var r = a.insertCell(2);
	//var s = a.insertCell(3);
	//var t = a.insertCell(4);
	var w = a.insertCell(3);
	var x = a.insertCell(4);
	var y = a.insertCell(5);
	
	p.innerHTML = '<input type="text" name="H1_num" id="H1_num" class="input_small_70px">';	
	q.innerHTML = '<input type="date" name="H1_date" id="H1_date" class="input_table_170px" >';
	r.innerHTML = '<input type="text" list="type_list" name="H1_type" id="H1_type" onkeyup="getDiseaseType(this.value)" onchange="move("H1")" class="input_table_170px"><datalist id="type_list"><div id="DDDisplay"></div>';
	//s.innerHTML = '<datalist id="type_list">';
	//t.innerHTML = '<div id="DDDisplay"></div>';
	w.innerHTML= '<input type="text" name="H1_labname" id="H1_labname" class="input_table_170px" >';
	x.innerHTML = '<input type="text" name="H1_type_text" id="H1_type_text" class="input_table_170px" >';
	y.innerHTML = '<select id="H1_grade" name="H1_grade" class="input_table_DD"><option value="">Select</option><option value="WELL DIFFERENTIATED">WELL DIFFERENTIATED</option><option value="MODERATELY DIFFERENTIATED">MODERATELY DIFFERENTIATED</option><option value="POORLY DIFFERENTIATED">POORLY DIFFERENTIATED</option></select>';
	
		}
	
}


