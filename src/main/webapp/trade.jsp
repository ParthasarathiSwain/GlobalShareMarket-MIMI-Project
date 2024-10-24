<%@page import="com.otz.util.DbConnection" %>
<%@page import="java.sql.*" %>
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
                                        <span class="thumb"><img src="./images/profile/2.png" alt=""></span>
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
            	<div class="col-xxl-12">
            	
            	</div>
            </div>
            <div class="row">
                <div class="col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Buy Share</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped responsive-table">
                                    <thead>
                                        <tr>
										<th>#</th>
										<th>Name</th>
										<th>Company Name</th>
										<th>Date</th>
										<th>Quantity</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
                                    </thead>
                                    <tbody id="viewShare">
									

									
									</tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">View Transaction</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped responsive-table">
                                    <thead>
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

<!-- Buy Modal -->
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
<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="./vendor/basic-table/jquery.basictable.min.js"></script>
<script src="./js/plugins/basic-table-init.js"></script>
<script src="./js/scripts.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
				let event ="event=viewAllTransactionByUserId";
	        	$.ajax({
	    			url:"transaction",
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
			    					  s+="<td><span class='badge bg-success text-dark shadow-sm w-100'>Active</span></td>";
			    				
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
			    					  s+="<td><span class='badge bg-warning text-dark shadow-sm w-100'>Pending</span></td>";
			    				
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
				    url:'share',
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
<script type="text/javascript">
		$(document).ready(function() {
				let event ="event=viewAllShare";
	        	$.ajax({
	    			url:"share",
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
		    					  s+="<td><span class='bg-success text-dark  w-100'>Active</span></td>";
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
	<script>
		  	$(document).ready(function(){
		  		console.log("page is ready .....")
		  		$("#makeTransaction").on('submit',function(event){
		  			event.preventDefault();
					var f=$(this).serialize();
					$.ajax({
		  				url:"transaction",
		  				data:f,
		  				type:'POST',		  				
		  				success:function(data,textStatus,jqXHR){
			  				if(data.trim() ==='done'){			  					
			  					window.location.href = 'trade.jsp';		  				
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