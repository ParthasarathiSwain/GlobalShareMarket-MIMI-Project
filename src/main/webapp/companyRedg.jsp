<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>GSM</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<!-- Custom Stylesheet -->

 <script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
 <link rel="stylesheet" href="./css/style.css">
 <link href="./vendor/jquery-toast/src/jquery.toast.css" rel="stylesheet" />
 <link href="./vendor/jquery-toast/dist/jquery.toast.min.css" rel="stylesheet" />
</head>

<body class="@@dashboard">

	<div id="preloader">
		<i>.</i><i>.</i><i>.</i>
	</div>

	<div id="main-wrapper">

		<%@include file="include/header.jsp"%>
		<div class="authincation section-padding">
			<div class="container h-100">
				<div class="row justify-content-center h-100 align-items-center">
					<div class="col-xl-5 col-md-6">
						<div class="mini-logo text-center my-4">
							<a href="#"><img src="./images/ll.png" alt=""></a>
							
						</div>
						<div class="auth-form card">
							<div class="card-body">
							<h4>Company Registration</h4>
								<form id="companyRedg" class="signin_validate row g-2">
									<div class="col-12">
										<input type="text" class="form-control" placeholder="Enter Company Name" name="userName">
									</div>
									<div class="col-12">
										<input type="email" class="form-control"  placeholder="company@example.com" name="userEmail"> 
										<input type="hidden" name="event" value="companyRedg">
									</div>
									<div class="col-12">
										<input type="password" class="form-control" placeholder="Password" name="userPass">
									</div>
									<div class="col-12">
										<input type="text" class="form-control" placeholder="Phone Number" name="userPhone">
									</div>
									<div class="col-12">
										<input type="file" class="form-control" placeholder="Photo" name="userImg">
									</div>
									<div class="col-6">
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"> 
											<label class="form-check-label" for="flexSwitchCheckDefault">Remember me</label>
										</div>
									</div>
									<div class="col-6 text-right">
										<a href="reset.html">Forgot Password?</a>
									</div>
									<div class="text-center">
										<input type="submit" class="btn btn-primary btn-block"
											value="Sign Up">
									</div>
								</form>
								<div class="text-center">
                                <p class="mt-3 mb-0"> <a class="text-primary" href="login.jsp">Sign in</a> to your account</p>
                            </div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		<%@include file="include/footer.jsp"%>
	</div>
	<%@include file="include/script.jsp"%>

	 <!-- toast -->
	    
        <script>
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		
		  		$("#companyRedg").on('submit',function(event){
		  			event.preventDefault();
					var f=new FormData($(this)[0]);
					$.ajax({
		  				url:"companyController",
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
			  					$('#companyRedg')[0].reset();		  				
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