<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>मिशन कंट्रोल रूम</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .header { background-color: #800000; color: white; padding: 15px; text-align: center; font-size: 20px; font-weight: bold; position: relative; }
        .logout { position: absolute; right: 15px; top: 12px; background: white; color: #800000; border: none; padding: 5px 15px; border-radius: 20px; font-weight: bold; cursor: pointer; }
        .container { padding: 15px; }
        .team-box { background: white; border: 2px solid #800000; border-radius: 15px; padding: 15px; margin-bottom: 20px; }
        .team-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; }
        .member-card { background: #fff; border: 1px solid #ddd; padding: 10px; text-align: center; border-radius: 8px; box-shadow: 2px 2px 5px rgba(0,0,0,0.05); }
        .member-name { color: #800000; font-weight: bold; text-transform: uppercase; }
        .member-phone { font-size: 12px; color: #666; }
        
        /* एडमिन बटन */
        .admin-btn { background: #28a745; color: white; border: none; padding: 10px; border-radius: 5px; width: 100%; margin-top: 10px; cursor: pointer; }
    </style>
</head>
<body>

<div class="header">
    मिशन कंट्रोल रूम
    <button class="logout">LOGOUT</button>
</div>

<div class="container">
    <div class="team-box">
        <h3 style="color:#800000; margin-top:0;">टीम (सदस्य)</h3>
        <div class="team-grid" id="teamGrid">
            <div class="member-card">
                <div class="member-name">GURU JI</div>
                <div class="member-phone">9568111616</div>
            </div>
        </div>
        <button class="admin-btn" onclick="openAdmin()">+ एडमिन पैनल (सदस्य जोड़ें)</button>
    </div>
</div>

<script>
    function openAdmin() {
        let pin = prompt("एडमिन पिन डालें:");
        if(pin === "1234") { // अपना गुप्त पिन यहाँ रखें
            let name = prompt("सदस्य का नाम:");
            let mobile = prompt("मोबाइल नंबर:");
            let pass = prompt("लॉगिन पासवर्ड बनाएं:");
            
            if(name && mobile) {
                let grid = document.getElementById('teamGrid');
                grid.innerHTML += `
                    <div class="member-card">
                        <div class="member-name">${name}</div>
                        <div class="member-phone">${mobile}</div>
                    </div>`;
                alert("सदस्य " + name + " सफलतापूर्वक जोड़ा गया!");
            }
        } else {
            alert("गलत पिन!");
        }
    }
</script>

</body>
</html>
