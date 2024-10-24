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
								<h5 class="mb-4">Horizontal Form</h5>
								<div class="row mb-3">
									<label for="input35" class="col-sm-3 col-form-label">Enter
										Your Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="input35"
											placeholder="Enter Your Name">
									</div>
								</div>
								<div class="row mb-3">
									<label for="input36" class="col-sm-3 col-form-label">Phone
										No</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="input36"
											placeholder="Phone No">
									</div>
								</div>
								<div class="row mb-3">
									<label for="input37" class="col-sm-3 col-form-label">Email
										Address</label>
									<div class="col-sm-9">
										<input type="email" class="form-control" id="input37"
											placeholder="Email Address">
									</div>
								</div>
								<div class="row mb-3">
									<label for="input38" class="col-sm-3 col-form-label">Choose
										Password</label>
									<div class="col-sm-9">
										<input type="email" class="form-control" id="input38"
											placeholder="Choose Password">
									</div>
								</div>
								<div class="row mb-3">
									<label for="input39" class="col-sm-3 col-form-label">Select
										Country</label>
									<div class="col-sm-9">
										<select class="form-select" id="input39">
											<option selected>Open this select menu</option>
											<option value="1">One</option>
											<option value="2">Two</option>
											<option value="3">Three</option>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="input40" class="col-sm-3 col-form-label">Address</label>
									<div class="col-sm-9">
										<textarea class="form-control" id="input40" rows="3"
											placeholder="Address"></textarea>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="input41">
											<label class="form-check-label" for="input41">Check
												me out</label>
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<button type="button" class="btn btn-primary px-4">Submit</button>
											<button type="button" class="btn btn-light px-4">Reset</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="include/footer.jsp"%>
</body>
</html>