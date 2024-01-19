<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<% 
    String url = "jdbc:mysql://localhost:3306/company";
    String user = "root";
    String password = "root";

 
    String username = request.getParameter("username");
    String Password = request.getParameter("password");
      Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();

        
        String query = "SELECT * FROM employee WHERE user='" + username + "' AND pass='" + Password + "'";
        resultSet = statement.executeQuery(query);
        if(resultSet.next()){
        	%>
        	<script>
        	alert("Login succesfully");
        	 window.location.href = "manu.jsp";
        	</script>
        
        	<%
        	
        }
        
        else
        {
        	%>
        	<script>alert("Login fail");
        	</script>
        	<%
        }
        
       
        %>

</body>
</html>