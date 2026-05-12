<%-- 
    Document   : doLogin
    Created on : May 12, 2026, 2:07:57?PM
    Author     : user
--%>

<%@ page import="java.sql.*" %>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSA3023", "root", "");
        
        String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, pass);
        
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            // Store details in session to pass to main.jsp
            session.setAttribute("user", rs.getString("username"));
            session.setAttribute("fname", rs.getString("firstname"));
            session.setAttribute("lname", rs.getString("lastname"));
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }
        con.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
