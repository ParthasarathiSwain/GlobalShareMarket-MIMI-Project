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
				<div class="card radius-10">
					<div class="card-header">
						<div class="d-flex align-items-center">
							<div>
								<h6 class="mb-0">Recent Orders</h6>
							</div>
							<div class="dropdown ms-auto">
								<a class="dropdown-toggle dropdown-toggle-nocaret" href="#"
									data-bs-toggle="dropdown"><i
									class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
								</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="javascript:;">Action</a>
									</li>
									<li><a class="dropdown-item" href="javascript:;">Another
											action</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="javascript:;">Something
											else here</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle mb-0">
								<thead class="table-light">
									<tr>
										<th>Product</th>
										<th>Photo</th>
										<th>Product ID</th>
										<th>Status</th>
										<th>Amount</th>
										<th>Date</th>
										<th>Shipping</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Iphone 5</td>
										<td><img src="assets/images/products/01.png"
											class="product-img-2" alt="product img"></td>
										<td>#9405822</td>
										<td><span
											class="badge bg-gradient-quepal text-white shadow-sm w-100">Paid</span></td>
										<td>$1250.00</td>
										<td>03 Feb 2020</td>
										<td><div class="progress" style="height: 6px;">
												<div class="progress-bar bg-gradient-quepal"
													role="progressbar" style="width: 100%"></div>
											</div></td>
									</tr>

									<tr>
										<td>Earphone GL</td>
										<td><img src="assets/images/products/02.png"
											class="product-img-2" alt="product img"></td>
										<td>#8304620</td>
										<td><span
											class="badge bg-gradient-blooker text-white shadow-sm w-100">Pending</span></td>
										<td>$1500.00</td>
										<td>05 Feb 2020</td>
										<td><div class="progress" style="height: 6px;">
												<div class="progress-bar bg-gradient-blooker"
													role="progressbar" style="width: 60%"></div>
											</div></td>
									</tr>

									<tr>
										<td>HD Hand Camera</td>
										<td><img src="assets/images/products/03.png"
											class="product-img-2" alt="product img"></td>
										<td>#4736890</td>
										<td><span
											class="badge bg-gradient-bloody text-white shadow-sm w-100">Failed</span></td>
										<td>$1400.00</td>
										<td>06 Feb 2020</td>
										<td><div class="progress" style="height: 6px;">
												<div class="progress-bar bg-gradient-bloody"
													role="progressbar" style="width: 70%"></div>
											</div></td>
									</tr>

									<tr>
										<td>Clasic Shoes</td>
										<td><img src="assets/images/products/04.png"
											class="product-img-2" alt="product img"></td>
										<td>#8543765</td>
										<td><span
											class="badge bg-gradient-quepal text-white shadow-sm w-100">Paid</span></td>
										<td>$1200.00</td>
										<td>14 Feb 2020</td>
										<td><div class="progress" style="height: 6px;">
												<div class="progress-bar bg-gradient-quepal"
													role="progressbar" style="width: 100%"></div>
											</div></td>
									</tr>
									<tr>
										<td>Sitting Chair</td>
										<td><img src="assets/images/products/06.png"
											class="product-img-2" alt="product img"></td>
										<td>#9629240</td>
										<td><span
											class="badge bg-gradient-blooker text-white shadow-sm w-100">Pending</span></td>
										<td>$1500.00</td>
										<td>18 Feb 2020</td>
										<td><div class="progress" style="height: 6px;">
												<div class="progress-bar bg-gradient-blooker"
													role="progressbar" style="width: 60%"></div>
											</div></td>
									</tr>
									<tr>
										<td>Hand Watch</td>
										<td><img src="assets/images/products/05.png"
											class="product-img-2" alt="product img"></td>
										<td>#8506790</td>
										<td><span
											class="badge bg-gradient-bloody text-white shadow-sm w-100">Failed</span></td>
										<td>$1800.00</td>
										<td>21 Feb 2020</td>
										<td><div class="progress" style="height: 6px;">
												<div class="progress-bar bg-gradient-bloody"
													role="progressbar" style="width: 40%"></div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
</body>
</html>