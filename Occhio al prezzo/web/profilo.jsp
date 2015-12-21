<%-- 
    Document   : profilo
    Created on : 17-dic-2015, 15.14.58
    Author     : gemmacatolino
--%>

<%@page import="it.unisa.account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <%
            Account account = ((Account) session.getAttribute("account"));
        %>
<title>Amberegul A Ecommerce Category Flat Bootstrap Responsive Website Template | About :: w3layouts</title>
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
                    <c:choose>
                        <c:when test="${sessionScope.email != null}">
                            
                            <li ><a><i class="title"> </i>Ciao ${sessionScope.email}!</a></li>
                            
                              <li ><a href="index.jsp"><i class="tele"> </i>Logout</a></li>      
                            
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
				
						
				  <li><a><button>Cerca prodotti</button></a>
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
							$('button').click(function (){
							$('.search').show();
							$('.text').focus();
							}
							);
							$('.close-in').click(function(){
							$('.search').hide();
							});
						</script>
				
				<li><a  href="contatti.jsp">Contatti</a>
					
				</li>
		 </ul> 
		 <!---->
		

					<!---->
					<div class="cart box_1">
						<a href="carrello.jsp">
						<h3> <div class="total">
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Svuota carrello</a></p>
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

		<!---->
                <div class="container">
  
  
  <div id="table" class="table-editable">
    
    <table class="table">
        <tr>
            <th>
                Impostazioni account
            </th>
        </tr>
      <tr>
        <td contenteditable="false">Nome</td>
        <td contenteditable="true" id="nome"></td>
        
      </tr>
            <tr>
        <td contenteditable="false">Cognome</td>
        <td contenteditable="true" id="cognome"></td>
        
            </tr>
                        <tr>
        <td contenteditable="false">Email</td>
        <td contenteditable="true" id="email"></td>
        
            </tr>
    <tr>
        <td contenteditable="false">Password</td>
        
        <td contenteditable="true" id="password"></td>
       
            </tr>
                                    <tr>
        <td contenteditable="false">Domicilio</td>
        <td contenteditable="true" id="domiclio"></td>
        
            </tr>
                                    <tr>
        <td contenteditable="false">Data di nascita</td>
        <td contenteditable="true" id="data_di_nascita"></td>
        
            </tr>
                 
                 
                 





            
      <!-- This is our clonable table line -->
      <tr class="hide">
        <td contenteditable="true">Untitled</td>
        <td contenteditable="true">undefined</td>
        
        <td>
          <span class="table-up glyphicon glyphicon-arrow-up"></span>
          <span class="table-down glyphicon glyphicon-arrow-down"></span>
        </td>
      </tr>
      
      
    </table>
  </div>  
                    
    <div>                  
  
       <ul class=" left">
				
           <ld><a href="#"> <img src="images/deleteuser.png" ></a></ld>
     
         <ld><a  href="impostazioniProfilo.jsp"> <img src="images/mod.png" ></a></ld> 
     </ul>
       
                       

  </div>
  <p id="export"></p>
</div>
		
			<!---->
						<div class="content-bottom">
			<div class="container">
			
<label class="line1"> </label>
			</div>
		</div>
<!---->

<!---->
</body>
</html>
