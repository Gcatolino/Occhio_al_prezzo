<%-- 
    Document   : provaAccount
    Created on : 17-dic-2015, 23.51.40
    Author     : raffaele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "") || (session.getAttribute("ruolo") == null) || (session.getAttribute("ruolo") == "")) {
       %>
        <script type="text/javascript">
           location.href="login.jsp";
        </script>
    <%}else{
        if(session.getAttribute("ruolo")!="admin"){%>
                 <script type="text/javascript">
            location.href="login.jsp";
        </script>
              <%  }
                }
%>

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
<style type="text/css">
    
    div.mio{
        width: 80%;
        height: 300px;      
        margin: auto;
        margin-top:20px;
        border-color: gainsboro;
        border-style: solid;
        border-width:1px;
        overflow: scroll;
    }
    #tab{
        margin-top:20px;
    }
     #tab2{
        margin-top:20px;  
    }
</style>
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
<script type="text/javascript">
    
var httpRequest
var result="vuoto";
 excolore=""
function addColor(id){
    
    paragrafo=document.getElementById(id);
    excolore=paragrafo.style.color;
    paragrafo.style.color="red"
}
function removeColor(id)
{
    paragrafo=document.getElementById(id);
    paragrafo.style.color=excolore
}
function delet()
{
   
/*if(tab.hasChildNodes())
{   alert("ci siamo")
    figli=tab.childNodes;
    for(i=0;i<figli.length;i++){
        tab.removeChild(figli[1])
        alert("rimosso");
    }
} */
}
function ajaxFunction(par)
{
tab=document.getElementById("tab").innerHTML="<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>"; 
httpRequest = new XMLHttpRequest();
 httpRequest.onreadystatechange = function()
 {
     
 if(httpRequest.readyState == 4 && httpRequest.status == 200 ) {
tab.innerHTML="   <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>";

result=httpRequest.responseText;
tab=document.getElementById("tab");
tab.innerHTML="<tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>"+result;

 }
 }
 httpRequest.open("GET","getAccountByEmailAccountServlet?email="+par,true);
 httpRequest.send(null);
} 

function ajaxFunctiondomicilio(par){
tab=document.getElementById("tab2").innerHTML=" <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>"; 
httpRequest = new XMLHttpRequest();
 httpRequest.onreadystatechange = function()
 {
     
 if(httpRequest.readyState == 4 && httpRequest.status == 200 ) {
tab.innerHTML="   <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>";

result=httpRequest.responseText;
tab=document.getElementById("tab2")
tab.innerHTML="   <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>"+result;
 
 }
 }
 httpRequest.open("GET","getAccountByFiltriAccountServlet?domicilio="+par,true);
 httpRequest.send(null);
    
}

</script>
</head> 
<body>
<!--header-->	

	<div class="header-top">
		<div class="container">
			<div class="header-top-in">
				
				<ul class="support">
					<li ><a href="mailto:info@gmail.com" ><i > </i>info@gmail.com</a></li>
					<li ><span ><i class="tele-in"> </i>0 462 261 61 61</span></li>			
				</ul>
				<ul class=" support-right">
					<li ><a href="account.html" ><i class="men"> </i>Logout</a></li>
					<!--<li ><a href="register.html" ><i class="tele"> </i>Crea account</a></li>-->			
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
			<li><a  href="index.jsp">Home</a></li>
			
			
                        
                        <li><a href="adminloggato.jsp">Gestione Account</a>
        			</li>
                              
                        
				
				<!--<li><a  href="contact.html">Contatti</a>-->
					
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
						<!--<div class="right"><button></button></div>-->
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
					<!--<div class="cart box_1">
						<a href="checkout.html">
						<h3> <div class="total">
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity"  class="simpleCart_quantity"></span> oggetti)</div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Svuota carrello </a></p>
						<div class="clearfix"> </div>
					</div>-->

<div class="clearfix"> </div>
					<!---->
				</div>
	
			</div>
			<div class="clearfix"> </div>
		</div>
		</div>

	
</div>
</div></div>
<center><blockquote>
  <p id="RA">Ricerca Account con l'email.</p>
  <footer>Le operazioni concesse sono: <cite title="Source Title">elimina</cite></footer>
    </blockquote></center>
<div class="mio">
<form style="margin-top:5%;margin-left:37%" name="myForm">
    <b><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;&nbsp;Indirizzo E-mail</b>
    <input type="text" name="nome" onclick='addColor("RA")' onblur='removeColor("RA")' onkeyUp="ajaxFunction(this.value);" onchange="delet()" />
</form>
    
    <p id="result">
    
    </p>
      <!-- <tr><th>Nome</th><th>Email</th><th>Numero di telefono</th><th>Domicilio</th></tr>-->
    <table class="table table-striped" id="tab">
    <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>
    </table>
     
</div>
<center><blockquote>
  <p id="RF">Ricerca Account con per filtri.</p>
  <footer>Le operazioni concesse sono: <cite title="Source Title">elimina</cite></footer>
    </blockquote></center>
<div class="mio">
<form style="margin-top:5%;margin-left:37%" name="myForm">
    <span class="glyphicon glyphicon-tower"></span><b>&nbsp;&nbsp;&nbsp;Domicilio</b>
    <input type="text" name="domicilio" onclick='addColor("RF")' onblur='removeColor("RF")' onkeyUp="ajaxFunctiondomicilio(this.value);" />
</form>
     <p id="result">
    
    </p>
      <!-- <tr><th>Nome</th><th>Email</th><th>Numero di telefono</th><th>Domicilio</th></tr>-->
    <table class="table table-striped" id="tab2">
    <tr><th>email</th><th>nome</th><th>cognome</th><th>residenza</th><th>domicilio</th><th>ruolo</th><th>data di nascita</th><th>operazione</th></tr>
    </table>
     
</div>
</body>
</html>
<body> 
