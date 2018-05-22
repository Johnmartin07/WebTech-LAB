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
<html lang="en">
<head>
	<title>Service Provider Application Form</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/oie_transparent.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/noui/nouislider.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util-register.css">
	<link rel="stylesheet" type="text/css" href="css/main-register.css">
<!--===============================================================================================-->
</head>
<body>
        
            <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection conStr = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/musify", "root", "");           
            Statement statement = conStr.createStatement();
	                                       
            String query = "SELECT comp_name, comp_username, comp_pass, comp_cn, comp_ea, comp_addr, comp_status FROM provider";
            ResultSet resultset = 
                statement.executeQuery(query);
            String comp_name = request.getParameter("comp_name");
            String comp_username = request.getParameter("comp_username");
            String comp_pass = request.getParameter("comp_pass");
            String comp_cn = request.getParameter("comp_cn");
            String comp_ea = request.getParameter("comp_ea");
            String comp_addr = request.getParameter("comp_addr");
            String comp_status = "pending";
            PreparedStatement psi;
                String stIns = "INSERT into provider(comp_name, comp_username, comp_pass, comp_cn, comp_ea, comp_addr, comp_status) VALUES(?,?,?,?,?,?,?)";
                psi = conStr.prepareStatement(stIns);
                
                psi.setString(1, comp_name);
                psi.setString(2, comp_username);
                psi.setString(3, comp_pass);
                psi.setString(4, comp_cn);
                psi.setString(5, comp_ea);
                psi.setString(6, comp_addr);
                psi.setString(7, comp_status);
                
                psi.executeUpdate();
                resultset.beforeFirst();
                
            %>
            
        <div class="container-contact100-form-btn">
            <center>
            <h2>Your Request has been Sent</h2> 
            <h2>Wait for the Admin to Accept your Request in Order for You to Login</h2>
    <button class="contact100-form-btn" type="submit" onclick="location.href='index.jsp'">
                <span>
                        Go Back to Login/Sign-up Page
                        <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                </span>
        </button>
    </div>
    

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});


			$(".js-select2").each(function(){
				$(this).on('select2:close', function (e){
					if($(this).val() == "Please chooses") {
						$('.js-show-service').slideUp();
					}
					else {
						$('.js-show-service').slideUp();
						$('.js-show-service').slideDown();
					}
				});
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="vendor/noui/nouislider.min.js"></script>
	<script>
	    var filterBar = document.getElementById('filter-bar');

	    noUiSlider.create(filterBar, {
	        start: [ 1500, 3900 ],
	        connect: true,
	        range: {
	            'min': 1500,
	            'max': 7500
	        }
	    });

	    var skipValues = [
	    document.getElementById('value-lower'),
	    document.getElementById('value-upper')
	    ];

	    filterBar.noUiSlider.on('update', function( values, handle ) {
	        skipValues[handle].innerHTML = Math.round(values[handle]);
	        $('.contact100-form-range-value input[name="from-value"]').val($('#value-lower').html());
	        $('.contact100-form-range-value input[name="to-value"]').val($('#value-upper').html());
	    });
	</script>
<!--===============================================================================================-->
	<script src="js/main-register.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>