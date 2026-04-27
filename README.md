<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mission Control</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f4f7f6; margin: 0; padding: 0; }
        .header { background: #800000; color: white; padding: 15px; text-align: center; font-weight: bold; font-size: 1.2rem; }
        
        /* Dashboard Stats Grid */
        .stats-container { display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; padding: 15px; }
        .card { padding: 15px; border-radius: 5px; color: white; position: relative; text-align: right; }
        .blue { background: #2a5298; } .green { background: #2d935c; } .teal { background: #17a2b8; } .red { background: #c0392b; }
        .card .title { font-size: 0.8rem; display: block; text-align: left; opacity: 0.9; }
        .card .number { font-size: 1.8rem; font-weight: bold; }

        /* Admin Table Section */
        .admin-section { background: white; margin: 15px; border-radius: 8px; border-top: 4px solid #f39c12; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .section-title { padding: 10px; background: #f39c12; color: white; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; margin-top: 5px; }
        th, td { padding: 12px; border-bottom: 1px solid #eee; text-align: left; font-size: 0.9rem; }
        th { background: #f8f9fa; color: #333; }
        
        /* Action Buttons */
        .btn-edit { background: #2a5298; color: white; border: none; padding: 5px 10px; border-radius: 3px; cursor: pointer; }
        .save-panel { display: none; padding: 15px; background: #e8f4fd; border: 1px solid #b8daff; margin: 10px; border-radius: 5px; }
        input { padding: 8px; margin: 5px 0; width: 90%; border: 1px solid #ccc; border-radius: 4px; }
        .btn-save { background: #2d935c; color: white; border: none; padding: 10px; width: 100%; margin-top: 10px; font-weight: bold; }
    </style>
</head>
<body>

<div class="header">मिशन कंट्रोल रूम - एडमिन पैनल</div>

<div class="stats-container">
    <div class="card blue">
        <span class="title">कुल सदस्य</span>
        <div class="number">10</div>
    </div>
    <div class="card green">
        <span class="title">एक्टिव मेंबर्स</span>
        <div class="number">08</div>
    </div>
    <div class="card teal">
        <span class="title">पेंडिंग अपडेट</span>
        <div class="number">21</div>
    </div>
    <div class="card red">
        <span class="title">डिफाल्टर</span>
        <div class="number">0</div>
    </div>
</div>

<div class="admin-section">
    <div class="section-title">टीम प्रबंधन (Team Management)</div>
    <table>
        <thead>
            <tr>
                <th>नाम</th>
                <th>मोबाइल</th>
                <th>एक्शन</th>
            </tr>
        </thead>
        <tbody id="memberList">
            <tr>
                <td>GURU JI</td>
                <td>9568111616</td>
                <td><button class="btn-edit" onclick="showEdit('GURU JI', '9568111616')">Edit</button></td>
            </tr>
            <tr>
                <td>SUNIL JI</td>
                <td>9927963150</td>
                <td><button class="btn-edit" onclick="showEdit('SUNIL JI', '9927963150')">Edit</button></td>
            </tr>
        </tbody>
    </table>
</div>

<div id="editPanel" class="save-panel">
    <h3 id="editMemberName" style="margin-top:0;">Edit Member</h3>
    <label>नया मोबाइल नंबर:</label>
    <input type="text" id="newPhone" placeholder="Mobile Number">
    <label>नया पासवर्ड:</label>
    <input type="password" id="newPass" placeholder="New Password">
    <button class="btn-save" onclick="saveChanges()">डेटा अपडेट करें</button>
</div>

<script>
    function showEdit(name, phone) {
        document.getElementById('editPanel').style.display = 'block';
        document.getElementById('editMemberName').innerText = name + " की सेटिंग्स";
        document.getElementById('newPhone').value = phone;
        window.scrollTo(0, document.body.scrollHeight);
    }

    function saveChanges() {
        let phone = document.getElementById('newPhone').value;
        let pass = document.getElementById('newPass').value;
        
        if(phone == "" || pass == "") {
            alert("कृपया सभी जानकारी भरें");
            return;
        }

        // Yahan aap apna backend logic ya database update function dal sakte hain
        alert("सफलतापूर्वक अपडेट किया गया: \nMobile: " + phone + "\nPassword: " + pass);
        document.getElementById('editPanel').style.display = 'none';
    }
</script>

</body>
</html>
