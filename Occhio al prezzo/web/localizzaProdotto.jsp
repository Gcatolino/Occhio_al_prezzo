<%@page import="it.unisa.account.AccountManager"%>
<%@page import="it.unisa.account.Account"%>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <title>Google Maps API v3: Directions + panel</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Amberegul Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='//fonts.googleapis.com/css?family=Roboto+Slab:300,700,400' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <!--//slider-script-->

        <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default', //Types: default, vertical, accordion           
                    width: 'auto', //auto or any width like 600px
                    fit: true   // 100% fit in a container
                });
            });

        </script>	
        <style type="text/css">
            html, body { margin:0; padding:0; width:100%; height:100%; }
            #map { float:left; width:50%; height:60%; }
            #panel { float:left; width:30%; height:60%; }
            #panel table { font-size:14px; }
        </style>
        <%
            Account utente = AccountManager.getInstance().ottieniAccountDaEmail(request.getParameter("emailU"));
            Account venditore = AccountManager.getInstance().ottieniAccountDaEmail(request.getParameter("emailV"));
            int prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
            String indirizzoPartenza = utente.getDomicilio() + " " + utente.getComuneDiResidenza();
            String indirizzoArrivo = venditore.getDomicilio() + " " + venditore.getComuneDiResidenza();
        %>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true&amp;&language=it"></script>
        <script type="text/javascript">
            var directionDisplay;
            var directionsService = new google.maps.DirectionsService();
            var map;

            function initialize() {

                calcRoute();
                directionsDisplay = new google.maps.DirectionsRenderer();
                //var roma = new google.maps.LatLng(41.8954656, 12.4823243);
                var myOptions = {
                    zoom: 7,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                            //,center: roma
                }
                map = new google.maps.Map(document.getElementById("map"), myOptions);

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById("panel"));
            }

            function calcRoute() {
                var partenza = "<%= indirizzoPartenza%>";
                var arrivo = "<%= indirizzoArrivo%>";
                if (navigator.geolocation) {
                    browserSupportFlag = true;
                    navigator.geolocation.getCurrentPosition(function (position) {
                        partenza = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                    }, function () {
                        handleNoGeolocation();
                    });
                } else {
                    browserSupportFlag = false;
                    handleNoGeolocation(browserSupportFlag);
                }

                function handleNoGeolocation() {
                }
                var request = {
                    origin: partenza,
                    destination: arrivo,
                    travelMode: google.maps.DirectionsTravelMode.DRIVING
                };
                directionsService.route(request, function (response, status) {
                    if (status === google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                    }
                });
            }

            window.onload = initialize;
        </script>
    </head>
    <body>
        <!--header-->	
        <div>
            <div class="header-top">
                <div class="container">
                    <div class="header-top-in">

                        <ul class="support">
                            <li ><a href="mailto:occhio_al_prezzo@gmail.com" ><i > </i>occhio_al_prezzo@gmail.com</a></li>

                        </ul>
                        <ul class=" support-right">
                            <c:choose>
                                <c:when test="${sessionScope.account.email != null}">

                                    <li ><a><i class="title"> </i>Ciao ${sessionScope.account.email}!</a></li>

                                    <li ><a href="LogoutServlet"><i class="tele"> </i>Logout</a></li>      

                                </c:when>
                            </c:choose>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="header-bottom bottom-com">
                    <div class="container">			
                        <div class="logo">
                            <h1><a href="utenteLoggato.jsp"><img src="images/occhio3_.png"  ></a></h1>
                        </div>
                        <div class="top-nav">


                            <!-- start header menu -->
                            <ul class="megamenu skyblue menu-in">
                                <li><a  href="utenteLoggato.jsp">Home</a></li>

                                <li><a id="barra" href="javascript:void(0)" onclick="myfunction()">Cerca prodotti</a>
                                </li>
                                <div class="search-in" >
                                    <div class="search" >
                                        <form method="POST" action="ServletRicercaPerNome">
                                            <input type="text" name="nomeProdotto" placeholder="Cerca prodotto..." class="text css-input" required>
                                            &nbsp;&nbsp;&nbsp;
                                            <input  type="submit" class="btn" value="Cerca">
                                        </form>
                                        <div class="close-in"><img src="images/close1.png" width="20" height="20" alt="" /></div>
                                    </div>

                                </div>

                                <script type="text/javascript">
                                    $('.search').hide();
                                    function myfunction() {

                                        $('.search').show();
                                        $('.text').focus();


                                        $('.close-in').click(function () {
                                            $('.search').hide();
                                        });
                                    }
                                    ;

                                </script>           

                                <li>
                                    <a href="profilo.jsp">Profilo</a>
                                </li>

                                    


                            </ul>

                            <!---->


                            <!---->
                            <div class="cart box_1">
                                <a href="carrello.jsp">
                                    <h3> <div class="total">
                                            <span><%= prodottiCarr%> Prodotti </span>	
                                        </div>
                                        <img src="images/cart.png" alt=""/></h3>
                                </a>
                                <% if (prodottiCarr > 0) {%>
                                <p><a href="<%="svuotaCarrelloServlet"%>" class="simpleCart_empty">Svuota carrello </a></p>
                                <%} else { %>
                                <p><span>Carrello Vuoto</span></p>
                                <% }%>
                                <div class="clearfix"> </div>
                            </div>

                            <div class="clearfix"> </div>
                            <!---->
                        </div>

                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>


        </div>
        <br><br><br>
        <div class="col-lg-offset-1" id="map"></div>
        <div style="height:60%; overflow:auto" id="panel"></div>
        <br><br><br>
        <br>
        <div>
            <div class="container">
                <div class="col-md-4 footer-top">

                </div>
                <div class="clearfix"> </div>         
                <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                <a  href="index.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>


            </div>
        </div>

        <!---->
    </body>
</html>
