<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Employee Password</title>
</head>
<body>
<%
try {
    String url, user, pass;
    url = "jdbc:mysql://localhost:3306/company";
    user = "root";
    pass = "root";

    String username, password;

    username = request.getParameter("username");
    password = request.getParameter("password");

    Class.forName("com.mysql.cj.jdbc.Driver");

    try (Connection con = DriverManager.getConnection(url, user, pass)) {
        String query = "update employee set pass=? where user=?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, password);
            pst.setString(2, username);

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                %>
                <script>
                    alert("Data Updated successfully.....");
                </script>
                <%
            } else {
                %>
                <script>
                    alert("No data updated. User not found or incorrect data.");
                </script>
                <%
            }
        }
    }
} catch (Exception e) {
    %>
    <script>
        alert("Error occurred while updating data. Please try again.");
    </script>
    <%
}
%>
</body>
</html>
