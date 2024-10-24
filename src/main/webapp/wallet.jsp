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

                                    <a href="">More <i
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
                                <a href="profile.jsp" class="dropdown-item">
                                    <i class="icofont-ui-user"></i>Profile
                                </a>
                                <a href="wallet.jsp" class="dropdown-item">
                                    <i class="icofont-wallet"></i>Wallet
                                </a>
                                <a href="progile.jsp" class="dropdown-item">
                                    <i class="icofont-ui-settings"></i> Setting
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
        		<div class="row">
					<div class="col-xxl-6">
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
           <div class="row">

                <div class="col-xxl-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">View Account </h4>
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-striped responsive-table">
                                    <thead>
                                     <tr>
										<th>#</th>
										<th>Name</th>
										<th>Number</th>
										<th>Balance</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="viewAccount">
								
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xxl-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Balance</h4>
                        </div>
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                                    <div class="balance-chart">
                                        <div id="balance-chart"></div>
                                        <h4>Total Balance = $ 5360</h4>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">

                                    <ul class="balance-widget">
                                        <li>
                                            <div class="icon-title">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </div>
                                            <div class="text-right">
                                                <h5>0.000242 BTC</h5>
                                                <span>0.125 USD</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="icon-title">
                                                <i class="cc USDT"></i>
                                                <span>Tether</span>
                                            </div>
                                            <div class="text-right">
                                                <h5>0.000242 USDT</h5>
                                                <span>0.125 USD</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="icon-title">
                                                <i class="cc XTZ"></i>
                                                <span>Tezos</span>
                                            </div>
                                            <div class="text-right">
                                                <h5>0.000242 XTZ</h5>
                                                <span>0.125 USD</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="icon-title">
                                                <i class="cc XMR"></i>
                                                <span>Monero</span>
                                            </div>
                                            <div class="text-right">
                                                <h5>0.000242 XMR</h5>
                                                <span>0.125 USD</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="icon-title">
                                                <i class="cc XMR"></i>
                                                <span>Monero</span>
                                            </div>
                                            <div class="text-right">
                                                <h5>0.000242 XMR</h5>
                                                <span>0.125 USD</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-xxl-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Balance </h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped responsive-table">
                                    <thead>
                                        <tr>
                                            <th>Asset</th>
                                            <th>Balance</th>
                                            <th>Available</th>
                                            <th>Locked</th>
                                            <th>% Gain</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                >0
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td class="success-arrow">
                                                <strong>0.005%</strong>
                                                <i class="icofont-arrow-up ml-2"></i>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                >0
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td class="success-arrow">
                                                <strong>0.005%</strong>
                                                <i class="icofont-arrow-up ml-2"></i>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                >0
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td class="success-arrow">
                                                <strong>0.005%</strong>
                                                <i class="icofont-arrow-up ml-2"></i>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                >0
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td class="success-arrow">
                                                <strong>0.005%</strong>
                                                <i class="icofont-arrow-up ml-2"></i>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xxl-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Deposit </h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped responsive-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Type</th>
                                            <th>Amount</th>
                                            <th>Date</th>
                                            <th>Hash</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Withdrawals </h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped responsive-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Type</th>
                                            <th>Amount</th>
                                            <th>Fee</th>
                                            <th>Date</th>
                                            <th>Hash</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                0.02%
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                0.02%
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td class="coin-name">
                                                <i class="cc BTC"></i>
                                                <span>Bitcoin</span>
                                            </td>
                                            <td>
                                                0
                                            </td>
                                            <td>
                                                0.02%
                                            </td>
                                            <td>
                                                Jan 01
                                            </td>
                                            <td>
                                                #1236598745565
                                            </td>
                                            <td>
                                                Pending
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Account</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<form id="updateAccount" >
								
								<div class="row mb-3">
									<label for="accName" class="col-sm-3 col-form-label">Account Name</label>
									<div class="col-sm-9">
										<input type="hidden" name="event" value="updateAccount">
										<input type="hidden" name="accId" id="accIdd" value="">		
										<input type="text" name="accName" class="form-control" id="accNamee">
									</div>
								</div>
								<div class="row mb-3">
									<label for="accNumber" class="col-sm-3 col-form-label">Account Number</label>
									<div class="col-sm-9">
										<input type="text" name="accNumber" class="form-control" id="accNumberr" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="balance" class="col-sm-3 col-form-label">Balance</label>
									<div class="col-sm-9">
										<input type="text" name="balance" class="form-control" id="balancee" >
									</div>
								</div>
								<div class="row mb-3">
									<label for="isActive" class="col-sm-3 col-form-label">Status</label>
									<div class="col-sm-9">
									<input class="form-check-input" name="accStatus" value="1" type="radio" required id="isActive" >&nbsp;&nbsp;<b>Active</b>&nbsp;
									<input class="form-check-input" name="accStatus"  value="0" type="radio" required id="isActive" >&nbsp;&nbsp;&nbsp;<b>Deactive</b>
									</div>
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


