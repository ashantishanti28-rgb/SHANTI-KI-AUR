<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHANTI-KI-AUR | Admin Dashboard</title>
    <style>
        :root {
            --maroon: #800000;
            --skyblue: #87CEEB;
            --silver: #C0C0C0;
            --white: #ffffff;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            display: flex;
            background-color: #f0f2f5;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: var(--maroon);
            color: var(--white);
            position: fixed;
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            font-size: 1.2rem;
            border-bottom: 1px solid var(--silver);
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .sidebar-link {
            padding: 15px 25px;
            display: block;
            color: var(--white);
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar-link:hover {
            background-color: var(--skyblue);
            color: var(--maroon);
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 20px;
        }

        .header {
            background-color: var(--white);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-bottom: 3px solid var(--skyblue);
        }

        /* Admin Table Styling */
        .admin-section {
            background-color: var(--white);
            margin-top: 30px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .admin-section h3 {
            color: var(--maroon);
            margin-bottom: 20px;
            border-left: 5px solid var(--skyblue);
            padding-left: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background-color: var(--skyblue);
            color: var(--maroon);
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid var(--silver);
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            color: #333;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .badge {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.85rem;
            background-color: #e8f4fd;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>SHANTI-KI-AUR</h2>
        <a href="#" class="sidebar-link">Dashboard</a>
        <a href="#" class="sidebar-link">Mission Reports</a>
        <a href="#" class="sidebar-link" style="background-color: var(--skyblue); color: var(--maroon);">Admin Panel</a>
        <a href="#" class="sidebar-link">Settings</a>
        <a href="#" class="sidebar-link">Logout</a>
    </div>

    <div class="main-content">
        <div class="header">
            <h1 style="color: var(--maroon); margin: 0;">Admin Control Panel</h1>
            <div style="text-align: right;">
                <strong>Date:</strong> 27 April 2026<br>
                <span style="color: var(--skyblue);">Admin Logged In</span>
            </div>
        </div>

        <div class="admin-section">
            <h3>Member Credentials & Directory</h3>
            <table>
                <thead>
                    <tr>
                        <th>S.No.</th>
                        <th>Member Name</th>
                        <th>Mobile Number</th>
                        <th>Login Password</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody id="memberTable">
                    <tr><td>1</td><td>Member One</td><td>+91 XXXXXXXX01</td><td>Pass@123</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>2</td><td>Member Two</td><td>+91 XXXXXXXX02</td><td>Pass@456</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>3</td><td>Member Three</td><td>+91 XXXXXXXX03</td><td>Pass@789</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>4</td><td>Member Four</td><td>+91 XXXXXXXX04</td><td>Pass@101</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>5</td><td>Member Five</td><td>+91 XXXXXXXX05</td><td>Pass@102</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>6</td><td>Member Six</td><td>+91 XXXXXXXX06</td><td>Pass@103</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>7</td><td>Member Seven</td><td>+91 XXXXXXXX07</td><td>Pass@104</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>8</td><td>Member Eight</td><td>+91 XXXXXXXX08</td><td>Pass@105</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>9</td><td>Member Nine</td><td>+91 XXXXXXXX09</td><td>Pass@106</td><td><span class="badge">Active</span></td></tr>
                    <tr><td>10</td><td>Member Ten</td><td>+91 XXXXXXXX10</td><td>Pass@107</td><td><span class="badge">Active</span></td></tr>
                </tbody>
            </table>
        </div>
        
        <p style="margin-top: 20px; font-size: 0.9rem; color: #666; text-align: center;">
            &copy; 2026 Mission SHANTI-KI-AUR - Service to Humanity
        </p>
    </div>

</body>
</html>
