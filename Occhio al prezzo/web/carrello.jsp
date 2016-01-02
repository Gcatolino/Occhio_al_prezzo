<%-- 
    Document   : carrello
    Created on : 17-dic-2015, 15.17.40
    Author     : gemmacatolino
--%>

<%@page import="it.unisa.account.Account"%>
<%@page import="java.sql.SQLException"%>
<%@page import="it.unisa.prodotto.Prodotto"%>
<%@page import="it.unisa.carrello.CarrelloManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.unisa.carrello.Carrello"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Occhio al prezzo.it: Carrello</title>
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
        Account acc = new Account();
        acc = (Account) session.getAttribute("account");
        Carrello carr = new Carrello();
        carr = (Carrello) session.getAttribute("carrello");
        Integer prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
        if(prodottiCarr == null)
            prodottiCarr = 0; 
        ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
        if(carr == null){
            RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
            rs.forward(request, response);
        }else{
            prodotti = CarrelloManager.getInstance().visualizzaCarrello(carr);
            prodottiCarr = prodotti.size();
            session.setAttribute("prodottiCarr", prodottiCarr);
        }
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
					<li ><a href="login.jsp" ><i class="men"> </i>Ciao ${sessionScope.account.email}!</a></li>
					<li ><a href="LogoutServlet"><i class="tele"> </i>Logout</a></li>			
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
                                <li><a href="profilo.jsp">Profilo</a></li>
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
                                        <td><%= prod.getMarca()%></td>
                                        <td><%= prod.getNome()%></td>
                                        <td><%= prod.getTaglia()%></td>
                                        <td><%= prod.getPrezzo()%></td>
                                        <td><%= prod.getPuntoVendita()%></td>
                                        <td><button onclick="location.href = '<%="eliminaProdottoServlet?idProdotto=" + prod.getId() %>'">Elimina</button></td>
                      </tr>
                      <%}%>
                  </table>	
                                   <div>
                                       <% if(!prodotti.isEmpty()){ %>
                                       <p>
                                           <span style="font-size:1.7em; white-space: none;" class="glyphicon glyphicon-trash" onclick="location.href = '<%="svuotaCarrelloServlet "%>'"></span>
                                           <a style="font-size: 1.5em; text-decoration: none;" href="<%="svuotaCarrelloServlet"%>">&nbsp;Svuota Carrello</a>
                                       </p>  
                                       <% }else{ %>
                                       
                                       <h3 align="center">Carrello Vuoto</h3> 
                                       
                                       <% } %>
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
			<div class="clearfix"> </div>
			<p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="index.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                </div>
		</div>
<!---->
</body>
</html>
