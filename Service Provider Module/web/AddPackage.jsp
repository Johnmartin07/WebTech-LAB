<%-- 
    Document   : ShowInformation
    Author     : Lenovo
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
     <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Packages - Musify</title>
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>
    <script src="js/pace.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="icon" type="image/png" href="images/icons/oie_transparent.png"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
       <div class="s-pageheader">

        <header class="header" style="padding-bottom: 0px">   
            <%            
            String username = request.getParameter("comp_username");
            if((username!=null))
            {
            session.setAttribute("comp_username",username);
            }
            %>
            <div class="header__content row">

                <div class="header__logo">
                    <a class="logo" href="ShowPackages.jsp?comp_username=<%= session.getAttribute("comp_username")%>">
                        <img src="images/cbm7z-0i5cb.svg" alt="Homepage" style="object-fit: cover;">
                    </a>
                </div> <!-- end header__logo -->
                
                <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>

                <nav class="header__nav-wrap">

                    <h2 class="header__nav-heading h6">Site Navigation</h2>
                    
                    <ul class="header__nav">
                        <li class="current"><a href="ShowPackages.jsp?comp_username=<%= session.getAttribute("comp_username")%>">Services</a></li>
                        <li class="has-children">
                            <a href="#0" title="">My Profile</a>
                            <ul class="sub-menu">
                                <li><a href="ShowInformation.jsp">Edit Profile</a></li>
                                <li><a href="ShowRequests.jsp?comp_username=<%= session.getAttribute("comp_username")%>">Request</a></li>
                                <li><a href="ShowTransaction.jsp?comp_username=<%= session.getAttribute("comp_username")%>">Transaction</a></li>
                                <li><a href="index.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul> <!-- end header__nav -->
      
                    <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>
                </nav> <!-- end header__nav-wrap -->

            </div> <!-- header-content -->
        </header> <!-- header -->
    </div> 
    <!-- end s-pageheader -->  
    
    </head>
    <body>  
        
            <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection conStr = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/musify", "root", "");           
            Statement statement = conStr.createStatement(); 
           
            String pack_name = request.getParameter("pack_name");
            session.setAttribute("pack_name",pack_name);
            
            String pack_desc = request.getParameter("pack_desc");
            String pack_item = request.getParameter("pack_item");
            int price = Integer.parseInt(request.getParameter("price"));
            String comp_name = request.getParameter("comp_name");
            String pack_status = "available";
            
            String query = "SELECT pack_id, pack_name, pack_desc, pack_item, price, pack_status, comp_name FROM package WHERE comp_name = '"+comp_name+"' and pack_name = '"+pack_name+"'";
            ResultSet resultset = 
            statement.executeQuery(query);

            PreparedStatement psi;
                String stIns = "INSERT into package(pack_name, pack_desc, pack_item, price, pack_status, comp_name) VALUES(?,?,?,?,?,?)";
                psi = conStr.prepareStatement(stIns);
                
                psi.setString(1, pack_name);
                psi.setString(2, pack_desc);
                psi.setString(3, pack_item);
                psi.setInt(4, price);
                psi.setString(5, pack_status);
                psi.setString(6, comp_name);
                
                
                psi.executeUpdate();
                resultset.beforeFirst();
               
%>
<center>
    <h2>You have Successfully Added a Package</h2>
    <section class="s-content s-content--narrow">

        <div class="row">

            <div class="s-content__header col-full">
                <h1 class="s-content__header-title">
                   <%= pack_name%>
                </h1>
            </div> <!-- end s-content__header -->
    
            <div class="s-content__media col-full">
                <div id="map-wrap">
                    <center><a><img src="images/rentals/package1.PNG" style="padding-top: 47px"></a></center>
                </div> 
            </div> <!-- end s-content__media -->

            <div class="col-full s-content__main">
                <h3>Description of package</h3>
                <p class="lead">
                   <%= pack_desc%>
                </p>

                <div class="row">
                    <div class="col-six tab-full">
                        <h3>Equipments available in package</h3>

                        <li><%= pack_item%></li>

                    </div>
                    <div class="col-six tab-full">
                        <h3>Price Range</h3>

                        <p><%= price%></p>

                    </div>
                </div> <!-- end row -->
        </div>

        </div> <!-- end row -->

    </section> <!-- s-content -->

    <!-- Footer -->
    <footer class="py-5 bg-black">
      <div class="container">
        <p class="m-0 text-center text-white small">Copyright &copy; Musify 2018</p>
      </div>
      <!-- /.container -->
    </footer> 
    
</body>                  
</html>