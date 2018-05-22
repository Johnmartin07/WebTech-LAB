<%-- 
    Document   : ShowInformation
    Author     : Lenovo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
    <title>My Profile - Musify</title>
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
    <body id="top">
    
        <sql:setDataSource
            driver="com.mysql.jdbc.Driver"
            user="root"
            password=""
            url="jdbc:mysql://localhost:3306/musify"/>
        
        <sql:query var="result">
                SELECT comp_name, comp_username, comp_pass, comp_cn, comp_addr, comp_ea, comp_status
                FROM provider
                WHERE comp_username = ?
            
            <sql:param>
                <%= session.getAttribute("comp_username") %>
            </sql:param>
        </sql:query>

        <c:choose>
            <c:when test="${result.rowCount == 0}">
                <h2>No Information Found.</h2>
            </c:when>

            <c:otherwise>
                    <tbody>
                        <c:forEach var="row" items="${result.rows}">
    <!-- s-content
    ================================================== -->
    <section class="s-content" style="padding-top: 50px; padding-bottom: 50px">
                <div class="row">
                    
                    <div class="col-md-6">
                        <h1>Service Provider Information</h1><br>
                        <div class="table-responsive">
                        <table class="table table-condensed table-responsive table-user-information">
                            <tbody>
                                <tr>        
                                    <td>
                                        <strong>
                                            <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                           Company Name                                               
                                        </strong>
                                    </td>
                                    <td class="text-primary">
                                        ${row.comp_name} 
                                    </td>
                                </tr>
                                <tr>    
                                    <td>
                                        <strong>
                                            <span class="glyphicon glyphicon-user  text-primary"></span>    
                                           Company Contact Number                                                
                                        </strong>
                                    </td>
                                    <td class="text-primary">
                                        ${row.comp_cn}    
                                    </td>
                                </tr>
                                <tr>        
                                    <td>
                                        <strong>
                                            <span class="glyphicon glyphicon-cloud text-primary"></span>  
                                            Company Email Address                                               
                                        </strong>
                                    </td>

                                    <td class="text-primary">
                                       ${row.comp_ea}
                                    </td>
                                </tr>

                                <tr>        
                                    <td>
                                        <strong>
                                            <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                            Company Address/es                                                
                                        </strong>
                                    </td>
                                    <td class="text-primary">
                                        ${row.comp_addr}
                                    </td>
                                </tr>

                                <tr>        
                                    <td>
                                        <strong>
                                            <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                            Username                                               
                                        </strong>
                                    </td>
                                    <td class="text-primary">
                                       ${row.comp_username}
                                    </td>
                                </tr>
                    
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div> 
     

<style>
.container {
    position:absolute;
    width: 100%;
    max-width: 600px;
}


.container .btn {
    position: absolute;
    top: 100%;
    left: 120%;
    transform: translate(-0%, -50%);
    -ms-transform: translate(-50%, -50%);
    background-color: #555;
    color: green ;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: top;
}

.container .btn:hover {
    background-color: black;
}
</style>

<body>
    <center>
          <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">Edit Profile</button>
             <div id="id01" class="w3-modal">
            <div class="w3-modal-content">
              <div class="w3-container">
                <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                <h1>Edit profile</h1>
                  
                  
                <form name="cForm" id="cForm" method="post" action="UpdateInfo.jsp">
                    <fieldset>

                        <div class="form-field">
                            <input name="ncomp_name" type="text" id="comp_name" class="full-width" placeholder="Company Name" value="${row.comp_name}">
                        </div>
                        
                        <div class="form-field">
                            <input name="ncomp_addr" type="text" id="comp_address" class="full-width" placeholder="Company Address" value="${row.comp_addr}">
                        </div>
                        
                        <div class="form-field">
                            <input name="ncomp_ea" type="text" id="comp_ea" class="full-width" placeholder="Email Address" value="${row.comp_ea}">
                        </div>
                        
                        <div class="form-field">
                            <input name="ncomp_cn" type="text" id="comp_cn" class="full-width" placeholder="Contact Number" value="${row.comp_cn}">
                        </div>
                        
                        <div class="form-field">
                            <input name="ncomp_username" type="text" id="comp_username" class="full-width" placeholder="Username" value="${row.comp_username}">
                        </div>

                        <div class="form-field">
                            <input name="ncomp_pass" type="password" id="comp_pass" class="full-width" placeholder="New Password" value="${row.comp_pass}">
                        </div>
                        
                        <button type="submit" class="submit btn btn--primary full-width">Save</button>

                    </fieldset>
                </form> <!-- end form -->
                  
                  
              </div>
            </div>
          </div>
         </c:forEach>
    </c:otherwise>
</c:choose>                 


                              
        
        
 <!--        <div class="editProfile" >
            <button class="edit-form">
                <a href="popUpEdit.html">Edit Profile</a>
            </button>
        </div> -->

    </section> <!-- s-content -->      

    <!-- Footer -->
    <footer class="py-5 bg-black">
        <p class="m-0 text-center text-white small">Copyright &copy; Musify 2018</p>
      </div>
      <!-- /.container -->
    </footer>

</body>

</html>