<%-- 
    Document   : provaAccount
    Created on : 17-dic-2015, 23.51.40
    Author     : raffaele
--%>

<%@page import="it.unisa.account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Account account = ((Account) session.getAttribute("account"));
            
            if((account==null) || (!account.getRuolo().equals("admin"))){
            
        %>
        <script type="text/javascript">
            location.href="index.jsp";
            </script>
            <%} %>

        <title>Occhio al prezzo.it: volantino prodotti</title>
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
        <style type="text/css">

            div.mio{
                width: 80%;
                height: 300px;      
                margin: auto;
                margin-top:20px;
                border-color: gainsboro;
                border-style: solid;
                border-width:1px;
                overflow: scroll;
            }
            #tab{
                margin-top:20px;
            }
            #tab2{
                margin-top:20px;  
            }
        </style>
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

        <script src="js/simpleCart.min.js"></script>
        <script type="text/javascript">

            var httpRequest
            var result = "vuoto";
            excolore = ""
            function addColor(id) {

                paragrafo = document.getElementById(id);
                excolore = paragrafo.style.color;
                paragrafo.style.color = "red"
            }
            function removeColor(id)
            {
                paragrafo = document.getElementById(id);
                paragrafo.style.color = excolore
             
            }
            function removeWriter(){
                var tab2=document.getElementById("tab2")
                 tab2.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>";
              
             }
             function removeWriter2(){
                 
                  var tab=document.getElementById("tab")
                 tab.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>";
                 
             }
             function cambia(){
              tab = document.getElementById("tab");
             tab.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>";
                  
            }
             function cambia2(){
              tab2 = document.getElementById("tab2");
             tab2.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>";
                  
            }
            function deleteAccount(puls)
            {
                
                //tab = document.getElementById("tab").innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>";
                email=puls.value;
                httpRequest = new XMLHttpRequest();
                httpRequest.open("GET","deleteAccountServlet?email="+email, false);
                alert("accout eliminato correttamente");
                tab = document.getElementById("tab");
                tab.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr><span style='color:red'></span>";
                setTimeout(cambia,2000);   
                httpRequest.send(null);
            }
            function deleteAccount2(puls)
            {
              
                //tab = document.getElementById("tab").innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>";
                email=puls.value;
                httpRequest = new XMLHttpRequest();
                httpRequest.open("GET","deleteAccountServlet?email="+email, false);
                alert("accout eliminato correttamente");
                tab2 = document.getElementById("tab2");
                tab2.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr><span style='color:red'></span>";
                setTimeout(cambia2,2000);   
                httpRequest.send(null);
            }
           

            
            function ajaxFunction(par)
            {
             
                //tab = document.getElementById("tab").innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>";
             
                httpRequest = new XMLHttpRequest();
                httpRequest.onreadystatechange = function ()
                {

                    if (httpRequest.readyState == 4 && httpRequest.status == 200) {
                       tab = document.getElementById("tab");
                        tab.innerHTML = "   <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>";

                        result = httpRequest.responseText;
                        if(result=="ERDB" || result=="NOVAL" || result=="ERCON"){
                         confirm("Hai qualche problema di connessione al db contatt il fornitore del software..");
                         location.href="login.jsp";
                           }
                           else  if(result=="nessunrisultato")
                           {
                             result="<p style='color:red;'><span class=\"glyphicon glyphicon-minus\"></span>nessun risultato</p>"
                            tab.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>" + result;

                           }
                        else {
                            tab = document.getElementById("tab");
                            tab.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>" + result;
                        
                        }
                    }
                }
                httpRequest.open("GET", "getAccountByEmailAccountServlet?email=" + par, true);
                httpRequest.send(null);
            }

            function ajaxFunctiondomicilio(par) {
              //  tab = document.getElementById("tab2").innerHTML = " <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>";
                httpRequest = new XMLHttpRequest();
                httpRequest.onreadystatechange = function ()
                {

                    if (httpRequest.readyState == 4 && httpRequest.status == 200) {
                       tab = document.getElementById("tab2");
                        tab.innerHTML = " <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>";

                        result = httpRequest.responseText;
                   

                       if((result=="ERDB") || (result=="NOVAL") || (result=="ERCON")){
                         confirm("Hai qualche problema di connessione al db contatt il fornitore del software..");
                         location.href="login.jsp";
                           }
                            else  if(result=="nessunrisultato")
                           {
                             result="<p style='color:red;'><span class=\"glyphicon glyphicon-minus\"></span>nessun risultato</p>"
                            tab.innerHTML = "<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>" + result;

                           }
                           else{
                        tab = document.getElementById("tab2")
                        tab.innerHTML = " <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>" + result;
                        }
                       // else {
                       //  alert("Hai qualche problema di connessione al db contatt il fornitore del software..");
                        // location.href="login.jsp";
                        //}
                    }
                }
                httpRequest.open("GET", "getAccountByFiltriAccountServlet?domicilio=" + par, true);
                httpRequest.send(null);

            }

        </script>
    </head> 
    <body>
        <!--header-->	

        <div class="header-top">
            <div class="container">
                <div class="header-top-in">

                    <ul class="support">
                        <li ><a href="mailto:info@gmail.com" ><i> </i>info@gmail.com</a></li>	
                    </ul>
                    <ul class=" support-right">
                        <c:choose>
                            <c:when test="${sessionScope.account.getEmail() != null}">

                                <li ><a><i class="title"> </i>Ciao ${sessionScope.account.getEmail()}!</a></li>

                                <li ><a href="index.jsp"><i class="tele"> </i>Logout</a></li>      

                            </c:when>
                        </c:choose>		
                    </ul>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="header-bottom bottom-com">
                <div class="container">			
                    <div class="logo">
                        <h1><a href="index.html"></a><img src="images/occhio3_.png"  ></h1>
                    </div>
                    <div class="top-nav">


                        <!-- start header menu -->
                        <ul class="megamenu skyblue menu-in">
                           



                            <li><a href="adminLoggato.jsp">Gestione Account</a>
                            </li>

                            </li>
                        </ul>

                        <!---->
                        <div class="search-in" >
                            <div class="search" >
                                <form>
                                    <form method="POST" action="ServletRicercaPerNome">
							<input type="text" name="nomeProdotto" placeholder="Cerca prodotto per nome" class="text css-input" required>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <input  type="submit" class="btn" value="Cerca">
				</form>
				<div class="close-in"><img src="images/close1.png" width="20" height="20" alt="" /></div>
                            </div>
                            <!--<div class="right"><button></button></div>-->
                        </div>
                        <script type="text/javascript">
                            $('.search').hide();
                            $('button').click(function () {
                                $('.search').show();
                                $('.text').focus();
                            }
                            );
                            $('.close-in').click(function () {
                                $('.search').hide();
                            });
                        </script>

                        <!---->
                        <!--<div class="cart box_1">
                                <a href="checkout.html">
                                <h3> <div class="total">
                                        <span class="simpleCart_total"></span> (<span id="simpleCart_quantity"  class="simpleCart_quantity"></span> oggetti)</div>
                                        <img src="images/cart.png" alt=""/></h3>
                                </a>
                                <p><a href="javascript:;" class="simpleCart_empty">Svuota carrello </a></p>
                                <div class="clearfix"> </div>
                        </div>-->

                        <div class="clearfix"> </div>
                        <!---->
                    </div>

                </div>
                <div class="clearfix"> </div>
            </div>
        </div>


    </div>
