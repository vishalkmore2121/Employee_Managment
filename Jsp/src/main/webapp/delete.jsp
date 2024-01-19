<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR2JRjRVsfmWS-hNSGLAt8xHOHiAtol3DQ_9oC8V0mx8ZhnEK4BxfNNUgPvtd2KbeUGYI&usqp=CAU'); /* Replace with your actual image path */
            background-size: 100%;
            color: white;
        }
        
        label {
            font-weight: bold;
        }
        
        input {
            margin: 5px;
            padding: 5px;
        }

        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 300px;
            margin: auto;
        }

        h2 {
            margin-bottom: 20px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h2>Delete Record</h2>

    <form action="#" method="post">
        <label for="id">Enter ID You Want To Delete:</label>
        <br>
        <input type="text" name="id" id="id" required>
        <br>
        <br>
        <input type="submit" value="Delete Record">
    </form>

    <button onclick="location.href='insert.jsp'">Insert Data</button>
    <button onclick="location.href='update.jsp'">Update Data</button>
    <button onclick="location.href='search.jsp'">Search Data</button>
    <button onclick="location.href='login.jsp'">Login</button>

    <%
    try {
        String url, user, pass;
        url = "jdbc:mysql://localhost:3306/company";
        user = "root";
        pass = "root";

        String id = request.getParameter("id");

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection con = DriverManager.getConnection(url, user, pass)) {
            String query = "DELETE FROM emp WHERE id=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, id);

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                %>
                <script>
                    alert("Delete Data Successfully.....");
                </script>
                <%
                } else {
                %>
                <script>
                    alert("No data deleted...");
                </script>
                <%
                }
            }
        }
    } catch (NumberFormatException e) {
        %>
        <script>
            alert("Please enter a valid ID.");
        </script>
        <%
    } catch (SQLException e) {
        %>
        <script>
            alert("Error occurred while deleting data. Please try again.");
        </script>
        <%
    }
    %>
</body>
</html>
