<%-- 
    Document   : gestioneProdotto
    Created on : 19-dic-2015, 15.02.43
    Author     : andreapilato
--%>
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
<link rel="stylesheet" href="../css/bootstrap.css">
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
    
    <%
        Account account =  ((Account) session.getAttribute("account"));            
        String fkEmail = account.getEmail();
        ArrayList<Prodotto> prodotti = ProdottoManager.getInstance().ricercaProdottiPerPuntoVendita(fkEmail);
        String messaggio = ((String)session.getAttribute("messaggio"));
    %>
<script type="text/javascript">
    var msg = "<%=messaggio%>";
    if(msg){
        alert(msg);
        <% session.setAttribute("messaggio","");%>
    }
</script>
	<div class="header-top">
		<div class="container">
			<div class="header-top-in">
				
				<ul class="support">
					<li ><a href="mailto:occhio_al_prezzo@gmail.com" ><i > </i>occhio_al_prezzo@gmail.com</a></li>
				</ul>
                                <ul class=" support-right">
                                         <c:choose>                    
                                            <li> 
                                                <span>Ciao ${sessionScope.account.nome}!</span>
                                            </li>
                                            <li>
                                                <a href="logout.jsp">
                                                    <span class="title">Logout</span>
                                                </a>
                                            </li>
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
			<li><a  href="venditoreLoggato.jsp">Home</a></li>
			
			
                        
                        <li><a href="gestioneProdotti.jsp">Gestione prodotti</a>
        			</li>
                              
		 </ul>

		 <!---->
				</div>
	
			</div>
			
		</div>
                            <br>
                            <div style="text-align: center;">
                                <a>
                                    <span style="font-size:2em;" class="glyphicon glyphicon-plus-sign" aria-hidden="true" onclick="location.href = 'inserimentoProdotto.jsp'" >
                                    </span>
                                </a>
                            </div>
                            <div class="panel-body">
                                <table  width="60%" align="center" >
                                    <thead>
                                    <th>Marca</th>
                                    <th>Nome</th>		
                                    <th>Taglia</th>
                                    <th>Prezzo</th>
                                    <th>Punto Vendita</th>
                                    <th>Data</th>
                                    <th>Path Immagine</th>
                                    </thead>

                                    <% for (Prodotto prodotto : prodotti) {%>
                                    <tr>
                                        <td><%= prodotto.getMarca()%></td>
                                        <td><%= prodotto.getNome()%></td>		
                                        <td><%= prodotto.getTaglia()%></td>
                                        <td><%= formatoNumeri.format(prodotto.getPrezzo())%>
                                        <td><%= prodotto.getPuntoVendita()%></td>
                                        <td><%= prodotto.getData()%></td>
                                        <td><%= prodotto.getPathImmagine()%></td>
                                        <td><img SRC="<%=prodotto.getPathImmagine()%>" width="50" height="70"></td>

                                        
                                        <td width="20px"> 
                                            <a>
                                                    <span style="font-size:1.5em;" class="glyphicon glyphicon-edit" aria-hidden="true" onclick="location.href = '<%= "modificaProdotto.jsp?idProdotto=" + prodotto.getID()%>'" >
                                                    </span>
                                            </a>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td width="20px">
                                            <a>
                                            <span style="font-size:1.5em;" class="glyphicon glyphicon-trash" aria-hidden="true" onclick="location.href = '<%= "ServletEliminaProdotto?idProdotto=" + prodotto.getID()%>'" >
                                            </span>
                                            </a>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <% }%>
                                </table>
                            </div>
		</div>

	

