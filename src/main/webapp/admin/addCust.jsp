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

				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="card">
							<div class="card-body p-4">
							<form id="custRedg" >
								<h5 class="mb-4">Add Customer Form</h5>
								<div class="row mb-3">
									<label for="userName" class="col-sm-3 col-form-label">Enter Your Name</label>
									<div class="col-sm-9">
										<input type="hidden" name="event" value="custRedg">	
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
								<div class="row mb-3">
										<label for="userImg" class="col-sm-3 col-form-label"> Photo</label>
										<div class="col-sm-9">
											<input type="file" class="form-control" placeholder="Photo" id="userImg" name="userImg">
										</div>
								</div>
								
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="input41">
											<label class="form-check-label" for="input41">Check me out</label>
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<input type="Submit"  vlaue="Submit" class="btn btn-primary px-4">
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
		  		
		  		$("#custRedg").on('submit',function(event){
		  			event.preventDefault();
					var f=new FormData($(this)[0]);
					$.ajax({
		  				url:"../custController",
		  				data:f,
		  				type:'POST',
		  				async: false,
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
			  					$('#custRedg')[0].reset();		  				
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
		  				cache: false,
		  		        contentType: false,
		  		        processData: false,
		  		        
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
		  			return false;
		  		});
		  	});
		  </script>
</body>
</html>