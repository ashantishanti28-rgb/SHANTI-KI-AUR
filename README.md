<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamara Uddeshya - Secure Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-admin { background: linear-gradient(135deg, #1e3a8a 0%, #1e40af 100%); }
        .hidden { display: none; }
    </style>
</head>
<body class="bg-gray-100 font-sans min-h-screen">

    <div id="loginSection" class="flex items-center justify-center min-h-screen p-4">
        <div class="bg-white p-8 rounded-2xl shadow-2xl w-full max-w-sm border-t-4 border-blue-800 text-center">
            <h1 class="text-2xl font-bold text-blue-900 mb-2 uppercase tracking-tighter">Hamara Uddeshya</h1>
            <p class="text-xs text-gray-500 mb-6 font-bold italic border-b pb-2 text-sky-800">SECURE LOGIN SYSTEM</p>
            
            <div class="space-y-4">
                <input type="tel" id="userMobile" placeholder="Mobile Number Daalein" class="w-full p-4 border-2 border-gray-100 rounded-xl outline-none focus:border-blue-500 font-bold text-gray-700 bg-gray-50 shadow-inner">
                <input type="password" id="userPass" placeholder="Password Daalein" class="w-full p-4 border-2 border-gray-100 rounded-xl outline-none focus:border-blue-500 text-center shadow-inner">
                
                <button onclick="checkLogin()" class="w-full gradient-admin text-white font-black py-4 rounded-xl shadow-lg active:scale-95 transition-all">LOG IN</button>
                
                <p id="loginError" class="text-red-600 text-[10px] hidden font-bold animate-pulse uppercase mt-2">Galat Number ya Password!</p>
            </div>
        </div>
    </div>

    <div id="portalSection" class="hidden">
        <header class="gradient-admin text-white p-6 shadow-xl flex justify-between items-center border-b-4 border-sky-400">
            <div>
                <h1 class="text-xl font-bold tracking-tighter">HAMARA UDDESHYA</h1>
                <p id="activeUser" class="text-[10px] bg-white text-blue-900 px-2 py-0.5 rounded-full font-bold mt-1 inline-block"></p>
            </div>
            <button onclick="location.reload()" class="bg-red-500 px-3 py-1 rounded text-[10px] font-bold uppercase shadow">Logout</button>
        </header>

        <main class="max-w-md mx-auto p-4 mt-6">
            <div class="bg-white rounded-3xl shadow-2xl p-6 border-t-8 border-blue-900">
                <form id="entryForm" class="space-y-5">
                    <div>
                        <label class="block text-xs font-black text-gray-500 mb-1 uppercase tracking-tight">Pariwadi Mobile Number</label>
                        <input type="tel" id="mobile" placeholder="Shikayatkarta ka number" pattern="[0-9]{10}" class="w-full p-4 border-2 border-gray-100 rounded-xl outline-none font-bold" required>
                    </div>

                    <div>
                        <label class="block text-xs font-black text-red-600 mb-1 text-center uppercase tracking-tight">Vivad Star (Tension)</label>
                        <input type="range" id="tension" min="0" max="100" value="50" class="w-full h-3 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-red-600">
                    </div>

                    <div>
                        <label class="block text-xs font-black text-gray-500 mb-1 uppercase tracking-tight">Vivad ka Vivaran</label>
                        <textarea id="message" rows="3" class="w-full p-4 border-2 border-gray-100 rounded-xl outline-none" placeholder="Details likhein..." required></textarea>
                    </div>

                    <button type="submit" id="submitBtn" class="w-full gradient-admin text-white font-black py-5 rounded-2xl shadow-xl active:scale-95 transition-all uppercase tracking-widest">Sheet Mein Bhejein</button>
                </form>
                <div id="status" class="hidden mt-6 p-4 rounded-xl text-center font-black text-xs uppercase border-2"></div>
            </div>
        </main>
    </div>

    <script>
        // --- 10 LOGON KE MOBILE AUR PASSWORD ---
        const ALLOWED_USERS = {
            "9568111616": "admin786", // Aapka Number aur Admin Password
            "9000000001": "pass01",   // Member 01
            "9000000002": "pass02",   // Member 02
            "9000000003": "pass03",
            "9000000004": "pass04",
            "9000000005": "pass05",
            "9000000006": "pass06",
            "9000000007": "pass07",
            "9000000008": "pass08",
            "9000000009": "pass09",
            "9000000010": "pass10"
        };

        let loggedInMobile = "";

        function checkLogin() {
            const m = document.getElementById('userMobile').value;
            const p = document.getElementById('userPass').value;
            const err = document.getElementById('loginError');

            if (ALLOWED_USERS[m] && ALLOWED_USERS[m] === p) {
                loggedInMobile = m;
                document.getElementById('loginSection').classList.add('hidden');
                document.getElementById('portalSection').classList.remove('hidden');
                document.getElementById('activeUser').innerText = "Logged in: " + m;
            } else {
                err.classList.remove('hidden');
                setTimeout(() => err.classList.add('hidden'), 3000);
            }
        }

        const scriptUrl = 'Https://script.google.com/macros/s/AKfycbwK_RCqXqXDUFTJcRCbBuMj3UaduwUjVfNfOCk9sL8jtQD98gn6mn_PSqA7S3EaYNaH/exec';

        document.getElementById('entryForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const btn = document.getElementById('submitBtn');
            const status = document.getElementById('status');
            
            btn.disabled = true;
            btn.innerHTML = 'BHEJA JA RAHA HAI...';
            status.classList.remove('hidden');
            status.className = 'mt-6 p-4 rounded-xl text-center bg-blue-50 text-blue-700 border-blue-200 animate-pulse font-bold';
            status.innerHTML = 'Connecting to Google Cloud...';

            const formData = {
                team: loggedInMobile, 
                mobile: document.getElementById('mobile').value,
                message: document.getElementById('message').value,
                tension: document.getElementById('tension').value
            };

            fetch(scriptUrl, {
                method: 'POST',
                mode: 'no-cors',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData)
            })
            .then(() => {
                status.className = 'mt-6 p-4 rounded-xl text-center bg-green-600 text-white shadow-xl font-black border-green-800';
                status.innerHTML = '✅ DATA SAVED BY ' + loggedInMobile;
                document.getElementById('entryForm').reset();
                btn.disabled = false;
                btn.innerHTML = 'AGLI ENTRY KAREIN';
                setTimeout(() => status.classList.add('hidden'), 5000);
            })
            .catch(error => {
                status.className = 'mt-6 p-4 rounded-xl text-center bg-red-600 text-white font-bold';
                status.innerHTML = '❌ NETWORK ERROR';
                btn.disabled = false;
                btn.innerHTML = 'RETRY';
            });
        });
    </script>
</body>
</html>