<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="./vendor/apexchart/apexcharts.min.js"></script>
<script src="./js/plugins/apex-price.js"></script>
<script src="./vendor/basic-table/jquery.basictable.min.js"></script>
<script src="./js/plugins/basic-table-init.js"></script>
<script src="./js/dashboard.js"></script>
<script src="./js/scripts.js"></script>
<script src="assets/jquery-toast/src/jquery.toast.js"></script>
<script src="assets/jquery-toast/dist/jquery.toast.min.js"></script>
<script>
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		$("#updateAccount").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"account",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					window.location.href = 'wallet.jsp';		  				
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
			 $(document).on('click', '.acc_edit', function() {
				 accId = $(this).attr('id');                	 
                	$("#exampleModal").modal("show");
                	
				$.ajax({
				    type:'POST',
				    url:'account',
					data:{'accId':accId,'event':'fatchAccById'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						
						var selectedOption = "isActive";
						$("#accIdd").val(data[0].accId);
	    				$("#accNamee").val(data[0].accName);
	    				$("#accNumberr").val(data[0].accNumber);
	    				$("#balancee").val(data[0].balance);
	    				('#' + selectedOption).prop('checked', data[0].acctStatus);	    				
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
	        	let event ="event=viewAccount";
	        	$.ajax({
	    			url:"account",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);	    				
	    				 let s="";
	    				 let i=1;
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    						var status=data[key].acctStatus;
	    					  if(status==1){
	    						  s+="<tr >";
		    					  s+="<td>"+i+"</td>";
		    					  s+="<td>"+data[key].accName+"</td>";
		    					  s+="<td>"+data[key].accNumber+"</td>";
		    					  s+="<td>"+data[key].balance+"</td>";
		    					  s+="<td><span class='badge bg-success text-dark shadow-sm w-100'>Active</span></td>";
		    					  s+="<td><div class='d-flex '><button class='btn btn-primary acc_edit'  id='"+data[key].accId+"'>Edit</button>&nbsp";
		    					  s+="<button class='acc_delete btn btn-danger'  id='"+data[key].accId+"'>Delete</button><div></td>";
	    					  }else{
	    						  s+="<tr >";
		    					  s+="<td>"+i+"</td>";
		    					  s+="<td>"+data[key].accName+"</td>";
		    					  s+="<td>"+data[key].accNumber+"</td>";
		    					  s+="<td>"+data[key].balance+"</td>";
		    					  s+="<td><span class='badge bg-warning text-dark shadow-sm w-100'>Pending</span></td>";
		    					  s+="<td><div class='d-flex '><button class='btn btn-primary acc_edit'  id='"+data[key].accId+"'>Edit</button>&nbsp";
		    					  s+="<button class='btn btn-secondary'  >Delete</button></div></td>";
	    					  }
	    					}
	    					i++;
	    				}
	    				$('#viewAccount').html(s);
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    			}
	    	    });
			  }
				 $(document).on('click', '.acc_delete', function() {
					 accId = $(this).attr('id');
	                 if (confirm('Are you sure you want to Deactivated this Account ?')) {
	              $.ajax({
					    type:'POST',
					    url:'account',
						data:{'accId':accId,'event':'account_delete'},
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
		  		  			    $('#viewAccount').html('');
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
<script>
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		
		  		$("#addAccount").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"account",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					$.toast({
			  					    text: "Account Successfully Added!", 
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