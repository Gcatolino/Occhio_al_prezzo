<%-- 
    Document   : ricercaProdotto
    Created on : 26-dic-2015, 13.33.09
    Author     : andreapilato
--%>

<%@page import="it.unisa.prodotto.ProdottoManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.unisa.prodotto.Prodotto"%>
<%@page import="it.unisa.account.AccountManager"%>
<%@page import="it.unisa.account.Account"%>
<%@page import="java.text.NumberFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NumberFormat formatoNumeri = NumberFormat.getInstance();
    formatoNumeri.setMaximumFractionDigits(2);
    formatoNumeri.setMinimumFractionDigits(2);
%>
<!DOCTYPE html>
<html>
    <head>
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
        
    </head>
    <body> 
        <!--header-->	
        
        <%! String converti(String temp){
            String data = temp.substring(8, 10) + "/" + temp.substring(5, 7) + "/" + temp.substring(0, 4);
            return data;
        }
        %>
        <%
            Account account =  ((Account) session.getAttribute("account"));   
            ArrayList<Prodotto> prodotti = ((ArrayList<Prodotto>) session.getAttribute("prodotti"));
            int prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
            int pagine = (int) Math.ceil(prodotti.size()/15.0);
            String pagin= (""+request.getParameter("pagina"));
            int pagina = 0;
            if(pagina == 0 && pagin.equals("null")){
                pagina = 1;
            }
            else{
                pagina = Integer.parseInt(pagin);
            }
            int inizio = (pagina-1)*15;
            int fine = inizio + 15;
            if(fine > prodotti.size()){
                fine = prodotti.size();
            }
        %>

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

<div class="clearfix"> </div>
					<!---->
				</div>
	
			</div>
			<div class="clearfix"> </div>
		</div>
		</div>

	
</div>
                          <div class="panel-body">
                                <table width="60%" align="center" >
                                    <thead class="utente">
                                    <th>&nbsp;Marca&nbsp;</th>
                                    <th>Nome&nbsp;</th>		
                                    <th>Taglia&nbsp;</th>
                                    <th>Prezzo&nbsp;</th>
                                    <th>Punto Vendita&nbsp;</th>
                                    <th>Data&nbsp;</th>
                                    </thead>
                                    <tr class="sottolineato"><td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td></tr>

                                    <% for(; inizio < fine; inizio++){
                                        
                                            Prodotto prodotto = prodotti.get(inizio);
                                    %>
                                    
                                    <tr style="cursor:pointer;"  class="sottolineato utente col" onclick="location.href = '<%= "visualizzaProdotto.jsp?idProdotto=" + prodotto.getId()%>'">
                                        <td>&nbsp;<%= prodotto.getMarca()%>&nbsp;</td>
                                        <td><%= prodotto.getNome()%>&nbsp;</td>		
                                        <td><%= prodotto.getTaglia()%>&nbsp;</td>
                                        <td><%= formatoNumeri.format(prodotto.getPrezzo())%>&nbsp;</td>
                                        <td><%= prodotto.getPuntoVendita()%>&nbsp;</td>
                                        <td><%= converti(prodotto.getData().toString())%>&nbsp;</td>
                                    </tr>
                                    
                                    <%}%>
                                </table>
                                <% if(fine == 0){%>
                                <br>
                                <h1 align="center">Nessun prodotto trovato!</h1>
                                <%}%>
                            </div>
                          
                          <div align="center">
                              
                                  
                                  
                          <% for (int p = 1; p <= pagine; p++){%>
                          <a id="cliccabile" onclick="location.href = '<%= "ricercaProdotto.jsp?pagina=" + p%>'"><%=p%> </a>
                          <%}%>
                          </div>
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
