<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHANTI-KI-AUR | Mission Control Room</title>
    <style>
        :root { --maroon: #800000; --skyblue: #87CEEB; --silver: #c0c0c0; }
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f6; margin: 0; }
        
        /* Login Style */
        .login-overlay { position: fixed; top:0; left:0; width:100%; height:100%; background: var(--maroon); display: flex; justify-content: center; align-items: center; z-index: 1000; }
        .login-box { background: white; padding: 30px; border-radius: 15px; width: 320px; text-align: center; box-shadow: 0 10px 25px rgba(0,0,0,0.3); }
        input { width: 90%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 5px; }
        button { background: var(--maroon); color: white; border: none; padding: 12px 25px; border-radius: 5px; cursor: pointer; width: 100%; font-weight: bold; }
        
        /* Main Dashboard Style */
        .header { background: var(--maroon); color: white; padding: 15px; text-align: center; border-bottom: 5px solid var(--silver); }
        .container { padding: 20px; max-width: 1200px; margin: auto; display: none; }
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-bottom: 20px; }
        .stat-card { background: white; padding: 20px; border-radius: 10px; text-align: center; border-top: 5px solid var(--skyblue); box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        
        /* Team Grid */
        .section-title { background: var(--skyblue); color: white; padding: 10px; border-radius: 5px; margin: 20px 0 10px; font-weight: bold; }
        .team-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 10px; }
        .member-card { background: white; padding: 15px; border-radius: 8px; border: 1px solid #ddd; text-align: center; }
        
        /* Admin Only Section */
        #admin-panel { display: none; background: #fff; padding: 15px; border-radius: 10px; margin-top: 20px; border: 2px solid var(--maroon); }
        iframe { width: 100%; height: 500px; border: none; margin-top: 10px; }
    </style>
</head>
<body>

<div class="login-overlay" id="login-section">
    <div class="login-box">
        <h2 style="color: var(--maroon);">मिशन लॉगिन</h2>
        <input type="text" id="username" placeholder="यूजरनेम (e.g. admin, member1)">
        <input type="password" id="password" placeholder="पासवर्ड">
        <button onclick="handleLogin()">प्रवेश करें</button>
        <p id="error" style="color: red; font-size: 12px; margin-top: 10px; display: none;">गलत यूजरनेम या पासवर्ड!</p>
    </div>
</div>

<div id="main-content" class="container">
    <div class="header">
        <h1 style="margin:0;">SHANTI-KI-AUR</h1>
        <p style="margin:5px 0 0;">मिशन कंट्रोल रूम - डैशबोर्ड</p>
    </div>

    <div class="stats-grid">
        <div class="stat-card"><h3>कुल सन्दर्भ</h3><div style="font-size: 24px; color: var(--maroon);">124</div></div>
        <div class="stat-card"><h3>निस्तारित</h3><div style="font-size: 24px; color: green;">98</div></div>
        <div class="stat-card"><h3>लम्बित</h3><div style="font-size: 24px; color: orange;">26</div></div>
        <div class="stat-card"><h3>SOS अलर्ट</h3><div style="font-size: 24px; color: red;">02</div></div>
    </div>

    <div class="section-title">टीम के सदस्य (10 Active)</div>
    <div class="team-grid" id="team-list">
        </div>

    <div id="admin-panel">
        <div class="section-title" style="background: var(--maroon);">एडमिन मास्टर कंट्रोल (Google Sheet View)</div>
        <p>यहाँ से आप पूरा डेटा मैनेज कर सकते हैं:</p>
        <iframe src="https://docs.google.com/spreadsheets/d/e/YOUR_SHEET_ID/pubhtml"></iframe>
    </div>

    <button onclick="location.reload()" style="margin-top: 20px; background: #555;">लॉगआउट</button>
</div>

<script>
    // --- ADMIN: YAHAN APNE PASSWORDS SET KAREIN ---
    const userDB = {
        "admin": "MASTER@123",    // Aapka Master Password
        "member1": "MEM123",      // Member 1 ka password
        "member2": "MEM456",      // Member 2 ka password
        "member3": "PASS789",
        "member4": "PASS000",
        // Isi tarah baki 10 tak list bana lein
    };

    function handleLogin() {
        const u = document.getElementById('username').value;
        const p = document.getElementById('password').value;

        if (userDB[u] && userDB[u] === p) {
            document.getElementById('login-section').style.display = 'none';
            document.getElementById('main-content').style.display = 'block';
            
            // Agar Admin login karega toh Sheet dikhegi
            if (u === "admin") {
                document.getElementById('admin-panel').style.display = 'block';
            }
            loadTeam();
        } else {
            document.getElementById('error').style.display = 'block';
        }
    }

    function loadTeam() {
        const team = ["GURU JI", "SUNIL JI", "VIKAS JI", "MEMBER 4", "MEMBER 5", "MEMBER 6", "MEMBER 7", "MEMBER 8", "MEMBER 9", "MEMBER 10"];
        let html = "";
        team.forEach(m => {
            html += `<div class="member-card"><strong>${m}</strong><br><span style="font-size:10px; color:#666;">Active</span></div>`;
        });
        document.getElementById('team-list').innerHTML = html;
    }
</script>

</body>
</html>
