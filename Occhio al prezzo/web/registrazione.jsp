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
					<li ><a href="mailto:info@gmail.com" ><i > </i>info@gmail.com</a></li>
					<li ><span ><i class="tele-in"> </i>0 462 261 61 61</span></li>			
				</ul>
				<ul class=" support-right">
					<li ><a href="account.html" ><i class="men"> </i>Login</a></li>
					<li ><a href="register.html"><i class="tele"> </i>Crea account</a></li>			
				</ul>
				<div class="clearfix"> </div>
			</div>
		</div>
			<div class="header-bottom bottom-com">
			<div class="container">			
				<div class="logo">
					<h1><a href="index.html"><img src="images/occhio3_.png"  ></a></h1>
				</div>
				<div class="top-nav">
				<!-- start header menu -->
		<ul class="megamenu skyblue menu-in">
			<li><a  href="index.html">Home</a></li>
			
				
						
				<li><a  href="#">Cerca prodotti</a>
				
				</li>
				
				<li><a  href="contact.html">Contatti</a>
					
				</li>
		 </ul> 
		 <!---->
		 <div class="search-in" >
			<div class="search" >
						<form>
							<input type="text" value="Keywords" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Keywords';}" class="text">
							<input type="submit" value="SEARCH">
						</form>
							<div class="close-in"><img src="images/close.png" alt="" /></div>
					</div>
						<div class="right"><button> </button></div>
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

					<!---->
				<div class="cart box_1">
						<a href="checkout.html">
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
		  	  <form id="registrationForm" class="form-horizontal" method="POST" action="addAccountServlet"/> 
				
					
					<div class="mation">
					<div>
						<span id="nome">Nome</span>
						<input type="text"> 
					</div>
					<div>
						<span id="cognome">Cognome</span>
						<input type="text"> 
					 </div>
					 <div>
						 <span id="email">Email </span>
						 <input type="text">
						 </div>
						 <div>
							<span id="password">Password</span>
								<input type="password">						 
					</div>
                                             <div>
							<span>Conferma Password</span>
								<input type="password">						 
					</div>
                                             <div>
							<span id="domiclio">Domicilio</span>
								<input type="text">						 
					</div>
                                             <div>
							<span id="data_di_nascita">Data di nascita</span>
								<input type="text">						 
					</div>
                                             <div>
							<span id="comune_di_residenza">Comune di Residenza</span>
								<input type="text">						 
					</div>
					 </div>
				     <input type="submit" id="register" value="Registrati"> 
				</form>
				
				
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
                      <p><a  href="index.html"> <img src="images/occhio3.png" class="img-responsive" alt=""/></a>
                      </p>
                </div>
	</div>
<!---->
</body>
</html>