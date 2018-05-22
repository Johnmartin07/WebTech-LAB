<%-- 
    Document   : ShowInformation
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        
    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Packages - Musiify</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/vendor.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>
    <script src="js/pace.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>    

    <!-- favicons
    ================================================== -->
    <link rel="icon" type="image/png" href="images/icons/oie_transparent.png"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
    <link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>    
        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- pageheader ================================================== -->
    <div class="s-pageheader">

        <header class="header" style="padding-bottom: 0px">
            
        <%   
        String username = request.getParameter("comp_username");
        if((username!=null))
        {
        session.setAttribute("comp_username",username);
        } 
        String password = request.getParameter("comp_pass");
        if((password!=null))
        {
        session.setAttribute("comp_pass",password);
        } 
        %>             
 
            <div class="header__content row" style="padding-top: 20px">

                <div class="header__logo" style="position: absolute; top: 5%; left: 46%;">
                    <a class="logo" href="ShowPackages.jsp?comp_username=<%= session.getAttribute("comp_username")%>">
                        <img src="images/cbm7z-0i5cb.svg" alt="Homepage" style="object-fit: cover;">
                    </a>
                </div> <!-- end header__logo -->
                   
                <div class="dropdown" style="position: relative; left: 695px">
                </div>
                <br>
                <br>
                <br>
                <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>

                </div>  <!-- end header__search -->

                <nav class="header__nav-wrap">

                     <h2 class="header__nav-heading h6">Site Navigation</h2>


                    <ul class="header__nav">
                        <li class="current"><a href="ShowPackages.jsp?comp_username=<%= session.getAttribute("comp_username")%>" title="">Services</a></li>
                        <li class="has-children">
                            <a href="#0" title="">My Profile</a>
                            <ul href="0" class="sub-menu">
                                <li><a href="ShowInformation.jsp">Edit Profile</a></li>
                                <li><a href="ShowRequests.jsp?comp_username=<%= session.getAttribute("comp_username")%>">Request</a></li>
                                <li><a href="ShowTransaction.jsp?comp_username=<%= session.getAttribute("comp_username")%>">Transaction</a></li>
                                <li><a href="index.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul> <!-- end header__nav -->

                </nav> <!-- end header__nav-wrap -->

            </div> <!-- header-content -->
        </header> <!-- header -->
    </div> 
    <!-- end s-pageheader -->       
    </head>
<center>
    <body id="top">
        <sql:setDataSource
            driver="com.mysql.jdbc.Driver"
            user="root"
            password=""
            url="jdbc:mysql://localhost:3306/musify"/>

        <sql:query var="result">
                SELECT pack_id, pack_name, pack_desc, pack_item, price, pack_status, comp_name
                FROM package
                WHERE pack_name = ?
            
            <sql:param>
                ${param.pack_name}
            </sql:param>
        </sql:query>

        <c:choose>
            <c:when test="${result.rowCount == 0}">
                <h2>No Package Information Found.</h2>
            </c:when>

            <c:otherwise>
                    <tbody>
                        <c:forEach var="row" items="${result.rows}">

    <section class="s-content s-content--narrow">

        <div class="row">

            <div class="s-content__header col-full" >
                <h1 class="s-content__header-title">
                   ${row.pack_name}
                </h1>
            </div> <!-- end s-content__header -->
    
            <div class="s-content__media col-full">
                <div id="map-wrap">
                    <center><a><img src="images/rentals/package1.PNG" style="padding-top: 47px"></a></center>
                </div> 
            </div> <!-- end s-content__media -->

            <div class="col-full s-content__main" align="left">
                <h3>Description of package</h3>
                <p class="lead">
                   ${row.pack_desc}
                </p>

                <div class="row">
                    <div class="col-six tab-full">
                        <h3>Equipments available in package</h3>

                        <li>${row.pack_item}</li>

                    </div>
                    <div class="col-six tab-full">
                        <h3>Price Range</h3>

                        <p>${row.price}</p>

                    </div>
                </div> <!-- end row -->
        </div>

        </div> <!-- end row -->

<hr>
<br>
<br>
<div align="center">
<h2>EDIT PACKAGE</h2>
</div>
   
  <div class="container">

    <form class="well form-horizontal" action="UpdatePackage.jsp" method="post" id="contact_form">
        <input type=hidden name="pack_id" value = "${row.pack_id}">
        <input type=hidden name="comp_name" value = "${row.comp_name}">
        
        <fieldset>
            <!-- Text input-->

            <div class="form-group">
              <label class="col-md-4 control-label">Package Name</label>  
              <div class="col-md-4 inputGroupContainer">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-gift"></i></span>
              <input  name="npack_name" placeholder="Package Name" class="form-control" type="text" value="${row.pack_name}">
                </div>
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label">Package Description</label>
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                        <textarea class="form-control" name="npack_desc" placeholder="Package Description"></textarea>
              </div>
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label">Package Items</label>
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                        <textarea class="form-control" name="npack_item" placeholder="List of Items"></textarea>
              </div>
              </div>
            </div>
            <!-- Text input-->

            <div class="form-group">
              <label class="col-md-4 control-label">Package Price</label>  
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-php">	&#8369;</i></span>
              <input name="nprice" placeholder="Price" class="form-control"  type="number">
                </div>
              </div>
            </div>

            <!-- Button -->
            <div class="form-group">
              <label class="col-md-4 control-label"></label>
              <div class="col-md-4">
                <button type="submit" class="btn btn-warning"> SAVE INFORMATION <span class="glyphicon glyphicon-send"></span></button>
              </div>
            </div>

        </fieldset>
      </form>
</div> <!-- /.container -->
    
                        </c:forEach>
            </c:otherwise>
        </c:choose>   
    <!-- Footer -->
    <footer class="py-5 bg-black">
      <div class="container">
        <p class="m-0 text-center text-white small">Copyright &copy; Musify 2018</p>
      </div>
      <!-- /.container -->
    </footer> 
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>