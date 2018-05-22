<%-- 
    Document   : ShowInformation
    Author     : Lenovo
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="pa"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Transactions - Musify</title>
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

    <!-- favicons
    ================================================== -->
    <link rel="icon" type="image/png" href="images/icons/oie_transparent.png"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- pageheader ================================================== -->
    <div class="s-pageheader">

        <header class="header" style="padding-bottom: 0px">
            
         <% 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conStr = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/musify", "root", "");           
        
            Statement statement2 = conStr.createStatement();
        
            String query2 = "SELECT lastname, firstname, location, rent_time, rent_startdate, rent_enddate, pack_name, comp_name, rent_status FROM rentals";
            ResultSet resultset2 = 
                statement2.executeQuery(query2);
                String location = request.getParameter("location");
                String rent_time = request.getParameter("rent_time");
                String lastname = request.getParameter("lastname");
                String firstname = request.getParameter("firstname");
                String rent_status = request.getParameter("nrent_status");
                PreparedStatement psi;
                String stIns = "UPDATE rentals SET rent_status=? WHERE location='"+location+"' AND rent_time='"+rent_time+"' AND lastname='"+lastname+"' AND firstname='"+firstname+"'  ";
                psi = conStr.prepareStatement(stIns);
                psi.setString(1, rent_status);
                psi.executeUpdate();
                resultset2.beforeFirst();
            
                Statement statement4 = conStr.createStatement();
                String query4 = "SELECT * FROM package";
                ResultSet resultset4 = 
                statement4.executeQuery(query4); 
                
                String pack_name = request.getParameter("pack_name");
                String compa_name = request.getParameter("compa_name");
                PreparedStatement psis;
                String stInss = "UPDATE package JOIN rentals ON package.comp_name = rentals.comp_name SET package.pack_status = 'available' WHERE rentals.rent_status = 'done' AND rentals.pack_name='"+pack_name+"' AND rentals.comp_name='"+compa_name+"' ";
                psis = conStr.prepareStatement(stInss);          
                psis.executeUpdate();
                resultset4.beforeFirst();   
   
                
            Statement statement = conStr.createStatement();
            String comp_username = request.getParameter("comp_username");
            String query = "SELECT comp_name FROM provider WHERE comp_username = '"+comp_username+"'";
            ResultSet resultset = 
                statement.executeQuery(query); 

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
                                <li><a href="index.jsp">Logout</a> </li>
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
    <body id="top">
   
    <%       
    while(resultset.next()){
    String comp_name = resultset.getString(1);
    %>      
    <section class="s-content s-content--narrow" style="padding-top: 0px">

        <div class="row">

            <div class="col-full s-content__main">

                <form name="cForm" id="cForm" method="post" action="">
                    <fieldset>

                    <div class="row add-bottom">

                        <div class="col-twelve">

                            <h3>PAID</h3>

                            <div class="table-responsive">
        <% 
            Statement statement1 = conStr.createStatement();
            String query1 = "SELECT lastname, firstname, location, rent_time, rent_startdate, rent_enddate, pack_name, comp_name, rent_status" 
                    + " FROM rentals WHERE rent_status = 'paid' AND comp_name = '"+comp_name+"'";
            ResultSet resultset1 = 
                statement1.executeQuery(query1) ; 
        %>

            <table>
            <thead>
            <tr>
                <th>Customer LastName</th>
                <th>Customer FirstName</th>
                <th>Location</th>
                <th>Time</th>
                <th>Starting Date</th>
                <th>Ending Date</th>
                <th>Package Name</th>
                <th>Company Name</th>
                <th>Status</th>
            </tr>
            </thead>
            <% while(resultset1.next()){ %>
                    <tbody> 
                    <tr>            
                        <td><%= resultset1.getString(1) %></td>
                        <td><%= resultset1.getString(2) %></td>
                        <td><%= resultset1.getString(3) %></td>
                        <td><%= resultset1.getString(4) %></td>
                        <td><%= resultset1.getDate(5) %></td>
                        <td><%= resultset1.getDate(6) %></td>
                        <td><%= resultset1.getString(7) %></td>
                        <td><%= resultset1.getString(8) %></td>
                        
                        <td><form action="ShowTransaction.jsp?comp_username=<%= session.getAttribute("comp_username")%>" method="post">
                                <input type="hidden" name="lastname" value="<%= resultset1.getString(1) %>">
                                <input type="hidden" name="firstname" value="<%= resultset1.getString(2) %>">
                                <input type="hidden" name="location" value="<%= resultset1.getString(3) %>">
                                <input type="hidden" name="rent_time" value="<%= resultset1.getString(4) %>">
                                <input type="hidden" name="pack_name" value="<%= resultset1.getString(7) %>">
                                <input type="hidden" name="compa_name" value="<%= resultset1.getString(8) %>">
                                <button type="submit" name="nrent_status" value="done">Done</button>
                                </form> 
                        </td>   
                     
                    </tr>
                </tbody>
            <% } %>
            </table>
            </div>
            </div>
            
            
            
     <div class="col-twelve">

        <h3>Done</h3>

        <div class="table-responsive">
        <% 
            Statement statement3 = conStr.createStatement();
            String query3 = "SELECT lastname, firstname, location, rent_time, rent_startdate, rent_enddate, pack_name, comp_name, rent_status" 
                    + " FROM rentals WHERE rent_status = 'done' AND comp_name = '"+comp_name+"'";
            ResultSet resultset3 = 
                statement1.executeQuery(query3) ; 
        %>

            <table>
            <thead>
            <tr>
                <th>Customer LastName</th>
                <th>Customer FirstName</th>
                <th>Location</th>
                <th>Time</th>
                <th>Starting Date</th>
                <th>Ending Date</th>
                <th>Package Name</th>
                <th>Company Name</th>
            </tr>
            </thead>
            <% while(resultset3.next()){ %>
                    <tbody> 
                    <tr>            
                        <td><%= resultset3.getString(1) %></td>
                        <td><%= resultset3.getString(2) %></td>
                        <td><%= resultset3.getString(3) %></td>
                        <td><%= resultset3.getString(4) %></td>
                        <td><%= resultset3.getDate(5) %></td>
                        <td><%= resultset3.getDate(6) %></td>
                        <td><%= resultset3.getString(7) %></td>
                        <td><%= resultset3.getString(8) %></td>                     
                    </tr>
                </tbody>
            <% } %>
            </table>
            </div>
            </div>           
            

    </div> <!-- end row -->
    </section> <!-- s-content -->
  <% } %>    

    <!-- Footer -->
    <footer class="py-5 bg-black">
      <div class="container">
        <p class="m-0 text-center text-white small">Copyright &copy; Musify 2018</p>
      </div>
      <!-- /.container -->
    </footer>
                
    </body>
</html>
