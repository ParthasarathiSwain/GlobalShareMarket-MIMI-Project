<%
if (session.getAttribute("name") == null || session.getAttribute("name").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
<%@page import="com.otz.util.DbConnection" %>
<%@page import="java.sql.*" %>
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

				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="card">
							<div class="card-body p-4">
							<form id="addShare" >
								<h5 class="mb-4">Add Share</h5>
								<div class="row mb-3">
									<label for="sName" class="col-sm-3 col-form-label">Share Name</label>
									<div class="col-sm-9">
										<input type="hidden" name="event" value="addShare">	
										<input type="text" name="sName" class="form-control" id="sName" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="sQty" class="col-sm-3 col-form-label">Share Quantity</label>
									<div class="col-sm-9">
										<input type="number" name="sQty" class="form-control" id="sQty" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="sAmount" class="col-sm-3 col-form-label">Share Amount</label>
									<div class="col-sm-9">
										<input type="text" name="sAmount" class="form-control" id="sAmount" >
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
		  		
		  		$("#addShare").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"../share",
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
			  					$('#addShare')[0].reset();		  				
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