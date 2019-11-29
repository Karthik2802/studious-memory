/**
 * 
 */

$(document).ready(
		function() {
			
			/* saving other test table */

			$('#othertest').click(function() {

			
				var patinetID = $('#patinetID').val();
				var UpdatedBy=$('#patientInves_updatedby').val();
				var UpdatedTime=$('#patientInves_updatedtime').val();

				var other1 = $('#other1').val();
				var other2 = $('#other2').val();
				var other3 = $('#other3').val();
				var other4 = $('#other4').val();

				if (other1 == '') {
					alert("Please Enter the Empty Field");
					return false;
				} else if (other1 == undefined) {
					alert("please insert the Row");
					return false;
				}

				$.ajax({

					type : "post",
					url : "Investigation_tables", // this is my servlet

					data : {

						TableIdentifier : "OtherTestTable",
						patinetID : $('#patinetID').val(),
						 UpdatedBy :$('#patientInves_updatedby').val(),
						 UpdatedTime :$('#patientInves_updatedtime').val(),

						other1 : $('#other1').val(),
						other2 : $('#other2').val(),
						other3 : $('#other3').val(),
						other4 : $('#other4').val(),

					},

					success : function(msg) {
						
						var TumorHTML = '';
						$.each(msg, function(i, value) {
							
							TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td></tr>';
						});
						$('#otherTestTable tbody').append(TumorHTML);
						$('#otherID').load(' #otherID');
					}

				});

			});
			
			
			

			

		
			
		});

