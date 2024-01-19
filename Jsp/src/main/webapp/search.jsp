<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <h1>All Records</h1>
    <style>
    h1{
    }
    
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        table {
            width: 900px;
            height: 300px;
            background-color: lightgray;
            border-collapse: collapse;
            margin: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 3px;
            text-align: center;
        }

        th {
            background-color: darkgray;
            color: white;
        }
    </style>
</head>
<body>

<%
    String url = "jdbc:mysql://localhost:3306/company";
    String user = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            String selectQuery = "SELECT * FROM emp";

            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                out.println("<table>");
                out.println("<tr><th>ID</th><th>Name</th><th>Salary</th><th>City</th><th>Country</th></tr>");

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String salary = resultSet.getString("salary");
                    String city = resultSet.getString("city");
                    String country = resultSet.getString("country");

                    out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + salary + "</td><td>" + city + "</td><td>" + country + "</td></tr>");
                }

                out.println("</table>");
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>
