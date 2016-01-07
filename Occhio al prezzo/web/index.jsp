<%-- 
    Document   : index
    Created on : 17-dic-2015, 10.56.55
    Author     : gemmacatolino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%
        String messaggio = ((String) session.getAttribute("messaggio"));
        %>
    <script type="text/javascript">
            var msg = "<%=messaggio%>";
            if ((msg !== "null") && (msg !== "")){
                alert(msg);
            <% session.setAttribute("messaggio", "");%>
            }
        </script>
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
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
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

<script src="js/simpleCart.min.js"> </script>

</head>
<body> 
<!--header-->	
<div class="header">
	<div class="header-top">
		<div class="container">
			<div class="header-top-in">
				
				<ul class="support">
					<li ><a href="mailto:occhio_al_prezzo@gmail.com" ><i > </i>occhio_al_prezzo@gmail.com</a></li>
								
				</ul>
				<ul class=" support-right">
					<li ><a href="login.jsp" ><i class="men"> </i>Login</a></li>
					<li ><a href="registrazione.jsp" ><i class="tele"> </i>Crea account</a></li>			
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
                        
                        
                        <li><a href="login.jsp">Cerca prodotti</a></li>
                                       
                        
                              
                       
				
                </ul>

		 <!---->

                
					<!---->
					<div class="cart box_1">
						<a href="carrello.jsp">
						<h3> <div class="total">
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity"  class="simpleCart_quantity"></span> oggetti)</div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Svuota carrello </a></p>
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
<!---->
<div class="content">
	<div class="container">

		<!---->
		<div class="sap_tabs">
                    <div class="container"> 
	  <div class="box_4">
	  	<div class="col-md-8 about_left">
	  		<h3>Occhio al prezzo</h3>
	        <img src="images/p1.jpg" class="img-responsive" alt="">
		    <p>Occhio al prezzo nasce con l’obiettivo di tenere informato l’utente sulle offerte di beni primari di consumo. Il sistema confronta i prezzi dei prodotti in offerta dei vari punti vendita italiani. Il portale offre la possibilità di cercare un singolo prodotto o più prodotti(non di sfogliare un semplice volantino), tenendone traccia in un comodo carrello. In questo modo la ricerca delle offerte è immediata.</p>
                    <br>
                    <br>                  
                </div>
                <div class="col-md-4 sidebar">
	  		      <h3>Dicono di noi..</h3>
		  			    <div class="testimonials">
		  					 <h4>Marco<span></h4>
                                                         <p><span class="quotes"></span>Ottimo portale, la aspettavo da tempo un'applicazione così!<span class="quotes-down"></span>
		  				</div>	
		  				<div class="testimonials">
		  					 <h4>Ilaria</h4>
		  					 <p><span class="quotes"></span>Semplice da utilizzare e tanto risparmio!<span class="quotes-down"></span></p>
		  				</div>
		  				<div class="testimonials">
		  					 <h4>Bruno</h4>
		  					 <p><span class="quotes"></span>Una web application comoda ed efficiente!<span class="quotes-down"></span></p>
		  				</div>
		  			
	  	</div>	
          </div>
                    </div>
                    
		<!---->
	</div>
	<!---->
		<div class="content-bottom">
			<div class="container">
			
<label class="line1"> </label>
			</div>
		</div>
		<!---->
	<div class="footer">
		<div class="container">
			<div class="col-md-4 footer-top">
				<h3>Contattaci</h3>
				<form name="modulo" method="post">
						
						<input type="text" name="nome" placeholder="Inserisci il nome*"  required>
						
						<input type="text" name="email" placeholder="Inserisci email*"  required>
						
						<textarea cols="10" name="messaggio" rows="4" placeholder="Inserisci il messaggio*" required></textarea>
						
							<input type="button" value="Invia" onClick="Modulo()">
						
				</form>
                                <script>
                                function Modulo() {
                        // Variabili associate ai campi del modulo
                        var nome = document.modulo.nome.value;
                        var email = document.modulo.email.value;
                        var messaggio = document.modulo.messaggio.value;
   
                        // Espressione regolare dell'email
                        var email_reg_exp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{2,})+\.)+([a-zA-Z0-9]{2,})+$/;
                        
                        if((document.modulo.nome.value === "") || (document.modulo.nome.value === "undefined")){
                            alert("Il campo Nome è obbligatorio.");
                            document.modulo.nome.focus();
                            return false;
                        }
                        else if (!email_reg_exp.test(email) || (email === "") || (email === "undefined")) {
                           alert("Inserire un indirizzo email corretto.");
                           document.modulo.email.select();
                           return false;
                        }
                        else if((messaggio === "") || (messaggio === "undefined")){
                            alert("Il campo Messaggio è obbligatorio.");
                            document.modulo.messaggio.focus();
                            return false;
                        }
                        else{
                        document.modulo.action = "ServletContatti";
                        document.modulo.submit();
                        }
                    }
                </script>
                        </div>
                       <div class="clearfix"> </div>         
                      <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="index.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                      
                      
        </div>
        </div>
			
<!---->
</body>
</html>
