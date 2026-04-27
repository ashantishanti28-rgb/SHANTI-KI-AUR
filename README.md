<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamara Uddeshya - Secure Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-admin { background: linear-gradient(135deg, #800000 0%, #a52a2a 100%); }
        .hidden { display: none; }
        .logo-ring { border: 2px double #800000; padding: 5px; border-radius: 50%; }
    </style>
</head>
<body class="bg-orange-50 font-sans min-h-screen">

    <div id="loginSection" class="flex items-center justify-center min-h-screen p-4">
        <div class="bg-white p-8 rounded-2xl shadow-2xl w-full max-w-sm border-2 border-red-800 text-center">
            <img src="https://ashantishanti28-rgb.github.io/SHANTI-KI-AUR/1777210190036.png" alt="Logo" class="w-32 h-32 mx-auto mb-4 logo-ring">
            <h1 class="text-xl font-bold text-red-900 uppercase tracking-tighter">Hamara Uddeshya</h1>
            <p class="text-[10px] text-gray-500 mb-6 font-bold italic border-b pb-2">ASHANTI SE SHANTI KI AUR</p>
            
            <div class="space-y-4">
                <input type="tel" id="userMobile" placeholder="Mobile Number" class="w-full p-3 border-2 border-gray-100 rounded-lg outline-none focus:border-red-800 font-bold text-center">
                <input type="password" id="userPass" placeholder="Password" class="w-full p-3 border-2 border-gray-100 rounded-lg outline-none focus:border-red-800 text-center">
                <button onclick="checkLogin()" class="w-full gradient-admin text-white font-bold py-3 rounded-lg shadow-lg active:scale-95 transition-all">LOGIN</button>
                <p id="loginError" class="text-red-600 text-[10px] hidden font-bold mt-2 uppercase">Kshama karein! Number ya Password galat hai.</p>
            </div>
        </div>
    </div>

    <div id="portalSection" class="hidden">
        <header class="gradient-admin text-white p-4 shadow-xl text-center border-b-4 border-yellow-500">
            <h1 class="text-lg font-bold uppercase">Hamara Uddeshya Portal</h1>
            <p id="activeUser" class="text-[10px] italic"></p>
        </header>

        <main class="max-w-md mx-auto p-4 mt-4">
            <div class="bg-white rounded-xl shadow-lg p-6 border-t-4 border-red-800">
                <form id="entryForm" class="space-y-4">
                    <input type="tel" id="mobile" placeholder="Pariwadi ka Mobile" class="w-full p-3 border rounded shadow-inner outline-none" required>
                    <label class="block text-[10px] font-bold text-red-800 uppercase">Tension Level</label>
                    <input type="range" id="tension" min="0" max="100" value="50" class="w-full accent-red-800">
                    <textarea id="message" rows="3" class="w-full p-3 border rounded shadow-inner outline-none" placeholder="Vivad ki detail..." required></textarea>
                    <button type="submit" id="submitBtn" class="w-full gradient-admin text-white font-bold py-4 rounded shadow-lg uppercase">Data Surakshit Karein</button>
                </form>
                <div id="status" class="hidden mt-4 p-3 rounded text-center font-bold text-xs"></div>
            </div>
            <button onclick="location.reload()" class="w-full mt-6 text-gray-500 text-xs font-bold underline uppercase tracking-widest">Logout</button>
        </main>
    </div>

    <script>
        const ALLOWED_USERS = { 
            "9568111616": "admin786", 
            "9927963150": "sunil786" 
        };

        function checkLogin() {
            const m = document.getElementById('userMobile').value;
            const p = document.getElementById('userPass').value;
            if (ALLOWED_USERS[m] && ALLOWED_USERS[m] === p) {
                document.getElementById('loginSection').classList.add('hidden');
                document.getElementById('portalSection').classList.remove('hidden');
                document.getElementById('activeUser').innerText = "Namaste: " + m;
            } else {
                document.getElementById('loginError').classList.remove('hidden');
            }
        }

        const scriptUrl = 'https://script.google.com/macros/s/AKfycbwK_RCqXqXDUFTJcRCbBuMj3UaduwUjVfNfOCk9sL8jtQD98gn6mn_PSqA7S3EaYNaH/exec';

        document.getElementById('entryForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const btn = document.getElementById('submitBtn');
            const status = document.getElementById('status');
            btn.disabled = true; btn.innerHTML = 'SAVING...';
            status.classList.remove('hidden');
            status.className = 'mt-4 p-3 rounded bg-blue-50 text-blue-800 animate-pulse';
            status.innerText = 'Google Sheet mein bhej rahe hain...';

            fetch(scriptUrl, {
                method: 'POST',
                mode: 'no-cors',
                body: JSON.stringify({
                    team: document.getElementById('userMobile').value,
                    mobile: document.getElementById('mobile').value,
                    message: document.getElementById('message').value,
                    tension: document.getElementById('tension').value
                })
            }).then(() => {
                status.className = 'mt-4 p-3 rounded bg-green-600 text-white shadow-md font-bold';
                status.innerText = '✅ DATA SUCCESSFULLY SAVED';
                document.getElementById('entryForm').reset();
                btn.disabled = false; btn.innerHTML = 'AGLI ENTRY KAREIN';
            });
        });
    </script>
</body>
</html>
