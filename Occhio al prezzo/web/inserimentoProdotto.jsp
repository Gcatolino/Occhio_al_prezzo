<%-- 
    Document   : InserimentoProdotto
    Created on : 16-dic-2015, 16.28.54
    Author     : andreapilato
--%>

<%@page import="it.unisa.account.Account"%>
<%@page import="it.unisa.prodotto.ProdottoManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.unisa.prodotto.Prodotto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
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
<script language="Javascript">
function isnum(numero) {

if (isNaN(numero.value)){
    alert('Nel campo è possibile immettere solo numeri (usare il punto)!');
    numero.value = "";
    numero.focus();
    }
}
</script>
</head>
<body> 
    
    <%
        Account account =  ((Account) session.getAttribute("account"));            
        String fkEmail = account.getEmail();
        session.setAttribute("fk_email", fkEmail);
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
        <div class="main-content" id="content">

                <div class="row">

                    <div class="col-sm-1"></div>

                    <div class="col-sm-10">

                        <div class="panel center-block">
                            <br>
                            <div class="col-lg-offset-4">
                                <h1>Inserisci Prodotto</h1>
                                <br>
                            </div>
                            <div>
                                <form class="form-horizontal" method="POST" action="ServletInserimentoProdotto" onSubmit="return controlla();">
                                    <div class="form-group">
                                        <div class="col-lg-offset-4 col-lg-6">
                                        <table width="90%" align="center">
                                            <tr><td>
                                                    <p>Marca:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="marca" type="text" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Nome:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="nome" type="text" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Taglia:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="taglia" type="number" step="any" onBlur="isnum(this)" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Prezzo:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="prezzo" type="number" step="any" onBlur="isnum(this)" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Punto Vendita:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="punto_vendita" type="text" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Data:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="data" type="date" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Path Immagine:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="path_immagine" type="text">
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div>
                                    <input type="submit" class="col-lg-offset-2" value="Inserisci"> 
                                    <br>
                                    <br>
                                </div>
                                                </td></tr>
                                        </table>

                                    </div>
                                        
                                </form>
                              </div>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-1"></div>

                </div>
            </div>
    </body>
</html>
