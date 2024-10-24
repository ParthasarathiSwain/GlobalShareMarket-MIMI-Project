<%
if (session.getAttribute("name") == null || session.getAttribute("name").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GSM</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="">
    <!-- Custom Stylesheet -->
         
    <link href="assets/jquery-toast/src/jquery.toast.css" rel="stylesheet" />
 	<link href="assets/jquery-toast/dist/jquery.toast.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/style.css">
</head>

<body class="@@dashboard">

<div id="preloader"><i>.</i><i>.</i><i>.</i></div>

<div id="main-wrapper">

    <div class="header">
    <div class="container">
        <div class="row">
            <div class="col-xxl-12">
                <div class="header-content">
                    <div class="header-left">
                        <div class="brand-logo">
                            <a href="index.jsp">
                                <img src="images/ll.png" alt="">
                            </a>
                        </div>
                        <div class="search">
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search Here">
                                    <span class="input-group-text"><i class="icofont-search"></i></span>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="header-right">
                        <div class="dark-light-toggle" onclick="themeToggle()">
                            <span class="dark"><i class="icofont-moon"></i></span>
                            <span class="light"><i class="icofont-sun-alt"></i></span>
                        </div>
                        <div class="notification dropdown">
                            <div class="notify-bell" data-toggle="dropdown">
                                <span><i class="icofont-alarm"></i></span>
                            </div>
                            <div class="dropdown-menu dropdown-menu-right notification-list">
                                <h4>Announcements</h4>
                                <div class="lists">
                                    <a href="#" class="">
                                        <div class="d-flex align-items-center">
                                            <span class="mr-3 icon success"><i class="icofont-check"></i></span>
                                            <div>
                                                <p>Account created successfully</p>
                                                <span>2020-11-04 12:00:23</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="">
                                        <div class="d-flex align-items-center">
                                            <span class="mr-3 icon fail"><i class="icofont-close"></i></span>
                                            <div>
                                                <p>2FA verification failed</p>
                                                <span>2020-11-04 12:00:23</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="">
                                        <div class="d-flex align-items-center">
                                            <span class="mr-3 icon success"><i class="icofont-check"></i></span>
                                            <div>
                                                <p>Device confirmation completed</p>
                                                <span>2020-11-04 12:00:23</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="">
                                        <div class="d-flex align-items-center">
                                            <span class="mr-3 icon pending"><i
                                                    class="icofont-warning"></i></span>
                                            <div>
                                                <p>Phone verification pending</p>
                                                <span>2020-11-04 12:00:23</span>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="./settings-activity.html">More <i
                                            class="icofont-simple-right"></i></a>

                                </div>
                            </div>
                        </div>

                        <div class="profile_log dropdown">
                            <div class="user" data-toggle="dropdown">
                                <span class="thumb"><img src="images/custImg/<% out.print(request.getSession().getAttribute("image")); %>" alt=""></span>
                                <span class="arrow"><i class="icofont-angle-down"></i></span>
                            </div>
                            <div class="dropdown-menu dropdown-menu-right">
                                <div class="user-email">
                                    <div class="user">
                                        <span class="thumb"><img src="images/custImg/<% out.print(request.getSession().getAttribute("image")); %>" alt=""></span>
                                        <div class="user-info">
                                            <h5><% out.print(request.getSession().getAttribute("name")); %></h5>
                                            <span><% out.print(request.getSession().getAttribute("email")); %></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="user-balance">
                                    <div class="available">
                                        <p>Available</p>
                                        <span>0.00 BTC</span>
                                    </div>
                                    <div class="total">
                                        <p>Total</p>
                                        <span>0.00 USD</span>
                                    </div>
                                </div>
                                <a href="#" class="dropdown-item">
                                    <i class="icofont-ui-user"></i>Profile
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="icofont-wallet"></i>Wallet
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="icofont-ui-settings"></i> Setting
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="icofont-history"></i> Activity
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="icofont-lock"></i>Lock
                                </a>
                                <a href="logout.jsp" class="dropdown-item logout">
                                    <i class="icofont-logout"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

    <div class="sidebar">
    <div class="brand-logo">
        <a href="index.jsp"><img src="images/ll.png" alt="" width="30">
        </a>
    </div>
    <div class="menu">
        <ul>
            <li>
                <a href="index.jsp" data-toggle="tooltip" data-placement="right" title="Home">
                    <span><i class="icofont-ui-home"></i></span>
                </a>
            </li>
            <li><a href="trade.jsp" data-toggle="tooltip" data-placement="right" title="Trade">
                    <span><i class="icofont-exchange"></i></span>
                </a>
            </li>
            <li><a href="wallet.jsp" data-toggle="tooltip" data-placement="right" title="Wallet">
                    <span><i class="icofont-wallet"></i></span>
                </a>
            </li>
            <li><a href="profile.jsp" data-toggle="tooltip" data-placement="right" title="Settings">
                    <span><i class="icofont-settings"></i></span>
                </a>
            </li>
            <li class="logout"><a href="logout.jsp" data-toggle="tooltip" data-placement="right"
                    title="Signout">
                    <span><i class="icofont-power"></i></span>
                </a>
            </li>
        </ul>

        <p class="copyright">
            &#169; <a href="#">Qkit</a>
        </p>
    </div>
</div>

    <div class="content-body">
        <div class="container">
            <div class="row">
                <div class="col-xxl-12 col-xl-12">
                    <div class="page-title">
                        <h4>Profile</h4>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <div class="settings-menu">
                                <a href="settings-profile.html">Profile</a>
                                
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xxl-6 col-xl-6 col-lg-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">User Profile</h4>
                                        </div>
                                        <div class="card-body">
                                            <form id="custUpdate">
                                                <div class="row g-3">
                                                <div class="col-xxl-12">
                                                        <div class="d-flex align-items-center">
                                                            <img class="mr-3 rounded-circle mr-0 mr-sm-3"
                                                                src="images/custImg/<% out.print(request.getSession().getAttribute("image")); %>" width="55" height="55"
                                                                alt="">
                                                            <div class="media-body">
                                                                <h4 class="mb-0"><% out.print(request.getSession().getAttribute("name")); %></h4>
                                                                <p class="mb-0">
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xxl-12">
                                                        <label class="form-label">Your Name</label>
                                                        <input type="text" name="userName" id="userName" class="form-control" placeholder="Name">
                                                        <input type="hidden" name="userId" id="userId" >
                                                        <input type="hidden" name="event" value="updateCust2">
                                                    </div>
                                                    <div class="col-xxl-12">
                                                        <label class="form-label">Your Email</label>
                                                        <input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="Email">
                                                    </div>
                                                    <div class="col-xxl-12">
                                                        <label class="form-label">Your Phone</label>
                                                        <input type="text" name="userPhone" id="userPhone" class="form-control" placeholder="Phone">
                                                    </div>
                                                    
                                                   <div class="col-12">
                                                        <input type="submit" class="btn btn-success waves-effect" value="Update & Save">
                                                    </div>
                                                    
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-xl-6 col-lg-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Change PassWord</h4>
                                        </div>
                                        <div class="card-body">
                                            <form id="validate">
                                                <div class="row g-3">
                                                     <div class="col-xxl-12">
                                                        <label for="">Current Password</label>
														<input type="password" name="oldPass" placeholder="**********" id="oldPass" class="form-control" required>
														<input type="hidden" name="event" value="changePassword">
                                                        
                                                    </div>
                                                     <div class="col-xxl-12">
                                                        <label class="form-label">New Password</label>
                                                        <input type="text" name="newPass" placeholder="**********" id="newPass" class="form-control" required>
                                                            
                                                        
                                                    </div>
                                                    <div class="col-xxl-12">
                                                        <label class="form-label">confirm Password</label>
                                                        <input type="text" name="confirm" placeholder="Confirm Password" id="confirm" class="form-control" required>
                                                        <small class="mt-2 mb-0 d-block">Enable two factor authencation
                                                            on the
                                                            security
                                                            page
                                                        </small>
                                                    </div>
                                                    <div class="col-12">
                                                    	<button type="submit" class="btn btn-success waves-effect">Change Password</button>
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
                       </div>
                       </div></div>
                       </div>
                       



<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="assets/jquery-toast/src/jquery.toast.js"></script>
<script src="assets/jquery-toast/dist/jquery.toast.min.js"></script>
<script src="assets/jquery-validation/dist/additional-methods.js"></script>
<script src="assets/jquery-validation/dist/jquery.validate.js"></script>
	
<script type="text/javascript">
		$(document).ready(function() {
				jQuery.validator.addMethod("notEqual", function(value, element, param) {
					 return this.optional(element) || value != $(param).val();
					}, "This has to be different...");
		   		$("#validate").validate({
		   			
			      	rules: {
			      		oldPass: 'required',
			      		newPass: {
			            	required: true,
			            	notEqual : "#oldPass",
			         	},
			         	confirm: {
			            	required: true,
			            	equalTo : "#newPass",
			         	},
			      	},
			      	messages: {
			      		oldPass: 'Current Password is required *',
					   	newPass: {
					   		required : 'Confirm Password is required *',
					   		notEqual : 'New password should not match with old one *',
					   	},
					   	confirm: {
					   		required : 'Confirm Password is required *',
					   		equalTo : 'Password not matching *',
					   	}
					},
			   });
			});
		</script>
		<script>
		  	$(document).ready(function(){				    
		  		console.log("page is ready .....");
		  		$("#validate").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"custController",
		  				data:f,
		  				type:'POST',
		  				dataType:"json",
		  				success:function(data,textStatus,jqXHR){		  				
		  					if(data.trim() =='done'){
			  					$.toast({
			  					    text: "Password Successfully Changed!", 
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
			  					$('#validate')[0].reset();		  				
			  		  		}else if(data.trim() ==='error1'){
					  		  		$.toast({
					  		  	    text: "Old Password & New Password Should not Be Same!", 
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
			  		  		}else if(data.trim() ==='error2'){
					  		  		$.toast({
					  		  	    text: "New Password & Confirm Password Should Be Same!", 
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
			  		  		}else if(data.trim() ==='error3'){
					  		  		$.toast({
					  		  	    text: "Old Password Not Matched!", 
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
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		
		  		$("#custUpdate").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"custController",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					window.location.href = 'profile.jsp';		  				
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
			$(document).ready(function() {
				 
				$.ajax({
				    type:'POST',
				    url:'custController',
					data:{'event':'fatchCustByIdForCustDashBoard'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						
						$("#userId").val(data[0].userId);
	    				$("#userName").val(data[0].userName);
	    				$("#userEmail").val(data[0].userEmail);
	    				
	    				$("#userPhone").val(data[0].userPhone);
	    				
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









<script src="./js/scripts.js"></script>


</body>

</html>