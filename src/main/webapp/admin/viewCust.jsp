<%
if (session.getAttribute("name") == null || session.getAttribute("name").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
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
<title>GSM Admin Dashboard </title>
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
								<h6 class="mb-0">View Customers</h6>
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
										<th>Photo</th>
										<th>Email</th>
										<th>Password</th>
										<th>Phone</th>
										<th>Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="viewCust">
									

									
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
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<form id="custUpdate" >
								<h5 class="mb-4">Edit Customer </h5>
								<div class="row mb-3">
									<label for="userName" class="col-sm-3 col-form-label">Enter Your Name</label>
									<div class="col-sm-9">
										<input type="hidden" name="event" value="updateCust">
										<input type="hidden" name="userId" id="userId" value="">		
										<input type="text" name="userName" class="form-control" id="userName" placeholder="Enter Your Name">
									</div>
								</div>
								<div class="row mb-3">
									<label for="userPhone" class="col-sm-3 col-form-label">Phone No</label>
									<div class="col-sm-9">
										<input type="text" name="userPhone" class="form-control" id="userPhone" placeholder="Phone No">
									</div>
								</div>
								<div class="row mb-3">
									<label for="userEmail" class="col-sm-3 col-form-label">Email Address</label>
									<div class="col-sm-9">
										<input type="email" name="userEmail" class="form-control" id="userEmail" placeholder="Email Address">
									</div>
								</div>
								
								<div class="row mb-3">
									<label for="userPass" class="col-sm-3 col-form-label"> Password</label>
									<div class="col-sm-9">
										<input type="password" name="userPass" class="form-control" id="userPass" placeholder="Choose Password">
									</div>
								</div>
								<div class=" mb-6">
									<input class="form-check-input" name="userStatus" value="1" type="radio" required id="isActive" >&nbsp;&nbsp;<b>Active</b>&nbsp;
									<input class="form-check-input" name="userStatus"  value="0" type="radio" required id="isActive" >&nbsp;&nbsp;&nbsp;<b>Deactive</b>
								</div>
								
								
								<div class="row">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<input type="Submit"  value="Submit" class="btn btn-primary px-4">
											
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
		  		console.log("page is ready .....")
		  		
		  		$("#custUpdate").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"../custController",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					window.location.href = 'viewCust.jsp';		  				
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
	<script>
			 $(document).on('click', '.cust_edit', function() {
				 userId = $(this).attr('id');                	 
                	$("#exampleModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../custController',
					data:{'userId':userId,'event':'fatchCustById'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						var selectedOption = "isActive";
						$("#userId").val(data[0].userId);
	    				$("#userName").val(data[0].userName);
	    				$("#userEmail").val(data[0].userEmail);
	    				$("#userPass").val(data[0].userPass);
	    				$("#userPhone").val(data[0].userPass);
	    				$('#' + selectedOption).prop('checked', data[0].userStatus);
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
	<script type="text/javascript">
		$(document).ready(function() {
				getData();
				function getData(){
	        	let event ="event=viewCustomers";
	        	$.ajax({
	    			url:"../custController",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);	    				
	    				 let s="";
	    				 let i=1;
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    						var status=data[key].userStatus;
	    					  if(status==1){
	    						  s+="<tr >";
		    					  s+="<td>"+i+"</td>";
		    					  s+="<td>"+data[key].userName+"</td>";
		    					  s+="<td><img src='../images/custImg/"+data[key].userImg+"' class='product-img-2' ></td>";
		    					  s+="<td>"+data[key].userEmail+"</td>";
		    					  s+="<td>"+data[key].userPass+"</td>";
		    					  s+="<td>"+data[key].userPhone+"</td>";
		    					  s+="<td>"+data[key].redgDate+"</td>";
		    					  s+="<td><span class='badge bg-gradient-quepal text-white shadow-sm w-100'>Active</span></td>";
		    					  
		    					  s+="<td><div class='d-flex order-actions'><a class=' bg-primary cust_edit'  id='"+data[key].userId+"'><i class='bx bxs-edit'></i></a>&nbsp";
		    					  s+="<a class='cust_delete bg-danger'  id='"+data[key].userId+"'><i class='bx bxs-trash'></i></a><div></td>";
	    					  }else{
	    						  s+="<tr >";
		    					  s+="<td>"+i+"</td>";
		    					  s+="<td>"+data[key].userName+"</td>";
		    					  s+="<td><img src='../images/custImg/"+data[key].userImg+"' class='product-img-2' ></td>";
		    					  s+="<td>"+data[key].userEmail+"</td>";
		    					  s+="<td>"+data[key].userPass+"</td>";
		    					  s+="<td>"+data[key].userPhone+"</td>";
		    					  s+="<td>"+data[key].redgDate+"</td>";
		    					  s+="<td><span class='badge bg-warning text-white shadow-sm w-100'>Pending</span></td>";
		    					  s+="<td><div class='d-flex order-actions'><a class='bg-primary  cust_edit'  id='"+data[key].userId+"'><i class='bx bxs-edit'></i></a>&nbsp";
		    					  s+="<a   ><i class='bx bxs-trash'></i></a></div></td>";
	    					  }
	    					}
	    					i++;
	    				}
	    				$('#viewCust').html(s);
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    			}
	    	    });
			  }
				 $(document).on('click', '.cust_delete', function() {
					 userId = $(this).attr('id');
	                 if (confirm('Are you sure you want to Deactivated this account ?')) {
	              $.ajax({
					    type:'POST',
					    url:'../custController',
						data:{'userId':userId,'event':'cust_delete'},
						method:'POST',
						
						success:function(data,textStatus,jqXHR){
	  						if(data.trim() ==='done'){	  							
	  							$.toast({
	  		  					    text: "Successfully Deactivated !!", 
	  		  					    heading: 'Success...', 
	  		  					    icon: 'success',
	  		  					    showHideTransition: 'slide', 
	  		  					    allowToastClose: true, 
	  		  					    hideAfter: 3000, 
	  		  					    stack: 10, 
	  		  					    position: 'top-center',            
	  		  					    textAlign: 'left',  
	  		  					    loader: true,  
	  		  					    loaderBg: '#24ffb6',
	  		  					});
		  		  				$('#msg').html("");
		  		  			    $('#viewCust').html('');
		  		  			    getData();
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
						console.log("error...");
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
	              } //confirm end   
			  });
	        });
		</script>
</body>
</html>