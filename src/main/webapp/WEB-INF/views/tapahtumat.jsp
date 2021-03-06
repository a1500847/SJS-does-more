<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<!-- jstl funktiot. käytetään osallistujalistan pituuden saamiseen -->
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/css/materialize.min.css" />"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/css/materialize.css" />"  media="screen,projection"/>
	  <!--Import MEIDÄN OMA CSS -->
	  <link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/css/general.css" />"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"> <!-- saa IE sivut rokkaamaan -->
	 
		  
    </head>

    <body>

      <ul id="dropdown1" class="dropdown-content">
      <li><a href="?lang=fi">FI</a></li>
      <li><a href="?lang=swe">SWE</a></li>
      <li><a href="?lang=en">EN</a></li>
      </ul>

  <nav>
     <div class="nav-wrapper">
      <a href="./" class="brand-logo center"><img class="responsive-img" src="<c:url value="/resources/images/logo2_s.png" />" alt="Do" id="navlogo" /></a>
      <a href="./" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="left hide-on-med-and-down">
        <li><a href="./"><spring:message code="etusivu"/></a></li>
        <li><a href="luotapahtuma"><spring:message code="luotapahtuma"/></a></li>
        <li><a href="tapahtumat"><spring:message code="etsitapahtuma"/></a></li>
        <li><a href="yhteystiedot"><spring:message code="yhteystiedot"/></a></li>
      </ul>
       <!-- Dropdown Trigger -->
      
	  <ul class="right">
	  <li><a class="dropdown-button" href="#!" data-activates="dropdown1"><i class="material-icons">language</i></a></li>
	  </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="./"><span class="material-icons" id="navicon">home</span><spring:message code="etusivu"/></a></li>
        <li><a href="luotapahtuma"><span class="material-icons" id="navicon">event_note</span><spring:message code="luotapahtuma"/></a></li>
        <li><a href="tapahtumat"><span class="material-icons" id="navicon">search</span><spring:message code="etsitapahtuma"/></a></li>
        <li><a href="yhteystiedot"><span class="material-icons" id="navicon">phone</span><spring:message code="yhteystiedot"/></a></li>
      </ul>
    </div>
  </nav>
          
	
	<div class="row" id="ruutu">
	
	<div  class="container center-align">
	
	
	
	<h2><spring:message code="tapahtuma.otsikko"/><i class="material-icons">keyboard_arrow_down</i></h2>
	</div>
	
	 <ul class="collapsible" data-collapsible="accordion">
	 <c:forEach items="${tapahtumat}" var="tapahtuma">
    <li class="collection-item avatar">
	  <div class="collapsible-header hoverable">
      <span class="title"><c:out value="${tapahtuma.nimi}" /></span>
      <p><span class="material-icons">query_builder</span><fmt:formatDate pattern="HH:mm" value="${tapahtuma.aika}"/> 
      <span class="material-icons">today</span><fmt:formatDate pattern="dd.MM.yyyy" value="${tapahtuma.pvm}"/>
      <span class="material-icons">place</span><c:out value="${tapahtuma.paikka}" />
      <span class="material-icons">people</span>
      <span id="nykyinen"><c:out value="${tapahtuma.osallistujaLkm}"/></span> / <span id="maximi"><c:out value="${tapahtuma.maxOsallistujaLkm}" /></span></p>
	  </div>
	  <div class="collapsible-body">
	  
	  	  <div class="col s10">
	  <p class="title"><spring:message code="tapahtuma.lisatieto"/></p>
	  </div>
	  
	<div class="col m2 card small right">
		
    <div class="card-image waves-effect waves-block waves-light">   
    	
    	<img id="jarjestaja" class="activator" src="<c:out value="../userImages/${tapahtuma.kayttaja.id}/${tapahtuma.kayttaja.id}.jpg" />" onError="this.onerror=null;this.src='/SJS-does-more/resources/images/noimage.png';" />
    </div>
    <div class="card-content">
      <span class="card-title" id="nimi">
      <b class="truncate"><c:out value="${tapahtuma.kayttaja.etunimi}"/> <c:out value="${tapahtuma.kayttaja.sukunimi }"/></b></span>
      <span><h7><spring:message code="tapahtuma.jarjestaja"/></h7></span><br>    
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4"><spring:message code="tapahtuma.tietoaminusta"/><i class="material-icons right">close</i></span>
      <p><c:out value="${tapahtuma.kayttaja.kuvaus }"/></p>
    </div>
  </div>

  
      <div class="row">
	  
	  	<div class="col m5">
	  	<p><c:out value="${tapahtuma.kuvaus }" /> </p>
	  	<form:form action="tapahtumatiedot/${tapahtuma.id}" method="get">
	  	<div id="lisatietojanappi" onload="nappifunktio()">
	  	<button class="btn waves-effect indigo darken-4 waves-light" type="submit"><spring:message code="osallistu"/>	
	  	<i class="material-icons right">send</i></button>
	  	

	  	
	  	</div>
	  	</form:form>
		</div>
		<div class="col m5">
		
		<table class="highlight centered responsive">
		<thead>
          <tr>
              <th data-field="osallistujat"><spring:message code="tapahtuma.osallistujat"/></th>
          </tr>
        </thead>

        <tbody>
       
       
      	<!-- jos osallistujalistan pituus on suurempi kuin 0, näytä lista. jos ei, näytä viesti -->
       	 <c:choose>     		
       		<c:when test="${fn:length(tapahtuma.osallistujat) gt 0}">
		         <c:forEach items="${tapahtuma.osallistujat}" var="kayttaja">     	 
			          <tr>
			            <td><c:out value="${kayttaja.etunimi}"/> <c:out value="${kayttaja.sukunimi }"/></td>
			          </tr>
			     </c:forEach>
        	 </c:when>
	         <c:otherwise>
	         	 <td><spring:message code="eiosallistujiaviesti"/></td>
	         </c:otherwise>        
          </c:choose>
        </tbody>
		</table>
		
		</div>
	 
	  <div class="col s12">
	  
	
		
        <div class="input-field col sm2">
          
	  </div>
	  
	  <div class="divider"></div>
	  </div>
   
    
    </c:forEach> 
    
  </ul>

	</div>
	

	

      <!--Import jQuery before materialize.js AINA LOPPUUN!!!!!!!!!!!-->
         <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js" />"></script>
	  	<script type="text/javascript" src="<c:url value="/resources/js/materialize.js" />"></script>
		<script>
		
  $('.button-collapse').sideNav({
  // Initialize collapse button
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );
    // Initialize collapsible (uncomment the line below if you use the dropdown variation)
  //$('.collapsible').collapsible();
	</script>
	
	<!--   <script type="text/javascript">
	document.getElementById("jarjestaja").onerror = function() {myFunction()};

	function myFunction() {
		var elem = document.createElement("img");
		elem.setAttribute("src", "/resources/images/noimage.png");
		document.getElementById("jarjestaja").appendChild(elem);
	}
	</script> -->
	
	


    </body>
  </html>