<%-- 
    Document   : login
    Created on : 17-dic-2015, 15.13.59
    Author     : gemmacatolino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <%
        String messaggio = ((String) session.getAttribute("messaggio"));
        %>
    <script type="text/javascript">
            var msg = "<%=messaggio%>";
            if (msg) {
                alert(msg);
            <% session.setAttribute("messaggio", "");%>
            }
        </script>
<title>Registrazione su Occhio al prezzo.it</title>
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
					<li ><a href="registrazione.jsp" ><i class="tele"> </i>Crea Account</a></li>			
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
			<li><a  href="index.jsp">Home</a></li>
				
						
                        <li><a>Cerca prodotti</a>
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
							$('').click(function (){
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
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> oggetti)</div>
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
		<div class="account_grid">
			   <div class=" login-right">
			  	<h3>Accedi</h3>
				<p>Se hai un account effettua il login</p>
                                <form method="POST" id="email" action="loginServlet">
				  <div>
					<span>Email</span>
					<input name="email" type="text"> 
				  </div>
				  <div>
					<span>Password</span>
					<input name="password" type="password"> 
				  </div>
                                    <input  type="submit" value="Login ">
				  
				  
			    </form>
                                <br>
                                <br>
                                <a class="forgot" href="#">Password dimenticata?</a>
			   </div>	
			    <div class=" login-left">
			  	 <h3>Sei nuovo utente?  </h3>
				 <p>Crea un account sul nostro sito e potrai scoprire i prodotti in offerta!</p>
				 <a class="acount-btn" href="registrazione.jsp">Crea Account</a>
			   </div>
			
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
