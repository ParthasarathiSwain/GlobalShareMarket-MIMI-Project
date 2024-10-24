<%
if (session.getAttribute("name") == null || session.getAttribute("name").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
<!doctype html>
<html lang="en">

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
<title>GSM Broker Dashboard </title>
</head>
<body>
	<!--wrapper-->
	<div class="wrapper">

		<%@include file="include/header.jsp"%>
		<%@include file="include/sidebar.jsp"%>

		<!--start page wrapper -->
		<div class="page-wrapper">
			<div class="page-content">

				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="card">
							<div class="card-body p-4">
							<form id="addAccount" >
								<h5 class="mb-4">Add Account</h5>
								<div class="row mb-3">
									<label for="accName" class="col-sm-3 col-form-label">Account Name</label>
									<div class="col-sm-9">
										<input type="hidden" name="event" value="addAccount">	
										<input type="text" name="accName" class="form-control" id="accName" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="accNumber" class="col-sm-3 col-form-label">Account Number</label>
									<div class="col-sm-9">
										<input type="text" name="accNumber" class="form-control" id="accNumber" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="balance" class="col-sm-3 col-form-label">Account Balance</label>
									<div class="col-sm-9">
										<input type="text" name="balance" class="form-control" id="balance" >
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<input type="Submit"  value="Submit" class="btn btn-primary px-4">
											<button type="button" class="btn btn-light px-4">Reset</button>
										</div>
									</div>
								</div>
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			<%@include file="include/footer.jsp"%>
			 
      <script>
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		
		  		$("#addAccount").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"../account",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					$.toast({
			  					    text: "Successfully insert!", 
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
			  					$('#addAccount')[0].reset();		  				
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
</body>
</html>