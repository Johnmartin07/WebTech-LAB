<%-- 
    Document   : ShowInformation
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Musify</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
    <script  src="js/index.js"></script>


    <!-- favicons
    ================================================== -->
    <link rel="icon" type="image/png" href="images/icons/oie_transparent.png"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
    <link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
    <link rel="stylesheet" href="css/style.css">        
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    

	<center>

    <!-- pageheader
    ================================================== -->
    <section class="s-pageheader s-pageheader--home">

        <header class="header">

        <% 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conStr = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/musify", "root", "");           
        Statement statement = conStr.createStatement();
        
        String username = request.getParameter("comp_username");
        String query = "SELECT comp_name"
                + " FROM provider"
                + " WHERE provider.comp_username = '"+username+"'";
        ResultSet resultset = 
            statement.executeQuery(query); 
                
        if((username!=null))
        {
        session.setAttribute("comp_username",username);
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


        <div class="pageheader-content row">

            <div class="col-full">

                <div class="featured">

                    <div class="featured__column featured__column--big">
                        <div class="entry" style="background-image:url('images/thumbs/featured/featured-guitarman.jpg');">
                            
                            <div class="entry__content">
                            
                                <span class="entry__category"><a href="#0">Sound System Rental</a></span>
              

                                <h1><a href="#0" title="">Looking for Sound System Rental that is on the go, budget friendly and has great deals? Musify is the Webiste for you! </a></h1>
                            </div> 
                            
                        </div> <!-- end entry -->
                    </div> <!-- end featured__big -->

                    <div class="featured__column featured__column--small">

                        <div class="entry" style="background-image:url('images/thumbs/featured/2.jpg');">
                            
                            <div class="entry__content">
                                <span class="entry__category"><a href="#0">Sound system Rental</a></span>

                                <h1><a href="#0" title="">Open for all Company that want to be part of our Website</a></h1>

                            </div> 
                          
                        </div> <!-- end entry -->

                        <div class="entry" style="background-image:url('images/thumbs/featured/1.jpg');">

                            <div class="entry__content">
                                <span class="entry__category"><a href="#0">Equipment and other Sound System Rental</a></span>

                                <h1><a href="#0" title="">Timeline of sounds.</a></h1>

                            </div> <!-- end entry__content -->

                        </div> <!-- end entry -->

                    </div> <!-- end featured__small -->
                </div> <!-- end featured -->

            </div> <!-- end col-full -->
        </div> <!-- end pageheader-content row -->

    </section> <!-- end s-pageheader -->
    </head>
    
    <body id="top">  
        
    <!-- s-content
    ================================================== -->
     <section class="s-content">
    	<center>
        
        <div class="row masonry-wrap">
            <div class="masonry">

                <div class="grid-sizer"></div>        
       <% while(resultset.next()){
          String comp_name = resultset.getString(1); %>        
        <sql:setDataSource
            driver="com.mysql.jdbc.Driver"
            user="root"
            password=""
            url="jdbc:mysql://localhost:3306/musify"/>
           
        <sql:query var="result">
                SELECT pack_name, pack_desc, comp_name
                FROM package
                WHERE comp_name = '<%= comp_name %>'
        </sql:query> 
        <c:choose>
            <c:when test="${result.rowCount == 0}">
                <h2>No Package Information Found.</h2>
            </c:when>

            <c:otherwise>
                        <c:forEach var="row" items="${result.rows}">     
                            
                <article class="masonry__brick entry format-standard" data-aos="fade-up">
                        
                    <div class="entry__thumb">
                        <a href="ShowPackage.jsp?pack_name=${row.pack_name}" value="Multi-participant Meeting Style Sound Package" class="entry__thumb-link">
                            <img src="images/rentals/package1.PNG" 
                                     alt="">
                        </a>
                    </div>
    
                    <div class="entry__text">
                        <div class="entry__header">
                            <h1 class="entry__title"><a href="ShowPackage.jsp?pack_name=${row.pack_name}">${row.pack_name}</a></h1>
                            
                        </div>
                        <div class="entry__excerpt">
                            <p>
                               ${row.pack_desc}
                            </p>
                        </div>
                        <div class="entry__meta">
                            <span class="entry__meta-links">
                                <a href="RemovePackage.jsp?pack_name=${row.pack_name}">Remove</a>
				<a href="ShowPackage.jsp?pack_name=${row.pack_name}">Edit</a>
                            </span>
                        </div>
                    </div>
                </article> <!-- end article -->
         </c:forEach>
    </c:otherwise>
</c:choose>
        </div> <!-- end masonry -->
        </div> <!-- end masonry-wrap -->
        </section> <!-- s-content -->
     

        
<div align="center">
<h2>ADD PACKAGE</h2>
</div>
   
  <div class="container">

    <form class="well form-horizontal" action="AddPackage.jsp" method="post" id="contact_form">
        <input type=hidden name="comp_name" value = "<%= comp_name%>">
<%}%>           
        <fieldset>
            <!-- Text input-->

            <div class="form-group">
              <label class="col-md-4 control-label">Package Name</label>  
              <div class="col-md-4 inputGroupContainer">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-gift"></i></span>
              <input  name="pack_name" placeholder="Package Name" class="form-control" type="text">
                </div>
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label">Package Description</label>
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                        <textarea class="form-control" name="pack_desc" placeholder="Package Description"></textarea>
              </div>
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label">Add Items</label>
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                        <textarea class="form-control" name="pack_item" placeholder="List of Items"></textarea>
              </div>
              </div>
            </div>
            <!-- Text input-->

            <div class="form-group">
              <label class="col-md-4 control-label">Package Price</label>  
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-php">	&#8369;</i></span>
              <input name="price" placeholder="Price" class="form-control"  type="number">
                </div>
              </div>
            </div>


            <!-- Button -->
            <div class="form-group">
              <label class="col-md-4 control-label"></label>
              <div class="col-md-4">
                <button type="submit" class="btn btn-warning"> ADD <span class="glyphicon glyphicon-send"></span></button>
              </div>
            </div>

        </fieldset>
      </form>
</div> <!-- /.container -->

    <!-- s-extra
    ==================================================

    <!-- Footer -->
    <footer class="py-5 bg-black">
      <div class="container">
        <p class="m-0 text-center text-white small">Copyright &copy; Musify 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- preloader
    ================================================== -->
    <div id="preloader">
        <div id="loader">
            <div class="line-scale">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>

    

    <!-- Java Script
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
    
    </body>
</html>
