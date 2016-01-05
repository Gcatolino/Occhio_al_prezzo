<%-- 
    Document   : modificaProdotto
    Created on : 19-dic-2015, 18.51.34
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
        <script language="Javascript">
            function isnum(numero) {

                if (isNaN(numero.value)) {
                            numero.value = numero.value.replace(",",".");
                            if(isNaN(numero.value)){
                                alert("Il campo Prezzo è un numero.");
                                numero.value="";
                            }
                }
                return true;
            }
        </script>
    </head>
    <body> 

        <%
            Account account = ((Account) session.getAttribute("account"));
            int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
            Prodotto prodotto = ProdottoManager.getInstance().ricercaProdottoPerID(idProdotto);
            String fkEmail = account.getEmail();
            session.setAttribute("idProdotto", idProdotto);
            session.setAttribute("fk_email", fkEmail);
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
                                                <li><a><i class="men"></i>Ciao ${sessionScope.account.email}!</a></li>
                                                
                                                <li><a href="LogoutServlet"><i class="title"></i>Logout</a></li>
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
                            <div class="col-lg-offset-5">
                                <h1>Modifica Prodotto</h1>
                                <br>
                            </div>
                            <div>
                                <form class="form-horizontal" name="modulo" method="POST">
                                    <div class="form-group">
                                        <div class="col-lg-offset-5 col-lg-6">
                                        <table width="90%" align="center">
                                            <tr><td>
                                                    <p>Marca:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="marca" type="text" value="<%= prodotto.getMarca()%>" required>
                                                    </div>
                                                    <br>
                                                    <p>Nome:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="nome" type="text" value="<%= prodotto.getNome()%>" required>
                                                    </div>
                                                    <br>
                                                    <p>Taglia:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="taglia" type="text" value="<%= prodotto.getTaglia()%>" required>  
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Prezzo:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <% String prezzo = formatoNumeri.format(prodotto.getPrezzo());
                                                            prezzo = prezzo.replace(',','.');
                                                        %>
                                                        <input class="text" name="prezzo" type="text" onBlur="isnum(this)" value="<%= Double.parseDouble(prezzo)%>" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Punto Vendita:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="punto_vendita" type="text" value="<%= prodotto.getPuntoVendita()%>" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <% 
                                                    %>
                                                    <p>Data:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="data" type="text" value="<%= dat%>" required>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <p>Path Immagine:</p>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"></span>
                                                        <input class="text" name="path_immagine" type="text" value="<%= prodotto.getPathImmagine()%>">
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div>
                                                        <input id="btn" type="submit" class="col-lg-offset-1" value="Aggiorna" onClick="Modulo()"> 
                                                        <br>
                                                        <br>
                                                    </div>
                                                </td></tr>
                                        </table>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <script>
<!--
                        function Modulo() {
                        // Variabili associate ai campi del modulo
                        var marca = document.modulo.marca.value;
                        var nome = document.modulo.nome.value;
                        var taglia = document.modulo.taglia.value;
                        var prezzo = document.modulo.prezzo.value;
                        var puntovendita = document.modulo.punto_vendita.value;
                        var data = document.modulo.data.value;
                        
                        
                        if(((marca === "") || (marca === "undefined"))){
                            alert("Il campo Marca è obbligatorio.");
                            document.modulo.marca.focus();
                            return false;
                        }
                        else if(((nome === "") || (nome === "undefined"))){
                            alert("Il campo Nome è obbligatorio.");
                            document.modulo.nome.focus();
                            return false;
                        }
                        
                        else if(((taglia === "") || (taglia === "undefined"))){
                            alert("Il campo Taglia è obbligatorio.");
                            document.modulo.taglia.focus();
                            return false;
                        }
                        else if(((prezzo === "") || (prezzo === "undefined"))){
                            alert("Il campo prezzo è obbligatorio.");
                            document.modulo.punto_vendita.focus();
                            
                            return false;
                            }
                        else if(((puntovendita === "") || (puntovendita === "undefined"))){
                            alert("Il campo Punto Vendita è obbligatorio.");
                            document.modulo.punto_vendita.focus();
                            return false;
                        }
                        
                        //Effettua il controllo sul campo DATA DI NASCITA
                        else if (document.modulo.data.value.substring(2,3) !== "/" ||
                                 document.modulo.data.value.substring(5,6) !== "/" ||
                                 isNaN(document.modulo.data.value.substring(0,2)) ||
                                 isNaN(document.modulo.data.value.substring(3,5)) ||
                                 isNaN(document.modulo.data.value.substring(6,10))) {
                             
                            alert("Inserire data in formato gg/mm/aaaa");
                            document.modulo.data.value = "";
                            document.modulo.data.focus();
                            return false;
                        }
                        else if (document.modulo.data.value.substring(0,2) > 31) {
                            alert("Impossibile utilizzare un valore superiore a 31 per i giorni");
                            document.modulo.data.select();
                            return false;
                        }
                        else if (document.modulo.data.value.substring(3,5) > 12) {
                            alert("Impossibile utilizzare un valore superiore a 12 per i mesi");
                            document.modulo.data.value = "";
                            document.modulo.data.focus();
                            return false;
                        }
                        else if (document.modulo.data.value.substring(6,10) < 1900) {
                            alert("Impossibile utilizzare un valore inferiore a 1900 per l'anno");
                            document.modulo.data.value = "";
                            document.modulo.data.focus();
                            return false;
                        }
                        else{
                        document.modulo.action = "ServletModificaProdotto";
                        document.modulo.submit();
                        }
                    }
                    //-->
                </script>                                        
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