function saveTable(id)
{
	
	
	
	
	
	if(id=="investtable")
		{
		var patinetID = $('#patinetID').val();
		var UpdatedBy=$('#patientInves_updatedby').val();
		var UpdatedTime=$('#patientInves_updatedtime').val();

		var investicationdate = $('#investicationdate').val();
		var hb = $('#hb').val();
		var tc = $('#tc').val();
		var dc = $('#dc').val();
		var platelets = $('#platelets').val();
		var Rbs = $('#Rbs').val();
		var Fbs = $('#Fbs').val();
		var Ppbs = $('#Ppbs').val();
		/*var Urea = $('#Urea').val();
		var Creatinine = $('#Creatinine').val();
		var Sodium = $('#Sodium').val();
		var potassium = $('#potassium').val();
		var Chloride = $('#Chloride').val();
		var Bicarbonates = $('#Bicarbonates').val();*/

		if (investicationdate == '') {
			alert('Date-field is empty.');
			return false;

		} else if (investicationdate == undefined) {
			alert('Add the Row to Enter data');

			return false;

		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my servlet

			data : {
				TableIdentifier : "investtable",

				 patinetID : $('#patinetID').val(),
				 UpdatedBy :$('#patientInves_updatedby').val(),
				 UpdatedTime :$('#patientInves_updatedtime').val(),

				investicationdate : $('#investicationdate').val(),
				hb : $('#hb').val(),
				tc : $('#tc').val(),
				dc : $('#dc').val(),
				platelets : $('#platelets').val(),
				Rbs : $('#Rbs').val(),
				Fbs : $('#Fbs').val(),
				Ppbs : $('#Ppbs').val(),
				/*Urea : $('#Urea').val(),
				Creatinine : $('#Creatinine').val(),
				Sodium : $('#Sodium').val(),
				potassium : $('#potassium').val(),
				Chloride : $('#Chloride').val(),
				Bicarbonates : $('#Bicarbonates').val(),*/
				updatedby : $('#updatedby').val(),
				updatedtime : $('#updatedtime').val(),
			},

			success : function(msg) {
				var TumorHTML = '';
				$.each(msg, function(i, value) {
					
					TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td><td>' + value[12]+ '</td><td>' + value[13]+ '</td></tr>';
				});
				$('#InvestigationTable tbody').append(TumorHTML);
				$('#inv_ID').load(' #inv_ID');
			}

		});
		
		}
	
	
	if(id=="renal")
	{
	var patinetID = $('#patinetID').val();
	var UpdatedBy=$('#patientInves_updatedby').val();
	var UpdatedTime=$('#patientInves_updatedtime').val();

	var renalDate = $('#renalDate').val();
	
	
	var Urea = $('#Urea').val();
	var Creatinine = $('#Creatinine').val();
	var Sodium = $('#Sodium').val();
	var potassium = $('#potassium').val();
	var Chloride = $('#Chloride').val();
	
	var calcium = $('#calcium').val();
	var megnisium = $('#megnisium').val();	
	
	var Bicarbonates = $('#Bicarbonates').val();

	if (renalDate == '') {
		alert('Date-field is empty.');
		return false;

	} else if (renalDate == undefined) {
		alert('Add the Row to Enter data');

		return false;

	}

	$.ajax({

		type : "post",
		url : "Investigation_tables", // this is my servlet

		data : {
			TableIdentifier : "renaltable",

			 patinetID : $('#patinetID').val(),
			 UpdatedBy :$('#patientInves_updatedby').val(),
			 UpdatedTime :$('#patientInves_updatedtime').val(),

			 renalDate : $('#renalDate').val(),			 
			
			 
			Urea : $('#Urea').val(),
			Creatinine : $('#Creatinine').val(),
			Sodium : $('#Sodium').val(),
			potassium : $('#potassium').val(),
			Chloride : $('#Chloride').val(),
			
			calcium : $('#calcium').val(),			
			megnisium : $('#megnisium').val(),
			
			Bicarbonates : $('#Bicarbonates').val(),
			
			updatedby : $('#updatedby').val(),
			updatedtime : $('#updatedtime').val(),
		},

		success : function(msg) {
			/*var TumorHTML = '';
			$.each(msg, function(i, value) {
				
				TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td><td>' + value[12]+ '</td><td>' + value[13]+ '</td></tr>';
			});
			$('#InvestigationTable tbody').append(TumorHTML);*/
			$('#renal_ID').load(' #renal_ID');
		}

	});
	
	}
	
	
	if(id=="liverFunction")
		{
		var patinetID = $('#patinetID').val();
		var UpdatedBy=$('#patientInves_updatedby').val();
		var UpdatedTime=$('#patientInves_updatedtime').val();

		var liverDate = $('#liverDate').val();
		var bilirubintotal = $('#bilirubintotal').val();
		var Direct = $('#Direct').val();
		var Indirect = $('#Indirect').val();
		var proteintotal = $('#proteintotal').val();
		var Albumin = $('#Albumin').val();
		var Globumin = $('#Globumin').val();
		var Ratio = $('#Ratio').val();
		var SGOT = $('#SGOT').val();
		var SGPT = $('#SGPT').val();
		var ALP = $('#ALP').val();
		var GGT = $('#GGT').val();
		var Chloride = $('#Chloride').val();
		var Bicarbonates = $('#Bicarbonates').val();

		if (liverDate == '') {
			alert('Date-field is empty.');
			return false;
		} else if (liverDate == undefined) {
			alert('Add the Row to Enter data');

			return false;

		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my servlet

			data : {

				TableIdentifier : "liversave",
				 patinetID : $('#patinetID').val(),
				 UpdatedBy :$('#patientInves_updatedby').val(),
				 UpdatedTime :$('#patientInves_updatedtime').val(),
				liverDate : $('#liverDate').val(),
				bilirubintotal : $('#bilirubintotal').val(),
				Direct : $('#Direct').val(),
				Indirect : $('#Indirect').val(),
				proteintotal : $('#proteintotal').val(),
				Albumin : $('#Albumin').val(),
				Globumin : $('#Globumin').val(),
				Ratio : $('#Ratio').val(),
				SGOT : $('#SGOT').val(),
				SGPT : $('#SGPT').val(),
				ALP : $('#ALP').val(),
				GGT : $('#GGT').val(),
				updatedby : $('#updatedby').val(),
				updatedtime : $('#updatedtime').val(),
			},

			success : function(msg) {
				
				var TumorHTML = '';
				$.each(msg, function(i, value) {
					
					TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td></tr>';
				});
				$('#liverFunctionTable tbody').append(TumorHTML);
				$('#liverID').load(' #liverID');
			}
				
			

		});
		
		}
	
	if(id=="Tumor_markers")
		{
		
			var patinetID = $('#se_patinetID').val();
			var UpdatedBy=$('#Serology_updatedby').val();
			var UpdatedTime=$('#Serology_updatedtime').val();
			
		
			var Serila_number = $('#seri_number').val();
			var tumor_marker = $('#tumor_number').val();
			var value = $('#value').val();
			var file = $('#file').val();
		
			if (Serila_number == '') {
				alert("Please Enter the Empty Field");
				return false;
			} else if (Serila_number == undefined) {
				alert("please insert the Row");
				return false;
			}
		
			$.ajax({
		
				type : "post",
				url : "Investigation_tables", // this is my
				// servlet
		
				data : {
		
					TableIdentifier : "tumorMarkerTable",
					patinetID : $('#se_patinetID').val(),
					UpdatedBy :$('#Serology_updatedby').val(),
					 UpdatedTime :$('#Serology_updatedtime').val(),
		
					Serila_number : $('#seri_number').val(),
					tumor_marker : $('#tumor_number').val(),
					value : $('#value').val(),
					file : $('#file').val(),
		
				},
		
				success : function(msg) {
					var TumorHTML = '';
					$.each(msg, function(i, value){
						
						TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td></tr>';
					});
					$('#tumor_marker tbody').append(TumorHTML);
					$('#tu_id').load(' #tu_id');
				}
		
			});
		
			
	
	
		}
	
	
	if(id=="Immuno")
	{
		
		
		var patinetID = $('#Tab3_patinetID').val();
		var UpdatedBy=$('#immuno_updatedby').val();
		var UpdatedTime=$('#immuno_updatedtime').val();
		

		var Serila_number = $('#Seril_number').val();
		var Immuno = $('#immunoHistoMaker').val();
		var Result = $('#Result').val();

		if (Serila_number == '') {
			alert("Please Enter the Empty Field");
			return false;
		} else if (Serila_number == undefined) {
			alert("please insert the Row");
			return false;
		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my
			// servlet

			data : {

				TableIdentifier : "Immuno",
				patinetID : $('#Tab3_patinetID').val(),
				
				UpdatedBy :$('#immuno_updatedby').val(),
				 UpdatedTime :$('#immuno_updatedtime').val(),

				Serila_number : $('#Seril_number').val(),
				Immuno : $('#immunoHistoMaker').val(),
				Result : $('#Result').val(),

			},

			success : function(msg) {
				
				var TumorHTML = '';
				$.each(msg, function(i, value) {
					TumorHTML += '<tr class="child"><td>'
							+ value[0] + '</td><td>' + value[1]
							+ '</td><td>' + value[2]
							+ '</td></tr>';
				});
				$('#immuno_histo tbody').append(TumorHTML);
				$('#im_id').load(' #im_id');
			}

		});

		
		
		
	}
	
	
	if(id=="endoscopy")
	{
		
		
		var patinetID = $('#Tab3_patinetID').val();
		var UpdatedBy=$('#immuno_updatedby').val();
		var UpdatedTime=$('#immuno_updatedtime').val();
		

		var Endo_date = $('#endo_date').val();
		var endo_select = $('#endo_select').val();
		var endo_text = $('#endo_text').val();

		if (Endo_date == '') {
			alert("Please Enter the Empty Field");
			return false;
		} else if (Endo_date == undefined) {
			alert("please insert the Row");
			return false;
		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my
			// servlet

			data : {

				TableIdentifier : "EndoScopy",
				patinetID : $('#Tab3_patinetID').val(),
				UpdatedBy :$('#immuno_updatedby').val(),
				 UpdatedTime :$('#immuno_updatedtime').val(),

				Endo_date : $('#endo_date').val(),
				endo_select : $('#endo_select').val(),
				endo_text : $('#endo_text').val(),

			},

			success : function(msg) {
			
				var TumorHTML = '';
				$.each(msg, function(i, value) {
					TumorHTML += '<tr class="child"><td>'
							+ value[0] + '</td><td>' + value[1]
							+ '</td><td>' + value[2]
							+ '</td></tr>';
				});
				$('#endo tbody').append(TumorHTML);
				$('#endo_id').load(' #endo_id');
			}

		});

		
		
	}
	
	
	if(id=="cardiac")
	{
		
		var patinetID = $('#Tab3_patinetID').val();
		
		var UpdatedBy=$('#immuno_updatedby').val();
		var UpdatedTime=$('#immuno_updatedtime').val();		

		var cardiac_select = $('#cardiac_select').val();
		var cardiac_date = $('#cardiac_date').val();
		var cardiac_desc = $('#cardiac_desc').val();
		
		
		if (cardiac_select == '') {
			alert("Please Enter the Empty Field");
			return false;
		} else if (cardiac_select == undefined) {
			alert("please insert the Row");
			return false;
		}
		
		
		
		
		
		
		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my
			// servlet

			data : {

				TableIdentifier : "cardiac",
				patinetID : $('#Tab3_patinetID').val(),
				UpdatedBy :$('#immuno_updatedby').val(),
				 UpdatedTime :$('#immuno_updatedtime').val(),

				 cardiac_select : $('#cardiac_select').val(),
				 cardiac_date : $('#cardiac_date').val(),
				 cardiac_desc : $('#cardiac_desc').val(),

			},

			success : function(msg) {
				
				
			
				
				$('#cardiac').load(' #cardiac');
			}

		});
		
	
	}
	
	
	
	if(id=="img")
	{
		
		var patinetID = $('#Tab4_patinetID').val();
		
		var UpdatedBy=$('#others_updatedby').val();
		var UpdatedTime=$('#others_updatedtime').val();		

		var image_select = $('#image_select').val();
		var image_date = $('#image_date').val();
		var image_desc = $('#image_desc').val();		
		
		
		if (image_select == '') {
			alert("Please Enter the Empty Field");
			return false;
		} else if (image_select == undefined) {
			alert("please insert the Row");
			return false;
		}
		
		
		
		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my
			// servlet

			data : {

				TableIdentifier : "img_table",
				patinetID : $('#Tab4_patinetID').val(),
				UpdatedBy :$('#others_updatedby').val(),
				 UpdatedTime :$('#others_updatedtime').val(),

				 image_select : $('#image_select').val(),
				 image_date : $('#image_date').val(),
				 image_desc : $('#image_desc').val(),

			},

			success : function(msg) {
				
				//alert(msg);
			
				
				$('#image').load(' #image');
			}

		});
		
	
	}
	
	
	
	if(id=="nuclear")
	{
		
		var patinetID = $('#Tab4_patinetID').val();
		
		var UpdatedBy=$('#others_updatedby').val();
		var UpdatedTime=$('#others_updatedtime').val();		

		var nuclear_select = $('#nuclear_select').val();
		var nuclear_date = $('#nuclear_date').val();
		var nuclear_desc = $('#nuclear_desc').val();		
		
		if (nuclear_select == '') {
			alert("Please Enter the Empty Field");
			return false;
		} else if (nuclear_select == undefined) {
			alert("please insert the Row");
			return false;
		}
		
		
		
		
		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my
			// servlet

			data : {

				TableIdentifier : "Nuclear_table",
				patinetID : $('#Tab4_patinetID').val(),
				UpdatedBy :$('#others_updatedby').val(),
				 UpdatedTime :$('#others_updatedtime').val(),

				 nuclear_select : $('#nuclear_select').val(),
				 nuclear_date : $('#nuclear_date').val(),
				 nuclear_desc : $('#nuclear_desc').val(),

			},

			success : function(msg) {
				
				//alert(msg);
			
				
				$('#nuc_table').load(' #nuc_table');
			}

		});
		
	
	}
	
	
	
	if(id=="lipidprofile")
	{
		var patinetID = $('#patinetID').val();
		var UpdatedBy=$('#patientInves_updatedby').val();
		var UpdatedTime=$('#patientInves_updatedtime').val();

		var lipidDate = $('#lipidDate').val();
		
		
		var tc = $('#tc').val();
		var tryg = $('#tryg').val();
		var hdl = $('#hdl').val();
		var ldl = $('#ldl').val();
		var vldl = $('#vldl').val();
		
		
		if (lipidDate == '') {
			alert('Date-field is empty.');
			return false;

		} else if (lipidDate == undefined) {
			alert('Add the Row to Enter data');

			return false;

		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my servlet

			data : {
				TableIdentifier : "lipidtable",

				 patinetID : $('#patinetID').val(),
				 UpdatedBy :$('#patientInves_updatedby').val(),
				 UpdatedTime :$('#patientInves_updatedtime').val(),

				 lipidDate : $('#lipidDate').val(),			 
				
				 
				 tc : $('#tc').val(),
				tryg : $('#tryg').val(),
				hdl : $('#hdl').val(),
				ldl : $('#ldl').val(),
				vldl : $('#vldl').val(),
				
				
				updatedby : $('#patientInves_updatedby').val(),
				updatedtime : $('#patientInves_updatedtime').val(),
			},

			success : function(msg) {
				/*var TumorHTML = '';
				$.each(msg, function(i, value) {
					
					TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td><td>' + value[12]+ '</td><td>' + value[13]+ '</td></tr>';
				});
				$('#InvestigationTable tbody').append(TumorHTML);*/
				$('#lipidID').load(' #lipidID');
			}

		});
		
		}
	
	
	
	if(id=="thyroidfunction")
	{
		var patinetID = $('#patinetID').val();
		var UpdatedBy=$('#patientInves_updatedby').val();
		var UpdatedTime=$('#patientInves_updatedtime').val();

		var thyroidDate = $('#thyroidDate').val();
		
		
		var tc = $('#ts').val();
		var tryg = $('#t4').val();
		var hdl = $('#tsh').val();
		
		
		if (thyroidDate == '') {
			alert('Date-field is empty.');
			return false;

		} else if (thyroidDate == undefined) {
			alert('Add the Row to Enter data');

			return false;

		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my servlet

			data : {
				TableIdentifier : "thyroidtable",

				 patinetID : $('#patinetID').val(),
				 UpdatedBy :$('#patientInves_updatedby').val(),
				 UpdatedTime :$('#patientInves_updatedtime').val(),

				 thyroidDate : $('#thyroidDate').val(),			 
				
				 
				 ts : $('#ts').val(),
				t4 : $('#t4').val(),
				tsh : $('#tsh').val(),
				
				
				updatedby : $('#patientInves_updatedby').val(),
				updatedtime : $('#patientInves_updatedtime').val(),
			},

			success : function(msg) {
				/*var TumorHTML = '';
				$.each(msg, function(i, value) {
					
					TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td><td>' + value[12]+ '</td><td>' + value[13]+ '</td></tr>';
				});
				$('#InvestigationTable tbody').append(TumorHTML);*/
				$('#thyroidID').load(' #thyroidID');
			}

		});
		
		}
	
	// function for Cytology save 
	
	if(id=="Cytology_table")
	{
		var patinetID = $('#patinetID').val();
		var UpdatedBy=$('#patientInves_updatedby').val();
		var UpdatedTime=$('#patientInves_updatedtime').val();

		var c1_num = $('#c1_num').val();
		var c1_date = $('#c1_date').val();
		var c1_type = $('#c1_type').val();
		var c1_type_text = $('#c1_type_text').val();
		var c1_grade = $('#c1_grade').val();
		
		
		if (c1_num == '') {
			alert('Date-field is empty.');
			return false;

		} else if (c1_num == undefined) {
			alert('Add the Row to Enter data');

			return false;

		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my servlet

			data : {
				TableIdentifier : "cytologytable",

				 patinetID : $('#patinetID').val(),
				 UpdatedBy :$('#patientInves_updatedby').val(),
				 UpdatedTime :$('#patientInves_updatedtime').val(),

				 c1_num : $('#c1_num').val(),			 
				 c1_date : $('#c1_date').val(),
				 c1_type : $('#c1_type').val(),
				 c1_type_text : $('#c1_type_text').val(),
				 c1_grade : $('#c1_grade').val(),
				
				
				updatedby : $('#patientInves_updatedby').val(),
				updatedtime : $('#patientInves_updatedtime').val(),
			},

			success : function(msg) {
				/*var TumorHTML = '';
				$.each(msg, function(i, value) {
					
					TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td><td>' + value[12]+ '</td><td>' + value[13]+ '</td></tr>';
				});
				$('#InvestigationTable tbody').append(TumorHTML);*/
				$('#cytology_id').load(' #cytology_id');
			}

		});
		
		}
	
	
	
	// function for Histopathology save 
	
	if(id=="Histopathology_table")
	{
		var patinetID = $('#patinetID').val();
		var UpdatedBy=$('#patientInves_updatedby').val();
		var UpdatedTime=$('#patientInves_updatedtime').val();

		var H1_num = $('#H1_num').val();
		var H1_date = $('#H1_date').val();
		var H1_type = $('#H1_type').val();
		var H1_labname=$('#H1_labname').val();
		var H1_type_text = $('#H1_type_text').val();
		var H1_grade = $('#H1_grade').val();
		
		
		if (H1_num == '') {
			alert('Date-field is empty.');
			return false;

		} else if (H1_num == undefined) {
			alert('Add the Row to Enter data');

			return false;

		}

		$.ajax({

			type : "post",
			url : "Investigation_tables", // this is my servlet

			data : {
				TableIdentifier : "histopathologytable",

				 patinetID : $('#patinetID').val(),
				 UpdatedBy :$('#patientInves_updatedby').val(),
				 UpdatedTime :$('#patientInves_updatedtime').val(),

				 H1_num : $('#H1_num').val(),			 
				 H1_date : $('#H1_date').val(),
				 H1_type : $('#H1_type').val(),
				 H1_labname:$('#H1_labname').val(),
				 H1_type_text : $('#H1_type_text').val(),
				 H1_grade : $('#H1_grade').val(),
				
				
				updatedby : $('#patientInves_updatedby').val(),
				updatedtime : $('#patientInves_updatedtime').val(),
			},

			success : function(msg) {
				/*var TumorHTML = '';
				$.each(msg, function(i, value) {
					
					TumorHTML += '<tr class="child"><td>'+ value[0] + '</td><td>' + value[1]+ '</td><td>' + value[2]+ '</td><td>' + value[3]+ '</td><td>' + value[4]+ '</td><td>' + value[5]+ '</td><td>' + value[6]+ '</td><td>' + value[7]+ '</td><td>' + value[8]+ '</td><td>' + value[9]+ '</td><td>' + value[10]+ '</td><td>' + value[11]+ '</td><td>' + value[12]+ '</td><td>' + value[13]+ '</td></tr>';
				});
				$('#InvestigationTable tbody').append(TumorHTML);*/
				$('#histo_id').load(' #histo_id');
			}

		});
		
		}
	
	
}





