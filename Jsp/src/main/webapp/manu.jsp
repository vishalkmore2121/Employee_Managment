<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    
   <style>
    body {
        background-image: url('https://images.unsplash.com/photo-1517502884422-41eaead166d4?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); 
        background-size: 100%;
        font-family: 'Arial', sans-serif;
        text-align: center;
        margin: 0;
        padding: 0;
    }
h2{
 color: white;
 }

    button {
        background-color: orange;
        color: white;
        padding: 20px 80px; /* Increased padding for a larger button */
        font-size: 18px; /* Increased font size */
        margin-top: 50px;
        border: none;
        border-radius: 8px; /* Rounded corners */
        cursor: pointer;
        text-decoration: none;
        transition: background-color 0.3s; /* Smooth hover effect */
    }

    button:hover {
        background-color: #45a049; /* Darker color on hover */
    }

    button a {
        color: white;
        text-decoration: none;
    }
    h2{
    font-size: 48px;
    }
    
</style>

</head>
<body>
 <h2> Employee Data</h2>
    <div>
       
        <button><a href="insert.jsp">INSERT DATA</a></button><br><br>
        <button><a href="update.jsp">UPDATE DATA</a></button><br><br>
        <button><a href="delete.jsp">DELETE DATA</a></button><br><br>
        <button><a href="search.jsp">SEARCH DATA</a></button><br><br>
    </div>
</body>
</html>
