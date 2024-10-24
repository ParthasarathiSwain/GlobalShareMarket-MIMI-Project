<%
if (session.getAttribute("name") == null || session.getAttribute("name").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
<%@page import="com.otz.util.DbConnection" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--favicon-->
<link rel="icon" href="../assets/images/favicon-32x32.png" type="image/png" />
<!--plugins-->
<link href="../assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
<link href="../assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
<link href="../assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
<link href="../assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
<!-- loader-->
<link href="../assets/css/pace.min.css" rel="stylesheet" />
<script src="../assets/js/pace.min.js"></script>
<!-- Bootstrap CSS -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/css/bootstrap-extended.css" rel="stylesheet">
<link href="../https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
<link href="../assets/css/app.css" rel="stylesheet">
<link href="../assets/css/icons.css" rel="stylesheet">
<!-- Theme Style CSS -->
<link rel="stylesheet" href="../assets/css/dark-theme.css" />
<link rel="stylesheet" href="../assets/css/semi-dark.css" />
<link rel="stylesheet" href="../assets/css/header-colors.css" />
<link href="../assets/jquery-toast/src/jquery.toast.css" rel="stylesheet" />
 <link href="../assets/jquery-toast/dist/jquery.toast.min.css" rel="stylesheet" />
<title>GSM Company Dashboard </title>
</head>
<body>
	<!--wrapper-->
	<div class="wrapper">

		<%@include file="include/header.jsp"%>
		<%@include file="include/sidebar.jsp"%>

		<!--start page wrapper -->
		<div class="page-wrapper">
			<div class="page-content">
				<div class="card radius-10">
					<div class="card-header">
						<div class="d-flex align-items-center">
							<div>
								<h6 class="mb-0">View Transaction</h6>
							</div>
							<div class="dropdown ms-auto">
								<a class="dropdown-toggle dropdown-toggle-nocaret" href="#"
									data-bs-toggle="dropdown"><i
									class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
								</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="javascript:;">Action</a> </li>
									<li><a class="dropdown-item" href="javascript:;">Another action</a></li>
									<li> <hr class="dropdown-divider"> </li>
									<li><a class="dropdown-item" href="javascript:;">Something else here</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle mb-0">
								<thead class="table-light">
									<tr>
										<th>#</th>
										<th>Company Name</th>
										<th>Buyer</th>
										<th>Share Name</th>
										<th>Bank </th>
										<th>Account Number</th>
										<th>Date</th>
										<th>Quantity</th>
										<th>Amount</th>
										<th>Total Amount</th>
										<th>Status</th>
										
									</tr>
								</thead>
								<tbody id="viewTran">
									

									
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Modal -->

	<%@include file="include/footer.jsp"%>

	

	
	<script type="text/javascript">
		$(document).ready(function() {
				let event ="event=viewAllTransaction";
	        	$.ajax({
	    			url:"../transaction",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);	    				
	    				 let s="";
	    				 let i=1;
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    						var status=data[key].status;
	    						  if(status==1){
	    							  s+="<tr >";
			    					  s+="<td>"+i+"</td>";
			    					  s+="<td>"+data[key].compName+"</td>";
			    					  s+="<td>"+data[key].userName+"</td>";
			    					  s+="<td>"+data[key].sName+"</td>";
			    					  s+="<td>"+data[key].accName+"</td>";
			    					  s+="<td>"+data[key].accNumber+"</td>";
			    					  s+="<td>"+data[key].tDate+"</td>";
			    					  s+="<td>"+data[key].sQty+"</td>";
			    					  s+="<td>"+data[key].sAmount+"</td>";
			    					  s+="<td>"+data[key].totalAmount+"</td>";
			    					  s+="<td><span class='badge bg-gradient-quepal text-white shadow-sm w-100'>Active</span></td>";
			    				
	    						  }else{
	    							  s+="<tr >";
			    					  s+="<td>"+i+"</td>";
			    					  s+="<td>"+data[key].compName+"</td>";
			    					  s+="<td>"+data[key].userName+"</td>";
			    					  s+="<td>"+data[key].sName+"</td>";
			    					  s+="<td>"+data[key].accName+"</td>";
			    					  s+="<td>"+data[key].accNumber+"</td>";
			    					  s+="<td>"+data[key].tDate+"</td>";
			    					  s+="<td>"+data[key].sQty+"</td>";
			    					  s+="<td>"+data[key].sAmount+"</td>";
			    					  s+="<td>"+data[key].totalAmount+"</td>";
			    					  s+="<td><span class='badge bg-warning text-white shadow-sm w-100'>Pending</span></td>";
			    				
	    						  }
	    					}
	    					i++;
	    				}
	    				$('#viewTran').html(s);
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    			}
	    	    });
			  
				 
	        });
		</script>
</body>
</html>