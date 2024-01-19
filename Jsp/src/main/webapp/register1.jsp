<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register Employee</title>
</head>
<body>
<% 

    String url,user,pass;
    url="jdbc:mysql://localhost:3306/company";
    user="root";
    pass="root";

    String username,password;
    username=request.getParameter("username");
    password=request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con=DriverManager.getConnection(url,user,pass);

        String query="insert into employee values(?,?)";
        PreparedStatement st=con.prepareStatement(query);
        st.setString(1,username);
        st.setString(2,password); 
        st.execute(); 

        
    %>
            <script>
                alert("Registered successfully.....");
            </script>
    <%
        }
   
    catch (Exception e) {
    %>
        <script>
            alert("Registration failed");
        </script>
    <%
    }
    %>
    </body>
</html>
