<%-- 
    Document   : processUser
    Created on : May 12, 2026, 2:06:47 PM
    Author     : user
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
<body>
    <%
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSA3023", "root", "");
            
            String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, fname);
            ps.setString(4, lname);
            
            int i = ps.executeUpdate();
            if(i > 0) {
                out.print("<h3>Registration Successful!</h3>");
                out.print("<a href='login.jsp'>Go to Login</a>");
            }
            con.close();
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    %>
</body>
</html>
