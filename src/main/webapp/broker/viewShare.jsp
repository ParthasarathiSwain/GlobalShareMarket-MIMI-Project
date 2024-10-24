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
								<h6 class="mb-0">View Share</h6>
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
										<th>Name</th>
										<th>Company Name</th>
										<th>Date</th>
										<th>Quantity</th>
										<th>Amount</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="viewShare">
									

									
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<form id="makeTransaction" >
								<h5 class="mb-4">Buy Share</h5>
								<div class="row mb-3">
									<label for="userName" class="col-sm-3 col-form-label">Company</label>
									<div class="col-sm-9">
										<input type="text" name="compName" id="userName" class="form-control" readonly>
										<input type="hidden" name="event" value="makeTransaction">
										<input type="hidden" name="sId" id="sId" value="">
									</div>
								</div>
								<div class="row mb-3">
									<label for="sQty" class="col-sm-3 col-form-label">Share Quantity</label>
									<div class="col-sm-9">
										<input type="number" name="sQty" class="form-control" id="sQty" max="20" min="1" value="1" >
										<input type="hidden" name="sAmount" id="unitprice" value="">
									</div>
								</div>
								<div class="row mb-3">
									<label for="tPrice" class="col-sm-3 col-form-label">Total Price</label>
									<div class="col-sm-9">
										<h2  name="tPrice" id="tPrice" ></h2>
										
									</div>
								</div>
								<div class="row mb-3">
									<label for="sAmount" class="col-sm-3 col-form-label">Bank Account</label>
									<div class="col-sm-9">
										<select name="accId"  class="form-control" id="">
										<option>Choose Bank Acount</option>
									
										<%
										int userId=(int) request.getSession(false).getAttribute("id");
										Connection con = DbConnection.getConnection();
									    String sql="SELECT accId,accName FROM account where  acctStatus=1 and userId="+userId;
									    PreparedStatement ps=con.prepareStatement(sql);  
									    
									    ResultSet rs=ps.executeQuery();  
									    while(rs.next())
									    {
									    	%>
									    	<option   value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
									    	<% 
									    }
									    %>
									</select>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<input type="Submit"  value="Pay" class="btn btn-info px-4">
											
										</div>
									</div>
								</div>
								</form>
				</div>
				
			</div>
		</div>
	</div>						
	<%@include file="include/footer.jsp"%>
	<script>
  	$(document).ready(function(){  		  		
  		$("#sQty").change(function () {
  			
  			const price=$('#unitprice').val();  			
  			$('#tPrice').html(($(this).val()*price)); 
  		});
  	});
  </script>
	<script>
			 $(document).on('click', '.buyNow', function() {
				 sId = $(this).attr('id');                	 
                	$("#exampleModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../share',
					data:{'sId':sId,'event':'fatchShareById'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						var s4='';
						s4+=data[0].sAmount;
						$("#sId").val(data[0].sId);
						$("#userName").val(data[0].userName);
						$("#unitprice").val(data[0].sAmount);
						$('#tPrice').html(s4);
  				},
				error:function(jqXHR,textStatus,errorThrown){
					$.toast({
		  		  	    text: "Something went wrong on server!", 
		  		  	    heading: 'Failed...', 
		  		  	    icon: 'error', 
		  		  	    showHideTransition: 'slide', 
		  		  	    allowToastClose: true, 
		  		  	    hideAfter: 3000, 
		  		  	    stack: 10, 
		  		  	    position: 'top-center',         
		  		  	    textAlign: 'left',  
		  		  	    loader: true,
		  		  	    loaderBg: '#9EC600', 
		  		  	});
  				}
			});	
                	   
		 });
     </script>
	<script>
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		$("#makeTransaction").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"../transaction",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					window.location.href = 'viewShare.jsp';		  				
			  		  		}else{
					  		  		$.toast({
					  		  	    text: "Something went wrong on server!", 
					  		  	    heading: 'Failed...', 
					  		  	    icon: 'error', 
					  		  	    showHideTransition: 'slide', 
					  		  	    allowToastClose: true, 
					  		  	    hideAfter: 3000, 
					  		  	    stack: 10, 
					  		  	    position: 'top-center',         
					  		  	    textAlign: 'left',  
					  		  	    loader: true,
					  		  	    loaderBg: '#9EC600', 
					  		  	});
			  		  		}
		  				},		  				
						error:function(jqXHR,textStatus,errorThrown){
							console.log("error...")
							$.toast({
				  		  	    text: "Something went wrong on server!", 
				  		  	    heading: 'Failed...', 
				  		  	    icon: 'error', 
				  		  	    showHideTransition: 'slide', 
				  		  	    allowToastClose: true, 
				  		  	    hideAfter: 3000, 
				  		  	    stack: 10, 
				  		  	    position: 'top-center',         
				  		  	    textAlign: 'left',  
				  		  	    loader: true,
				  		  	    loaderBg: '#9EC600', 
				  		  	});
		  				} 				
		  			});
		  		});
		  	});
		  </script>
	
	<script type="text/javascript">
		$(document).ready(function() {
				let event ="event=viewAllShare";
	        	$.ajax({
	    			url:"../share",
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
		    					  s+="<td>"+data[key].sName+"</td>";
		    					  s+="<td>"+data[key].userName+"</td>";
		    					  s+="<td>"+data[key].sDate+"</td>";
		    					  s+="<td>"+data[key].sQty+"</td>";
		    					  s+="<td>"+data[key].sAmount+"</td>";
		    					  s+="<td><span class='badge bg-gradient-quepal text-white shadow-sm w-100'>Active</span></td>";
		    					  s+="<td><div class='col'>";
		    					  s+="<button type='button' id="+data[key].sId+"  class=' buyNow btn btn-outline-success px-5 radius-30'>Buy Now</button>";
		    					  s+="<div></td>";
	    					  }
	    					}
	    					i++;
	    				}
	    				$('#viewShare').html(s);
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