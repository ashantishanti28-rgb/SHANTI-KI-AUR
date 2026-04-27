<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHANTI-KI-AUR | Admin Master</title>
    <style>
        :root { --maroon: #800000; --skyblue: #87CEEB; }
        body { font-family: 'Segoe UI', sans-serif; background: #f0f2f5; margin: 0; }
        
        /* Login Overlay */
        #login-screen { position: fixed; inset: 0; background: var(--maroon); display: flex; justify-content: center; align-items: center; z-index: 9999; }
        .login-box { background: white; padding: 30px; border-radius: 12px; width: 300px; text-align: center; }
        input { width: 90%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; }
        .btn-login { background: var(--maroon); color: white; border: none; padding: 10px; width: 100%; cursor: pointer; border-radius: 5px; font-weight: bold; }

        /* Main Content - Initially Hidden */
        #main-wrapper { display: none; }
        
        .header { background: var(--maroon); color: white; padding: 15px; text-align: center; border-bottom: 4px solid #c0c0c0; }
        .admin-controls { padding: 20px; text-align: center; background: #fff; border-bottom: 1px solid #ddd; }
        .btn-toggle { background: #28a745; color: white; border: none; padding: 12px 25px; cursor: pointer; border-radius: 5px; font-size: 16px; font-weight: bold; }

        /* Dashboard Area - Hidden until button click */
        #dashboard-area { display: none; padding: 20px; }
        
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; }
        .stat-card { background: white; padding: 20px; border-radius: 10px; text-align: center; border-top: 5px solid var(--skyblue); box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        iframe { width: 100%; height: 600px; border: none; margin-top: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
    </style>
</head>
<body>

<div id="login-screen">
    <div class="login-box">
        <h2 style="color:var(--maroon)">मिशन एक्सेस</h2>
        <input type="text" id="user" placeholder="यूजरनेम">
        <input type="password" id="pass" placeholder="पासवर्ड">
        <button class="btn-login" onclick="validateLogin()">प्रवेश करें</button>
    </div>
</div>

<div id="main-wrapper">
    <div class="header">
        <h1>SHANTI-KI-AUR MISSION</h1>
        <p>प्रशासक पैनल (Admin Panel)</p>
    </div>

    <div class="admin-controls">
        <h3 id="welcome-msg">स्वागत है, एडमिन</h3>
        <p>डैशबोर्ड और डेटा देखने के लिए नीचे दिए गए बटन पर क्लिक करें।</p>
        <button class="btn-toggle" id="toggleBtn" onclick="toggleDashboard()">डैशबोर्ड खोलें (Open Dashboard)</button>
        <button onclick="location.reload()" style="background:#555; color:white; border:none; padding:12px; border-radius:5px; cursor:pointer; margin-left:10px;">लॉगआउट</button>
    </div>

    <div id="dashboard-area">
        <div class="stats-grid">
            <div class="stat-card"><h3>कुल सन्दर्भ</h3><div style="font-size:24px; color:var(--maroon);">124</div></div>
            <div class="stat-card"><h3>निस्तारित</h3><div style="font-size:24px; color:green;">98</div></div>
            <div class="stat-card"><h3>लम्बित</h3><div style="font-size:24px; color:orange;">26</div></div>
        </div>

        <div style="margin-top:20px;">
            <h3 style="background:var(--maroon); color:white; padding:10px; border-radius:5px;">लाइव डेटा रिपोर्ट (Google Sheets)</h3>
            <iframe src="https://docs.google.com/spreadsheets/d/e/YOUR_SHEET_ID/pubhtml?widget=true&headers=false"></iframe>
        </div>
    </div>
</div>

<script>
    // --- यहाँ अपने पासवर्ड सेट करें ---
    const users = {
        "admin": "ADMIN123",
        "member1": "PASS1"
    };

    function validateLogin() {
        const u = document.getElementById('user').value;
        const p = document.getElementById('pass').value;
        if(users[u] && users[u] === p) {
            document.getElementById('login-screen').style.display = 'none';
            document.getElementById('main-wrapper').style.display = 'block';
            document.getElementById('welcome-msg').innerText = "स्वागत है, " + u;
        } else {
            alert("गलत जानकारी!");
        }
    }

    function toggleDashboard() {
        const dash = document.getElementById('dashboard-area');
        const btn = document.getElementById('toggleBtn');
        
        if (dash.style.display === "none" || dash.style.display === "") {
            dash.style.display = "block";
            btn.innerText = "डैशबोर्ड छिपाएं (Hide Dashboard)";
            btn.style.background = "#dc3545"; // Red color when open
        } else {
            dash.style.display = "none";
            btn.innerText = "डैशबोर्ड खोलें (Open Dashboard)";
            btn.style.background = "#28a745"; // Green color when closed
        }
    }
</script>

</body>
</html>