function SaveImg(rowID,fileID,patientID,folderName)
{	
	
	
	/*alert(rowID);
	alert(fileID);
	alert(patientID);
	alert(folderName);
	alert($('input[type=file]')[0].files[0]);*/
	
	 var fd = new FormData();
	 
	 fd.append("rowID", rowID)
	 fd.append("patientID", patientID)	
	 fd.append("folderName", folderName)	
	 fd.append('file', $('input[type=file]')[0].files[0]); 

		$.ajax({

		
		type : "post",
		url : "ImageUpload", // servlet path for ajax call
		enctype: 'multipart/form-data',
		processData : false,
        contentType : false,
        cache : false,

		data : fd,
		
		
	
		success : function(msg)
		{
			
			if(msg=="endo")
				{
				$('#endo_id').load(' #endo_id');
				
				}
			else if(msg=="tumor")
					{
					$('#tu_id').load(' #tu_id');
					
					}
			else if(msg == "cardiac")
				{
				$('#card_id').load(' #card_id');
				}
			
			else if(msg == "xray")
			{
			$('#image').load(' #image');
			}
			else if(msg == "nuclear")
			{
			$('#nuc_table').load(' #nuc_table');
			}
			
			else if(msg == "Ivestigation_Test")
			{
			$('#inv_ID').load(' #inv_ID');
			}
			
			else if(msg == "Renal_Test")
			{
			$('#renal_ID').load(' #renal_ID');
			}
			
			else if(msg == "Liver_Function")
			{
			$('#liverID').load(' #liverID');
			}
			else if(msg == "others")
			{
			$('#otherID').load(' #otherID');
			}
			else if(msg == "Not uploaded")
			{
			alert("Image Not Uploaded, Please try again!");
			}
			else if(msg == "Lipid Function")
			{
				$('#lipidID').load(' #lipidID');
			}
			else if(msg == "Thyroid Function")
			{
				$('#thyroidID').load(' #thyroidID');
			}
				
			
		}

	});	

	
	
}





