<%-- 
    Document   : impostazioniProfilo
    Created on : 20-dic-2015, 13.06.26
    Author     : Alfredo
--%>


<%@page import="it.unisa.account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Account account = ((Account) session.getAttribute("account"));
            if((account==null) || (!account.getRuolo().equals("utente"))){
            
        %>
        <script type="text/javascript">
            location.href="index.jsp";
            </script>
            <%}
            Integer prodottiCarr = ((Integer) session.getAttribute("prodottiCarr"));
            if(prodottiCarr == null){
                prodottiCarr = 0;
            }
        %>
        <title> Crea account </title>
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
        <script src="js/simpleCart.min.js"></script>
    </head>
    <body> 
        <!--header-->	
        <div class=" header-product">
            <div class="header-top com">
                <div class="container">
                    <div class="header-top-in grid-1">
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
                                                    function myfunction(){
							
							$('.search').show();
							$('.text').focus();
							
							
							$('.close-in').click(function(){
							$('.search').hide();
							});
                                                    };
							
						</script>
                                <li>
                                    <a href="profilo.jsp">Profilo</a>
                                </li>

                                <li><a  href="contatti.jsp">Contatti</a>

                                </li>
                            </ul> 
                            <!---->


                            <!---->
                        <div class="cart box_1">
						<a href="carrello.jsp">
						<h3> <div class="total">
                                                        <span><%= prodottiCarr %> Prodotti </span>	
                                                    </div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
                                                <% if(prodottiCarr > 0){ %>
						<p><a href="<%="svuotaCarrelloServlet"%>" class="simpleCart_empty">Svuota carrello </a></p>
                                                <%} else{ %>
                                                <p><span>Carrello Vuoto</span></p>
                                                <% } %>
						<div class="clearfix"> </div>
					</div>

                            <!---->
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>

        </div>
        <!---->

        <!---->
        <div class="container">
            <div class="register">
                <h3>Modifica dati personali</h3>
                <form id="registrationForm" name="modulo" class="form-horizontal" method="POST" /> 


                <div class="mation">
                    <div>
                        <span id="nome">Nome</span>
                        <input type="text" value="${sessionScope.account.nome}" id="nome" name="nome" > 
                    </div>
                    <div>
                        <span id="cognome">Cognome</span>
                        <input type="text" value="${sessionScope.account.cognome}" id="cognome" name="cognome"> 
                    </div>
                    <div>
                        <span id="email">Email </span>
                        <input type="text" value="${sessionScope.account.email}" id="email" name="email" readonly> 
                    </div>
                    <div>
                        <span id="password">Password</span>
                        <input type="password" value="${sessionScope.account.password}" id="password" name="password">						 
                    </div>
                    <div>
                        <span>Conferma Password</span>
                        <input type="password" value="${sessionScope.account.password}" id="conferma" name="conferma">						 
                    </div>
                    <div>
                        <span id="domiclio">Domicilio</span>
                        <input type="text" value="${sessionScope.account.domicilio}" id="domiclio" name="domicilio">						 
                    </div>
                    <div>
                        <span id="data_di_nascita">Data di nascita</span>
                        <input type="text" value="${sessionScope.account.dataDiNascita}" id="data_di_nascita" name="nascita">						 
                    </div>
                    <div>
                        <span id="comune_di_residenza">Comune di Residenza</span>
                        <input type="text" value="${sessionScope.account.comuneDiResidenza}" id="comune_di_residenza" name="comune">						 
                    </div>
                </div>
                <input type="submit" id="register" value="Modifica" onClick="Modulo()"> 
                </form>

            <script>
                        <!--
                        function Modulo() {
                        // Variabili associate ai campi del modulo
                        var nome = document.modulo.nome.value;
                        var cognome = document.modulo.cognome.value;
                        var email = document.modulo.email.value;
                        var password = document.modulo.password.value;
                        var conferma = document.modulo.conferma.value;
                        var domicilio = document.modulo.domicilio.value;
                        var nascita = document.modulo.nascita.value;
                        var comune = document.modulo.comune.value;
 
                        // Espressione regolare dell'email
                        var email_reg_exp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{2,})+\.)+([a-zA-Z0-9]{2,})+$/;
                        
                        //Effettua il controllo sul campo NOME
                        if ((nome == "") || (nome == "undefined")) {
                            alert("Il campo Nome è obbligatorio.");
                            document.modulo.nome.focus();
                            return false;
                        }
                        //Effettua il controllo sul campo COGNOME
                        else if ((cognome == "") || (cognome == "undefined")) {
                            alert("Il campo Cognome è obbligatorio.");
                            document.modulo.cognome.focus();
                            return false;
                        }
                        //Effettua il controllo sul campo PASSWORD
                        else if ((password == "") || (password == "undefined")) {
                            alert("Il campo Password è obbligatorio.");
                            document.modulo.password.focus();
                            return false;
                        }
                        //Effettua il controllo sul campo CONFERMA PASSWORD
                        else if ((conferma == "") || (conferma == "undefined")) {
                            alert("Il campo Conferma Password è obbligatorio.");
                            document.modulo.conferma.focus();
                            return false;
                        }
                        //Verifica l'uguaglianza tra i campi PASSWORD e CONFERMA PASSWORD
                        else if (password != conferma) {
                            alert("La password confermata è diversa da quella scelta, controllare.");
                            document.modulo.conferma.value = "";
                            document.modulo.conferma.focus();
                            return false;
                        }
                        //Effettua il controllo sul campo DOMICILIO
                        else if ((domicilio == "") || (domicilio == "undefined")) {
                            alert("Il campo Domicilio è obbligatorio.");
                            document.modulo.domicilio.focus();
                            return false;
                        }
                        //Effettua il controllo sul campo DATA DI NASCITA
                        else if (document.modulo.nascita.value.substring(4,5) != "-" ||
                                 document.modulo.nascita.value.substring(7,8) != "-" ||
                                 isNaN(document.modulo.nascita.value.substring(0,4)) ||
                                 isNaN(document.modulo.nascita.value.substring(5,7)) ||
                                 isNaN(document.modulo.nascita.value.substring(8))) {
                             
                            alert("Inserire nascita in formato aaaa-mm-gg");
                            document.modulo.nascita.value = "";
                            document.modulo.nascita.focus();
                            return false;
                        }
                        else if (document.modulo.nascita.value.substring(8) > 31) {
                            alert("Impossibile utilizzare un valore superiore a 31 per i giorni");
                            document.modulo.nascita.select();
                            return false;
                        }
                        else if (document.modulo.nascita.value.substring(5,7) > 12) {
                            alert("Impossibile utilizzare un valore superiore a 12 per i mesi");
                            document.modulo.nascita.value = "";
                            document.modulo.nascita.focus();
                            return false;
                        }
                        else if (document.modulo.nascita.value.substring(0,4) < 1900) {
                            alert("Impossibile utilizzare un valore inferiore a 1900 per l'anno");
                            document.modulo.nascita.value = "";
                            document.modulo.nascita.focus();
                            return false;
                        }
                        //Effettua il controllo sul campo COMUNE
                        else if ((comune == "") || (comune == "undefined")) {
                            alert("Il campo Comune è obbligatorio.");
                            document.modulo.comune.focus();
                            return false;
                        }
                        else if (!email_reg_exp.test(email) || (email == "") || (email == "undefined")) {
                            alert("Inserire un indirizzo email corretto.");
                            document.modulo.email.select();
                            return false;
                        }
                        //INVIA IL MODULO
                        else {
                            document.modulo.action = "modificaAccountServlet";
                            document.modulo.submit();
                        }
                    }
                    //-->
                </script>

                
            </div>
        </div>
                    
                    <div class="clearfix"> </div>
	 <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="utenteLoggato.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                
        <!---->

        <!---->

        <!---->
    </body>
</html>


