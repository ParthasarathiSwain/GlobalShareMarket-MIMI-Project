<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>GSM</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/ll.png">
<!-- Custom Stylesheet -->

<script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<link rel="stylesheet" href="./css/style.css">
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
							<a href="#"><img src="images/ll.png" alt=""></a>
							<h4 class="card-title mt-3">Sign in to GSM</h4>
						</div>
						<div class="auth-form card">
							<div class="card-body">
								<form id="login" class="signin_validate row g-3">
									<div class="col-12">
										<input type="email" class="form-control"
											placeholder="hello@example.com" name="email"> <input
											type="hidden" name="event" value="Login">
									</div>
									<div class="col-12">
										<input type="password" class="form-control"
											placeholder="Password" name="password">
									</div>
									<div class="col-6">
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												id="flexSwitchCheckDefault"> <label
												class="form-check-label" for="flexSwitchCheckDefault">Remember
												me</label>
										</div>
									</div>
									<div class="col-6 text-right">
										<a href="reset.html">Forgot Password?</a>
									</div>
									<div class="text-center">
										<input type="submit" class="btn btn-primary btn-block"
											value="Sign in">
									</div>
								</form>
								<p class="mt-3 mb-0">
									Don't have an account? <br><a class="text-primary" href="custRedg.jsp">Sign up as Customer</a>
									<br><a class="text-primary" href="brokerRedg.jsp">Sign up as Broker</a>
									<br><a class="text-primary" href="companyRedg.jsp">Sign up as Company</a>
									
								</p>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		<%@include file="include/footer.jsp"%>
	</div>
	<%@include file="include/script.jsp"%>

	<script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		$("#login").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			$.ajax({
  				url:"login",
  				data:f,
  				method:'POST',
				dataType:'JSON',
  				success:function(data){
  					var status =JSON.parse(data);
  					
  					if(status==1){
  						alert("login Successful");
  						window.location.href = 'admin/index.jsp';
  		  			}else if(status==2){
  		  			  alert("login Successful");
  		  			  window.location.href = 'index.jsp';
  		  			}
  		  			else if(status==3){
		  			  alert("login Successful");
		  			  window.location.href = 'company/index.jsp';
		  			}
  		  			else if(status==4){
			  			  alert("login Successful");
			  			  window.location.href = 'broker/index.jsp';
			  		}
  		  			else if(status==5){
  		  			 alert("Your Account is Not Activated!");
  		  			}
  		  			else{
  		  			 alert("Login Failed!");
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...")
  				}
  			})
  		})
  	})
  </script>

</body>

</html>