<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url("https://img.freepik.com/free-photo/beautiful-view-greenery-bridge-forest-perfect-background_181624-17827.jpg?size=626&ext=jpg&ga=GA1.1.1957960630.1704724893&semt=ais");
            background-size: cover;
            height: 100vh;
        }

        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            font-family: 'Arial Black', sans-serif;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            color: #333;
            text-decoration: none;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>

    <form action="forget1.jsp" method="post" onsubmit="return validateForm()">
        <h2>Forgot Password</h2>

        <label>Enter Your Username:</label>
        <input type="text" id="username" name="username" required pattern="[a-zA-Z0-9_]{5,}" title="Username must be alphanumeric with minimum length 5">

        <label>Password:</label>
        <input type="password" id="password" name="password" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9!@#$%^&*]{8,}$" title="Password must be at least 8 characters, containing at least one digit, one lowercase letter, one uppercase letter, and allowed special characters">

        <button type="submit">Change Password</button>
    </form>

   <script>
        function validateForm() {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            // Regular expressions for validation
            const usernameRegex = /^[a-zA-Z0-9_]{5,}$/; // Alphanumeric and underscore, minimum length 5
            const passwordRegex = /^.{8,}$/; // Minimum 8 characters

            if (!usernameRegex.test(username)) {
                alert('Username must be alphanumeric with minimum length 5 characters.');
                return false;
            }

            if (!passwordRegex.test(password)) {
                alert('Password must be at least 8 characters.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
