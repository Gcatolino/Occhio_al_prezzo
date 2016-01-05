<%-- 
    Document   : registrazione
    Created on : 17-dic-2015, 11.01.52
    Author     : gemmacatolino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!--//slider-script-->
<script src="js/simpleCart.min.js"> </script>
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
					<li ><a href="login.jsp" ><i class="men"> </i>Login</a></li>
					<li ><a href="registrazione.jsp"><i class="tele"> </i>Crea account</a></li>			
				</ul>
				<div class="clearfix"> </div>
			</div>
		</div>
			<div class="header-bottom bottom-com">
			<div class="container">			
				<div class="logo">
					<h1><a href="index.jsp"><img src="images/occhio3_.png"  ></a></h1>
				</div>
				<div class="top-nav">
				<!-- start header menu -->
		<ul class="megamenu skyblue menu-in">
                    <li><a  href="utenteLoggato.jsp">Home</a></li>
			
				
						
				<li><a><button>Cerca prodotti</button></a>
                        </li>
                          <div class="search-in" >
			<div class="search" >
						<form>
							<input type="text" value="Keywords" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Keywords';}" class="text">
							<input type="submit" value="SEARCH">
						</form>
							<div class="close-in"><img src="images/close.png" alt="" /></div>
					</div>
						
				</div>
						<script type="text/javascript">
							$('.search').hide();
							$('button').click(function (){
							$('.search').show();
							$('.text').focus();
							}
							);
							$('.close-in').click(function(){
							$('.search').hide();
							});
						</script>

		 </ul> 
		 <!---->
		 

					<!---->
				<div class="cart box_1">
						<a href="carrello.jsp">
						<h3> <div class="total">
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Carrello vuoto</a></p>
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

<div class="back">
   
</div>
		<!---->
		<div class="container">
		<div class="register">
		<h3>Registrazione</h3>
		  	  <form id="registrationForm" name="modulo" class="form-horizontal" method="POST"/> 
				
					
					<div class="mation">
					<div>
						<span id="nome">Nome</span>
						<input type="text" name="nome"> 
					</div>
					<div>
						<span id="cognome">Cognome</span>
						<input type="text" name="cognome"> 
					 </div>
					 <div>
						 <span id="email">Email </span>
						 <input type="text" name="email">
                                        </div>
                                        <div>
                                                <span id="password">Password</span>
                                                <input type="password" name="password">						 
					</div>
                                        <div>
                                                <span>Conferma Password</span>
                                                <input type="password" name="conferma">						 
					</div>
                                        <div>
                                                <span id="domiclio">Domicilio</span>
                                                <input type="text" name="domicilio">						 
					</div>
                                        <div>
                                                <span id="data_di_nascita">Data di nascita</span>
                                                <input type="text" placeholder="gg/mm/aaaa" name="nascita">						 
					</div>
                                        <div>
                                                <span id="comune_di_residenza">Comune di Residenza</span>
                                                <input type="text" name="comune">						 
					</div>
                                        </div>
                                    <input type="submit" id="register" value="Registrati" onClick="Modulo()"> 
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
                        else if (document.modulo.nascita.value.substring(2,3) != "/" ||
                                 document.modulo.nascita.value.substring(5,6) != "/" ||
                                 isNaN(document.modulo.nascita.value.substring(0,2)) ||
                                 isNaN(document.modulo.nascita.value.substring(3,5)) ||
                                 isNaN(document.modulo.nascita.value.substring(6,10))) {
                             
                            alert("Inserire nascita in formato gg/mm/aaaa");
                            document.modulo.nascita.value = "";
                            document.modulo.nascita.focus();
                            return false;
                        }
                        else if (document.modulo.nascita.value.substring(0,2) > 31) {
                            alert("Impossibile utilizzare un valore superiore a 31 per i giorni");
                            document.modulo.nascita.select();
                            return false;
                        }
                        else if (document.modulo.nascita.value.substring(3,5) > 12) {
                            alert("Impossibile utilizzare un valore superiore a 12 per i mesi");
                            document.modulo.nascita.value = "";
                            document.modulo.nascita.focus();
                            return false;
                        }
                        else if (document.modulo.nascita.value.substring(6,10) < 1900) {
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
                            document.modulo.action = "addAccountServlet";
                            document.modulo.submit();
                        }
                    }
                    //-->
                </script>
                
		   </div>
			</div>
			<!---->
					
<!---->
	<div class="footer">
		<div class="container">
			<div class="col-md-4 footer-top">
				<h3>Contattaci</h3>
				<form>
						
						<input type="text" value="Inserisci il nome*" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Inserisci il nome';}">
						
						<input type="text" value="Inserisci email*" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Inserisci email*';}">
						
						<input type="text" value="Inserisci il tuo numero*" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Inserisci il tuo numero';}">
					
						<textarea cols="10" rows="4" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Inserisci il messaggio';}">Inserisci il messaggio*</textarea>
						
							<input type="submit" value="Invia" >
						
					</form>

			</div>
			<div class="clearfix"> </div>
	 <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="index.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                </div>
	</div>
<!---->
</body>
</html>
