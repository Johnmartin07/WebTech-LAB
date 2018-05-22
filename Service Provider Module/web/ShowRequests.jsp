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
    <title>Request - Musify</title>
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
                String stInss = "UPDATE package JOIN rentals ON package.comp_name = rentals.comp_name SET package.pack_status = 'unavailable' WHERE rentals.rent_status = 'accepted' AND rentals.pack_name='"+pack_name+"' AND rentals.comp_name='"+compa_name+"' ";
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
        <sql:setDataSource
            driver="com.mysql.jdbc.Driver"
            user="root"
            password=""
            url="jdbc:mysql://localhost:3306/musify"/>
   
<%            while(resultset.next()){
        String comp_name = resultset.getString(1);
        
        %>      
    <section class="s-content s-content--narrow" style="padding-top: 0px">

        <div class="row">

            <div class="col-full s-content__main">

                <form name="cForm" id="cForm" method="post" action="">
                    <fieldset>

                    <div class="row add-bottom">

                        <div class="col-twelve">

                            <h3>PENDING</h3>
                            <div class="table-responsive">

                            
    <!-- ================================================== -->
    
        <sql:query var="result1">
                SELECT lastname, firstname, location, rent_time, rent_startdate, rent_enddate, pack_name, comp_name, rent_status
                FROM rentals
                WHERE rent_status = 'pending'
                AND comp_name = '<%=comp_name%>'
           
        </sql:query>

        <p:choose>
            <p:when test="${result1.rowCount == 0}">
                <h2>No Request Information Found.</h2>
            </p:when>
             <p:otherwise>
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

                    <tbody>
                    <p:forEach var="row1" items="${result1.rows}">   
                    <tr>
                        <td>${row1.lastname}</td>
                        <td>${row1.firstname}</td>
                        <td>${row1.location}</td>
                        <td>${row1.rent_time}</td>
                        <td>${row1.rent_startdate}</td>
                        <td>${row1.rent_enddate}</td>
                        <td>${row1.pack_name}</td>
                        <td>${row1.comp_name}</td>
                        <td>    <form action="ShowRequests.jsp?comp_username=<%= session.getAttribute("comp_username")%>" method="post">
                                <input type="hidden" name="location" value="${row1.location}">
                                <input type="hidden"name="rent_time" value="${row1.rent_time}">
                                <input type="hidden" name="lastname" value="${row1.lastname}">
                                <input type="hidden"name="firstname" value="${row1.firstname}">
                                <input type="hidden" name="pack_name" value="${row1.pack_name}">
                                <input type="hidden"name="compa_name" value="${row1.comp_name}">
                                <button type="submit" name="nrent_status" value="accepted">Accept</button>
                                </form>
                            
                                <form action="ShowRequests.jsp?comp_username=<%= session.getAttribute("comp_username")%>" method="post">
                                <input type="hidden" name="location" value="${row1.location}">
                                <input type="hidden"name="rent_time" value="${row1.rent_time}">
                                <input type="hidden" name="lastname" value="${row1.lastname}">
                                <input type="hidden"name="firstname" value="${row1.firstname}">
                                <input type="hidden" name="pack_name" value="${row1.pack_name}">
                                <input type="hidden"name="compa_name" value="${row1.comp_name}">
                                <button type="submit" name="nrent_status" value="declined">Decline</button>
                                </form>
                        </td>
                    </tr>
                    </p:forEach>
                </tbody>
            </table>
        
        </div>
        </p:otherwise>
        </p:choose> 
                       
               
    <!-- ================================================== -->

                        
                        <div class="col-twelve">

                            <h3>ACCEPTED</h3>

                            <div class="table-responsive">

        <sql:query var="result2">
                SELECT lastname, firstname, location, rent_time, rent_startdate, rent_enddate, pack_name, comp_name, rent_status
                FROM rentals
                WHERE rent_status = 'accepted'
                AND comp_name = '<%=comp_name%>'

        </sql:query>

        <a:choose>
            <a:when test="${result2.rowCount == 0}">
                <h2>No Request Information Found.</h2>
            </a:when>
             <a:otherwise>
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

                    <tbody>
                    <a:forEach var="row2" items="${result2.rows}">   
                    <tr>
                        <td>${row2.lastname}</td>
                        <td>${row2.firstname}</td>
                        <td>${row2.location}</td>
                        <td>${row2.rent_time}</td>
                        <td>${row2.rent_startdate}</td>
                        <td>${row2.rent_enddate}</td>
                        <td>${row2.pack_name}</td>
                        <td>${row2.comp_name}</td>
                        <td><form action="ShowRequests.jsp?comp_username=<%= session.getAttribute("comp_username")%>" method="post">
                                <input type="hidden" name="location" value="${row2.location}">
                                <input type="hidden"name="rent_time" value="${row2.rent_time}">
                                <input type="hidden" name="lastname" value="${row2.lastname}">
                                <input type="hidden"name="firstname" value="${row2.firstname}">
                                <input type="hidden" name="pack_name" value="${row2.pack_name}">
                                <input type="hidden"name="compa_name" value="${row2.comp_name}">
                                <button type="submit" name="nrent_status" value="paid">Paid</button>
                            </form> 
                            <form action="ShowRequests.jsp?comp_username=<%= session.getAttribute("comp_username")%>" method="post">
                                <input type="hidden" name="location" value="${row2.location}">
                                <input type="hidden"name="rent_time" value="${row2.rent_time}">
                                <input type="hidden" name="lastname" value="${row2.lastname}">
                                <input type="hidden"name="firstname" value="${row2.firstname}">
                                <input type="hidden" name="pack_name" value="${row2.pack_name}">
                                <input type="hidden"name="compa_name" value="${row2.comp_name}">
                                <button type="submit" name="nrent_status" value="canceled">Cancel</button>
                            </form>
                        </td>
                            
                        
                    </tr>
                    </a:forEach>
                </tbody>
            </table>
        </div>
        </div>                    
        </a:otherwise>
        </a:choose> 
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
