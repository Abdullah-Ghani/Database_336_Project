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
        <div class="login-page">
            <div class="form">
                <div id="loginText">Register</div>
                <%
                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String address = request.getParameter("address");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    if (email != null && password != null) {
                        if (fname.length() == 0 || lname.length() == 0 || address.length() == 0 || email.length() == 0 || password.length() == 0) {
                            out.println("Error, missing information below");
                        } else {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cunxqv1yfwcg.us-east-2.rds.amazonaws.com:3306/cs336","admin", "password123");
                            Statement st = con.createStatement();
                            ResultSet rs;
                            String query = String.format("SELECT * FROM account WHERE email = \"%s\"", email);
                            rs = st.executeQuery(query);
                            if (rs.next()) {
                                out.println("There is already an account registered with that email, please try logging in");
                            } else {
                                query = String.format("INSERT INTO account (fname, lname, address, email, password) VALUES (\"%s\", \"%s\", \"%s\", \"%s\", \"%s\")", fname, lname, address, email, password);
                                st.executeUpdate(query);
                                session.setAttribute("email", email); // the username will be stored in the session
                                session.setAttribute("fname", fname); // the username will be stored in the session
                                session.setAttribute("lname", lname); // the username will be stored in the session
                                response.sendRedirect("success.jsp");
                            }
                        }
                    }
                %>
                <form method="POST">
                    <input name="fname" type="text" placeholder="first name" />
                    <input name="lname" type="text" placeholder="last name" />
                    <input name="address" type="text" placeholder="address" />
                    <input name="email" type="text" placeholder="email" />
                    <input name="password" type="password" placeholder="password" />
                    <button>Register</button>
                    <p class="message">Already have an account? <a href="index.jsp">Login</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