</div></div>
<center><blockquote>
        <p id="RA"><span class="glyphicon glyphicon-envelope"></span> &nbsp;&nbsp;&nbsp;Ricerca Account con l'email.</p>
        
    </blockquote></center>
<div class="mio">
    <div style="margin-top:5%;margin-left:37%" name="myForm">
        <b>&nbsp;&nbsp;&nbsp;Indirizzo E-mail</b>
        <input type="text" name="nome" onclick='addColor("RA")' onfocus="removeWriter()" onblur='removeColor("RA")' onkeyUp="ajaxFunction(this.value);" onchange="delet()" />
    </div>

    <p id="result">

    </p>
    <!-- <tr><th>Nome</th><th>Email</th><th>Numero di telefono</th><th>Domicilio</th></tr>-->
    <table class="table table-striped" id="tab">
        <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>
    </table>

</div>
<center><blockquote>
        <p id="RF"><span class="glyphicon glyphicon-home"></span> &nbsp; &nbsp; &nbsp;Ricerca Account con per filtri.</p>
       
    </blockquote></center>
<div class="mio">
    <div style="margin-top:5%;margin-left:34%" name="myForm">
        <b></span>Comune di Residenza</b>
        <input type="text" name="domicilio"  onfocus="removeWriter2()" onclick='addColor("RF")'  onblur='removeColor("RF")' onkeyUp="ajaxFunctiondomicilio(this.value);" />
    </div>
    <p id="result">

    </p>
    <!-- <tr><th>Nome</th><th>Email</th><th>Numero di telefono</th><th>Domicilio</th></tr>-->
    <table class="table table-striped" id="tab2">
        <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th></tr>
    </table>

</div>
<!--<div class="footer" style="margin-top:70px;">
		<!--<div class="container">-->
			
          <!--           <div class="clearfix"> </div>        
              <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="index.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                      
                      
     </div>
 </div>-->
          <div>
              <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="index.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                   
          </div>
			
</body>
</html>
<body> 
