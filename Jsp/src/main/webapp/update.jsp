<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Update Employee Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://i.pinimg.com/600x315/44/15/97/441597fc03c1baae69adaa179be12e08.jpg'); /* Replace with your actual image path */
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            color: white;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.5); /* Adjust the opacity as needed */
            padding: 10px;
            border-radius: 8px;
            font-weight: bold;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    

    <form action="#" method="post">
    <h1>Add/Update Employee Data</h1><br>
        <label for="id">Employee ID:</label>
        <input type="text" id="id" name="id" required>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="salary" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" required>

        <button type="submit">Submit/Update</button>
    </form>

<%
String url,user,pass;
url="jdbc:mysql://localhost:3306/company";
user="root";
pass="root";

String id, name, salary, city, country;
id = request.getParameter("id");
name = request.getParameter("name");
salary = request.getParameter("salary");
city = request.getParameter("city");
country = request.getParameter("country");

try {
    if (id != null && name != null && salary != null && city != null && country != null) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection(url,user,pass);
        String query = "update emp set name=?, salary=?, city=?, country=? where id=?";
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, name);
        st.setString(2, salary);
        st.setString(3, city);
        st.setString(4, country);
        st.setString(5, id);
        st.executeUpdate();
%>
        <script>
            alert("Data Updated Successfully.....");
        </script>
<%
    } else {
%>
        <script>
            alert("Please fill in all fields.");
        </script>
<%
    }
} catch (Exception e) {
%>
    <script>
        alert("Data Update failed");
    </script>
<%
}
%>
</body>
</html>
