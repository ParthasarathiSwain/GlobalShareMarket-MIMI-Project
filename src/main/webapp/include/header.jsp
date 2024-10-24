  <div class="header landing bg-primary">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="navigation">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="brand-logo">
                            <a href="index.jsp">
                                <!-- <img src="images/ll.png" alt="" class="logo-primary"> -->
                                <img src="images/ll.png" alt="" class="logo-white">
                            </a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav">

                                <!-- <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Home
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="./index.html">Home 1</a>
                                        <a class="dropdown-item" href="./index2.html">Home 2</a>
                                        <a class="dropdown-item" href="./index3.html">Home 3</a>
                                        <a class="dropdown-item" href="./index4.html">Home 4</a>
                                        <a class="dropdown-item" href="./index5.html">Home 5</a>
                                        <a class="dropdown-item" href="./index6.html">Home 6</a>
                                        <a class="dropdown-item" href="./index7.html">Home 7</a>
                                    </div>
                                </li> -->
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Home</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Company</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.jsp">Contact</a>
                                </li>
                                
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                                </li>

                            </ul>
                        </div>
                        	 <%
                            	String name = (String) session.getAttribute("name");
								String email = (String) session.getAttribute("email");
								if(email != "" && email != null){	
								%>
                        <div class="signin-btn">
                        	<a class="btn btn-primary" href="logout.jsp">Logout</a>
                        </div>
						<% 
							}else{
						%>
                        <div class="signin-btn">
                            <a class="btn btn-primary" href="login.jsp">Sign in</a>
                        </div>
                        <%	
							 }
				    	%>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>