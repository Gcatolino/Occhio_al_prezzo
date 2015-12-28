<%-- 
    Document   : carrello
    Created on : 17-dic-2015, 15.17.40
    Author     : gemmacatolino
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="it.unisa.prodotto.Prodotto"%>
<%@page import="it.unisa.carrello.CarrelloManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.unisa.carrello.Carrello"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amberegul A Ecommerce Category Flat Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
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
<script>€(document).ready(function(){€(".megamenu").megamenu();});</script>


<script src="js/simpleCart.min.js"> </script>
</head>
<body>  
    
    <% 
        Carrello carr = new Carrello();
        carr = (Carrello) session.getAttribute("carrello");
        ArrayList<Prodotto> prodotti = CarrelloManager.getInstance().visualizzaCarrello(carr);
    %>
   
<!--header-->	
<div class=" header-product">
	<div class="header-top com">
		<div class="container">
			<div class="header-top-in grid-1">
				<ul class="support">
					<li ><a href="mailto:info@example.com" ><i > </i>occhio_al_prezzo@gmail.com</a></li>
								
				</ul>
				<ul class=" support-right">
					<li ><a href="login.jsp" ><i class="men"> </i>Login</a></li>
					<li ><a href="registrazione.jsp" ><i class="tele"> </i>Create an Account</a></li>			
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
			
				
					
                        <li><a  href="#">Cerca prodotti</a>
				
				</li>
				
				<li><a  href="contatti.jsp">Contatti</a>
					
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
						<a href="carello.jspl">
						<h3> <div class="total">
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Oggetti)</div>
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
<div class="container">
	
</div>
<div class="back1">
	
</div>
		<!---->
		<div class="product">
			<div class="container">
				<div class="col-md-3 product-price">
					  
				
				<!---->
				<div class="product-bottom">
					
					<div class="product-go">
						
							
								
							<div class="clearfix"> </div>
							</div>
							<div class="product-go">
						
							
								
							<div class="clearfix"> </div>
							</div>
							<div class="product-go">
						
							
								
							<div class="clearfix"> </div>
							</div>
				</div>

				</div>
				<!---->
				<div class="col-md-9 product-price1">
				<div class="check-out">	 
			
		 <div class=" cart-items">
			 <h3>Carrello </h3>
				<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
						});	  
					});
			   </script>
			<script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
						$('.cart-header1').fadeOut('slow', function(c){
							$('.cart-header1').remove();
						});
						});	  
					});
			   </script>
				
                           <div class="in-check">
                               
                               <table class="table table-striped" id="tablecart">
                                       <thead class="sottolineato">
                                       <th>Prodotto</th>
                                    <th>&nbsp;Marca&nbsp;</th>
                                    <th>Nome&nbsp;</th>		
                                    <th>Taglia&nbsp;</th>
                                    <th>Prezzo&nbsp;</th>
                                    <th>Punto Vendita&nbsp;</th>
                                    <th></th>
                                    </thead>
                                    
                                    <%
                                        for(int i=0; i < prodotti.size(); i++){
                                            Prodotto prod = prodotti.get(i);
                                    %>
                                    
                                    <tr><td><img SRC="<%= prod.getPathImmagine()%>" width="100" height="180"></td>
                                        <td><%= prod.getNome()%></td>
                                        <td><%= prod.getMarca()%></td>
                                        <td><%= prod.getTaglia()%></td>
                                        <td><%= prod.getPrezzo()%></td>
                                        <td><%= prod.getPuntoVendita()%></td>
                                        <td><button onclick="location.href = '<%="eliminaProdottoServlet?idProdotto=" + prod.getId() %>'">Elimina</button></td>
                      </tr>
                      <%}%>
                  </table>	
                                   <div>
                                       <button type="submit" name="svuotacarrello" onclick="location.href = '<%="svuotaCarrelloServlet"%>'">Svuota Carrello</button>
                               </div>
			<div class="clearfix"> </div>
		  </ul>
		</div>
			 </div>
					  
		 </div>
		 

				</div>
				<div class="clearfix"> </div>
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
