<%-- 
    Document   : login
    Created on : May 12, 2026, 2:07:13?PM
    Author     : user
--%>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
    <h2>User Login</h2>
    <%-- Display error message if redirected back from doLogin.jsp --%>
    <p style="color:red;"><%= (request.getParameter("msg") != null) ? request.getParameter("msg") : "" %></p>
    
    <form action="doLogin.jsp" method="POST">
        <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" required>
            </div>
        
        <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>
        <input type="submit" value="Login">
    </form>
    </div>
</body>
</html>
