<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee Data</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       
        body {
            background-image: url('https://img.freepik.com/premium-photo/business-people-meeting_53876-21725.jpg');
            background-size: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
           
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 450px;
            margin-top: 20px;
            margin-left:110px;
           
        }

        .error-message, .success-message {
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        .error-message {
            color: red;
        }

        .success-message {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="#" method="post" class="form-container">
                    <h1 class="text-center">Add Employee Data</h1>

                    <div class="mb-3">
                        <label for="name" class="form-label">Name:</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="salary" class="form-label">Salary:</label>
                        <input type="text" id="salary" name="salary" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="city" class="form-label">City:</label>
                        <input type="text" id="city" name="city" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="country" class="form-label">Country:</label>
                        <input type="text" id="country" name="country" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </div>

                    <% 
                    String name = request.getParameter("name");
                    String salary = request.getParameter("salary");
                    String city = request.getParameter("city");
                    String country = request.getParameter("country");

                    try {
                        if (name != null && salary != null && city != null && country != null) {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3306/company";
                            String user = "root";
                            String pass = "root";
                            Connection con = DriverManager.getConnection(url, user, pass);
                            String query = "insert into emp (name, salary, city, country) values (?, ?, ?, ?)";
                            PreparedStatement st = con.prepareStatement(query);
                            st.setString(1, name);
                            st.setString(2, salary);
                            st.setString(3, city);
                            st.setString(4, country);
                            st.execute();
                    %>
                            <p class="success-message">
                                Data Add Successfully.....
                            </p>
                    <%
                        } else if (request.getMethod().equalsIgnoreCase("post")) {
                    %>
                            <p class="error-message">
                                Please fill in all fields.
                            </p>
                    <%
                        }
                    } catch (Exception e) {
                    %>
                        <p class="error-message">
                            Data Add failed
                        </p>
                    <%
                    }
                    %>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
