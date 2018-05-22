<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conStr = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/musify", "root", "");   
            PreparedStatement ps = conStr.prepareStatement("SELECT * FROM provider WHERE comp_name = ?");
            ps.setString(1,request.getParameter("comp_name"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
                out.print("User already exists");
            }else{
                out.print("Valid");
            }
        }catch (Exception e){
            System.out.println(e);  
        }
%>