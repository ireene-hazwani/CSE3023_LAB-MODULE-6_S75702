<%-- 
    Document   : main
    Created on : May 12, 2026, 2:08:23 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <div class="container profile-card">
        <h2>User Profile Dashboard</h2>
        
        <%
            // Retrieve session data as required by the Exercise 
            String username = (String) session.getAttribute("user");
            String firstname = (String) session.getAttribute("fname");
            String lastname = (String) session.getAttribute("lname");
            
            if(username != null) {
        %>
            <ul class="profile-details">
                <li><strong>Username:</strong> <%= username %></li>
                <li><strong>First Name:</strong> <%= firstname %></li>
                <li><strong>Last Name:</strong> <%= lastname %></li>
            </ul>
            
            <a href="login.jsp" class="logout-link">Logout</a>
        <%
            } else {
                // Security: Redirect if user tries to access dashboard without logging in
                response.sendRedirect("login.jsp");
            }
        %>
    </div>

</body>
</html>