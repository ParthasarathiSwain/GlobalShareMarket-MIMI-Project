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
<%@include file="include/header.jsp"%>
<div class="contact-form section-padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7">
                        <div class="section-title text-center">
                            <span>Ask Question</span>
                            <h2>Let us hear from you directly!</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-md-4 col-sm-12">
                        <div class="info-list">
                            <h4 class="mb-3">Address</h4>
                            <ul>
                                <li><i class="fa fa-map-marker"></i> California, USA</li>
                                <li><i class="fa fa-phone"></i> (+880) 1243 665566</li>
                                <li><i class="fa fa-envelope"></i> hello@example.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-8 col-md-8 col-sm-12">
                        <form method="post" name="myform" class="contact_validate">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">
                                            Full name
                                        </label>
                                        <input type="text" class="form-control" id="contactName" placeholder="Full name"
                                            name="firstname">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">
                                            Email
                                        </label>
                                        <input type="email" class="form-control" name="email"
                                            placeholder="hello@domain.com">

                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-3">
                                        <textarea class="form-control p-3" name="message" rows="5"
                                            placeholder="Tell us what we can help you with!"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary px-4 py-2">
                                Send message
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>




    <div class="bottom section-padding">
    <div class="container">
        <div class="row">
            <div class="col-xl-4">
                <div class="bottom-logo">
                    <img class="pb-3" src="images/ll.png" alt="">

                    <p>GSM is a unique and beautiful collection of UI elements that are all flexible and modular. A
                        complete and customizable solution to building the website of your dreams.</p>
                </div>
            </div>
            <div class="col-xl-2">
                <div class="bottom-widget">
                    <h4 class="widget-title">Company</h4>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Career</a></li>
                        <li><a href="#">Affiliate</a></li>
                        <li><a href="#">Our Partner</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xl-2">
                <div class="bottom-widget">
                    <h4 class="widget-title">Support</h4>
                    <ul>
                        <li><a href="#">Ticket</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Helpdesk</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xl-4">
                <div class="bottom-widget">
                    <h4 class="widget-title">Exchange Pair</h4>
                    <div class="row">
                        <div class="col-xl-6">
                            <ul>
                                <li><a href="#">ETH to BTC</a></li>
                                <li><a href="#">BTC to ETH</a></li>
                                <li><a href="#">LTC to ETH</a></li>
                                <li><a href="#">USDT to BTC</a></li>
                            </ul>
                        </div>
                        <div class="col-xl-6">
                            <ul>
                                <li><a href="#">BTC to USDT</a></li>
                                <li><a href="#">LTC to BTC</a></li>
                                <li><a href="#">XMR to BTC</a></li>
                                <li><a href="#">ETC to DASH</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="copyright">
                    <p>© Copyright 2024 <a href="#">GSM</a> I All Rights Reserved</p>
                </div>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="footer-social">
                    <ul>
                        <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</div>



<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>













<script src="./js/scripts.js"></script>


</body>

</html>