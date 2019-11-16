<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <title>Travel Agency User Portal</title>
        <link rel="stylesheet" type="text/css" href="style/index.css" />
    </head>
    <body>
        <%
            if (session.getAttribute("email") == null) {
                out.println("You are not currently logged in! ");
                out.println("<a href=\"index.jsp\">Login</a>");
                out.println("<a href=\"register.jsp\">Register</a>");
            }
            else {
                out.println("You are currently Logged in as:");
                out.println(String.format("%s %s", session.getAttribute("fname"), session.getAttribute("lname")));
                out.println(String.format("Email: %s", session.getAttribute("email")));
                out.println("<a href=\"logout.jsp\">Logout</a>");
            }
        %>
    </body>
</html>