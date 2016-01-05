<%-- 
    Document   : index
    Created on : 17-dic-2015, 10.56.55
    Author     : alfredosantoro
--%>

<%@page import="it.unisa.account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

</head>
<body> 
            <%
            Account account = ((Account) session.getAttribute("account"));
            if((account==null) || (!account.getRuolo().equals("utente"))){
            
            %>
            <script type="text/javascript">
                location.href="index.jsp";
            </script>
            <%}
            Integer prodottiCarr = ((Integer) session.getAttribute("prodottiCarr"));
            if(prodottiCarr == null){
                prodottiCarr = 0;
            }
            String messaggio = ((String) session.getAttribute("messaggio"));
            %>
            <script type="text/javascript">
                var msg = "<%=messaggio%>";
                if (msg) {
                    alert(msg);
                <% session.setAttribute("messaggio", "");%>
                }
                </script>
<!--header-->	
<div class="header">
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
		    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    <br>
                    <br>                  
                </div>
                <div class="col-md-4 sidebar">
	  		      <h3>Testimonianze</h3>
		  			    <div class="testimonials">
		  					 <h5>Finibus Bonorum Malorum<span><a href="#">http://demolink.org</a></span></h5>
		  					 <p><span class="quotes"></span>consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.<span class="quotes-down"></span></p>
		  				</div>	
		  				<div class="testimonials">
		  					 <h5>Finibus Bonorum <span><a href="#">http://demolink.org</a></span></h5>
		  					 <p><span class="quotes"></span>consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.<span class="quotes-down"></span></p>
		  				</div>
		  				<div class="testimonials">
		  					 <h5>H. Rackham<span><a href="#">http://demolink.org</a></span></h5>
		  					 <p><span class="quotes"></span>consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.<span class="quotes-down"></span></p>
		  				</div>
		  			
	  	</div>	
          </div>
                    </div>
                    <label class="line"> </label>
			<h2>Ultimi prodotti in offerta</h2>	
						 <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Bevande</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Alimenti</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Carta</span></li>
							  <div class="clearfix"></div>
						  </ul>				  	 
							<div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class="tab_img">
									  <div class="img-top simpleCart_shelfItem">
										
					   		  			   <img src="images/birra1.jpeg" class="img-responsive" alt=""/>
											
								              <div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 	<div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Birra Heineken</h6>
														<span class="dollor item_price">€ da 0,99</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
										
										</div>
										<div class="img-top simpleCart_shelfItem">
										  
					   		  			   <img src="images/coca1.jpeg" class="img-responsive" alt=""/>
											<div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												<div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Coca cola</h6>
														<span class="dollor item_price"> da € 1,00</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
											  
											 </div>
											  <div class="img-top simpleCart_shelfItem">
										  
					   		  			   <img src="images/latte.jpeg" class="img-responsive" alt=""/>
											<div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 <div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Latte Fresco</h6>
														<span class="dollor item_price"> da € 0,60</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
											 <div class="col-in col-in-1">
											  	
											  </div>
											</div>
											<div class="clearfix"></div>
							     </div>	
									 	        					 
						  </div>
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<div class="tab_img">
									  <div class="img-top simpleCart_shelfItem">
										
					   		  			   <img src="images/pandoro.jpeg" class="img-responsive" alt=""/>
											
								              <div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 <div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Pandoro</h6>
														<span class="dollor item_price"> da €1,99</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
										
										</div>
										<div class="img-top simpleCart_shelfItem">
										  
					   		  			   <img src="images/pasta.jpeg" class="img-responsive" alt=""/>
											<div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 <div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Pasta rummo</h6>
														<span class="dollor item_price"> da € 2,00</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
											  <div class="col-in">
											  	
											  </div>
											 </div>
											  <div class="img-top simpleCart_shelfItem">
										  
					   		  			   <img src="images/nutella.jpeg" class="img-responsive" alt=""/>
											<div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 <div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Nutella ferrero</h6>
														<span class="dollor item_price"> da €3,40</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
											 
											</div>
											<div class="clearfix"></div>
							     </div>	
									 	        					 
						  </div>
						    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
									<div class="tab_img">
									  <div class="img-top simpleCart_shelfItem">
										
					   		  			   <img src="images/fazzoletti.jpeg" class="img-responsive" alt=""/>
											
								              <div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 <div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Fazzoletti scottex</h6>
														<span class="dollor item_price">da € 0,79</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
										
										</div>
										<div class="img-top simpleCart_shelfItem">
										  
					   		  			   <img src="images/carta.jpeg" class="img-responsive" alt=""/>
											<div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 	<div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Scortex CartaCasa <br> Gigante</h6>
														<span class="dollor item_price">da € 1,89</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
											  <div class="col-in">
											  	
											  </div>
											 </div>
											  <div class="img-top simpleCart_shelfItem">
										  
					   		  			   <img src="images/cuki.jpeg" class="img-responsive" alt=""/>
											<div class="tab_desc">
												 <ul class="round-top">
												 	<li><a href="#"><i> </i></a></li>
												 	<li><a href="#"><i class="round"> </i></a></li>
												 </ul>
												 
												 	<div class="agency ">
													<div class="agency-left">
														<h6 class="jean">Alluminio Cuki</h6>
														<span class="dollor item_price">da € 1,10</span>
														<div class="clearfix"> </div>
													</div>
													<div class="agency-right">
														<ul class="social">
															<li><a href="#"><i class="item_add"> </i></a></li>
															
														</ul>
														<ul class="social-in">
														</ul>
														<div class="clearfix"> </div>
													</div>
												 </div>
											  </div>
											 
											</div>
											<div class="clearfix"></div>
							     </div>	
									 	        					 
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
				<form>
						
						<input type="text" value="Inserisci il nome*" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Inserisci il nome';}">
						
						<input type="text" value="Inserisci email*" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Inserisci email*';}">
						
						<input type="text" value="Inserisci il tuo numero*" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Inserisci il tuo numero';}">
					
						<textarea cols="10" rows="4" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Inserisci il messaggio';}">Inserisci il messaggio*</textarea>
						
							<input type="submit" value="Invia" style="float:left;">
						
					</form>
                        </div>
                       <div class="clearfix"> </div>         
                      <p class="footer-class">© 2015 Amberegul All Rights Reserved | Template by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                      <a  href="utenteLoggato.jsp"> <center> <img src="images/occhio3.png" class="img-responsive" alt=""/> </center></a>
                      
                      
        </div>
        </div>
			
<!---->
</body>
</html>
