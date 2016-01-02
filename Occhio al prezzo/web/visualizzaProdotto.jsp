<%-- 
    Document   : visualizzaProdotto
    Created on : 27-dic-2015, 15.37.29
    Author     : andreapilato
--%>

<%@page import="it.unisa.account.AccountManager"%>
<%@page import="it.unisa.carrello.Carrello"%>
<%@page import="it.unisa.account.Account"%>
<%@page import="it.unisa.prodotto.ProdottoManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.unisa.prodotto.Prodotto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat" %>
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

        <%
            Account account = ((Account) session.getAttribute("account"));
            int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
            int prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
            
            Prodotto prodotto = ProdottoManager.getInstance().ricercaProdottoPerID(idProdotto);
            String emailVenditore = prodotto.getFkEmail();
            String tmp = prodotto.getData().toString();
            String dat = tmp.substring(8, 10) + "/" + tmp.substring(5, 7) + "/" + tmp.substring(0, 4);
     
        %>
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
                                            <c:when test="${sessionScope.email != null}">
                                                <li><a><i class="title"> </i>Ciao ${sessionScope.account.email}!</a></li>
                                                
                                                <li ><a href="index.jsp"><i class="tele"> </i>Logout</a></li>      
                                            </c:when>
                                        </c:choose>		
				</ul>
				<div class="clearfix"> </div>
			</div>
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
        <div class="main-content" id="content">

                <div class="row">

                    <div class="col-sm-1"></div>

                    <div class="col-sm-10">

                        <div class="panel center-block">
                            <br>
                            <div class="col-lg-offset-4">
                                <h1>Visualizza Prodotto</h1>
                                <br>
                            </div>
                            <div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-3 col-lg-6">
                                        <table width="70%" align="center">
                                            <tr>
                                                <td rowspan="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <img SRC="<%=prodotto.getPathImmagine()%>" width="100" height="180">
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p>Marca:</p>
                                                </td>
                                                <td>
                                                        <%=prodotto.getMarca()%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p>Nome:</p>
                                                </td>
                                                <td>
                                                            <%= prodotto.getNome()%>
                                                </td>
                                                <tr>
                                                    <td>
                                                    <p>Taglia:</p>
                                                    </td>
                                                    <td>
                                                    <%= prodotto.getTaglia()%>  
                                                    </td>
                                                </tr>       
                                                <tr>
                                                    <td>
                                                    <p>Prezzo:</p>
                                                        <% String prezzo = formatoNumeri.format(prodotto.getPrezzo());
                                                            prezzo = prezzo.replace(',','.');
                                                        %>
                                                    <td>
                                                        <%= Double.parseDouble(prezzo)%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    <p>Punto Vendita:</p>
                                                    </td>
                                                    <td>
                                                    <%= prodotto.getPuntoVendita()%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    <p>Data:</p>
                                                    </td>
                                                    <td>
                                                        <%= dat%>
                                                    </td>
                                                </tr>
                                        </table>
                                        </div>
                                    </div>
                                                    
                                                    <table class="col-lg-offset-4">
                                                        <tr><td>
                                                            <br><br><br>
                                                        </td></tr>
                                                        <tr>
                                                            <td>
                                                                <input style="background:#ff5d56;" id="btn" type="submit" class="col-lg-offset-3" value="Aggiungi al carrello" onClick="location.href='<%= "aggiungiProdottoServlet?idProdotto=" + prodotto.getId()%>'">                                          
                                                            </td>
                                                            <td>
                                                                <input style="background:#ff5d56;" id="btn" type="submit" class="col-lg-offset-5" value="Localizza prodotto" onClick="location.href='<%= "localizzaProdotto.jsp?emailU=" + account.getEmail() + 
                                                                      "&emailV=" + emailVenditore%>'">
                                                            </td>
                                                               
                                                        </tr>
                                                    </table>
                                                    <br>
                            </div>
                        </div>
                    </div>
                          
                    <div class="col-sm-1"></div>

                </div>
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
    </body>
</html>