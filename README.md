<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamara Uddeshya - Mission Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-admin { background: linear-gradient(135deg, #800000 0%, #a52a2a 100%); }
        .hidden { display: none; }
        .logo-ring { border: 3px double #800000; padding: 5px; border-radius: 50%; background: white; }
    </style>
</head>
<body class="bg-[#fdfcf0] font-sans min-h-screen">

    <div id="loginSection" class="flex items-center justify-center min-h-screen p-4">
        <div class="bg-white p-8 rounded-3xl shadow-2xl w-full max-w-sm border-2 border-[#D4AF37] text-center">
            <img src="https://ashantishanti28-rgb.github.io/SHANTI-KI-AUR/1777210190036.png" alt="Logo" class="w-32 h-32 mx-auto mb-4 logo-ring">
            <h1 class="text-2xl font-bold text-[#800000] uppercase tracking-tighter">Hamara Uddeshya</h1>
            <p class="text-[10px] text-gray-500 mb-6 font-bold italic border-b pb-2 tracking-widest text-[#D4AF37]">ASHANTI SE SHANTI KI AUR</p>
            
            <div class="space-y-4">
                <input type="tel" id="userMobile" placeholder="Mobile Number (10 Digits)" class="w-full p-4 border-2 border-gray-100 rounded-xl outline-none focus:border-[#800000] font-bold text-center bg-gray-50 shadow-inner">
                <input type="password" id="userPass" placeholder="Password" class="w-full p-4 border-2 border-gray-100 rounded-xl outline-none focus:border-[#800000] text-center bg-gray-50 shadow-inner">
                <button onclick="checkLogin()" class="w-full gradient-admin text-white font-bold py-4 rounded-xl shadow-lg active:scale-95 transition-all uppercase tracking-widest text-sky-100">Unlock Portal</button>
                <p id="loginError" class="text-red-600 text-[10px] hidden font-bold mt-2 uppercase animate-pulse">Kshama karein! Number ya Password galat hai.</p>
            </div>
        </div>
    </div>

    <div id="portalSection" class="hidden">
        <header class="gradient-admin text-white p-5 shadow-xl text-center border-b-4 border-[#D4AF37]">
            <h1 class="text-xl font-bold uppercase tracking-tight">MISSION DATA ENTRY</h1>
            <p id="activeUser" class="text-[10px] italic opacity-80 mt-1"></p>
        </header>

        <main class="max-w-md mx-auto p-4 mt-6">
            <div class="bg-white rounded-3xl shadow-2xl p-6 border-t-8 border-[#800000]">
                <form id="entryForm" class="space-y-5">
                    <div>
                        <label class="block text-[10px] font-black text-gray-400 mb-1 uppercase">Pariwadi Mobile Number</label>
                        <input type="tel" id="mobile" placeholder="Shikayatkarta ka Mobile" pattern="[0-9]{10}" class="w-full p-4 border-2 border-gray-100 rounded-2xl outline-none font-bold focus:border-red-800" required>
                    </div>

                    <div>
                        <label class="block text-[10px] font-black text-red-800 mb-1 text-center uppercase tracking-tighter italic">Vivad Star (Tension Level)</label>
                        <input type="range" id="tension" min="0" max="100" value="50" class="w-full h-3 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-red-800">
                    </div>

                    <div>
                        <label class="block text-[10px] font-black text-gray-400 mb-1 uppercase">Vivad ka Vivaran (Short Message)</label>
                        <textarea id="message" rows="3" class="w-full p-4 border-2 border-gray-100 rounded-2xl outline-none font-medium focus:border-red-800" placeholder="Yahan vistar se likhein..." required></textarea>
                    </div>

                    <button type="submit" id="submitBtn" class="w-full gradient-admin text-white font-black py-5 rounded-2xl shadow-xl active:scale-95 transition-all uppercase tracking-widest text-sky-100">Data Surakshit Karein</button>
                </form>
                <div id="status" class="hidden mt-6 p-4 rounded-2xl text-center font-black text-[10px] border-2 uppercase tracking-widest"></div>
            </div>
            <button onclick="location.reload()" class="w-full mt-8 text-gray-400 text-[10px] font-bold underline uppercase tracking-widest">Logout from Portal</button>
        </main>
    </div>

    <script>
        // --- 1. LOGIN SECURITY SYSTEM ---
        const ALLOWED_USERS = { 
            "9568111616": "admin786", 
            "9927963150": "sunil786",
            "9000000001": "pass01" 
        };

        let loggedInMobile = "";

        function checkLogin() {
            const m = document.getElementById('userMobile').value;
            const p = document.getElementById('userPass').value;
            const error = document.getElementById('loginError');

            if (ALLOWED_USERS[m] && ALLOWED_USERS[m] === p) {
                loggedInMobile = m;
                document.getElementById('loginSection').classList.add('hidden');
                document.getElementById('portalSection').classList.remove('hidden');
                document.getElementById('activeUser').innerText = "Namaste: " + m;
            } else {
                error.classList.remove('hidden');
                setTimeout(() => error.classList.add('hidden'), 3000);
            }
        }

        // --- 2. GOOGLE SHEET CONNECTION ---
        const scriptUrl = 'https://script.google.com/macros/s/AKfycbwK_RCqXqXDUFTJcRCbBuMj3UaduwUjVfNfOCk9sL8jtQD98gn6mn_PSqA7S3EaYNaH/exec';

        document.getElementById('entryForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const btn = document.getElementById('submitBtn');
            const status = document.getElementById('status');
            
            btn.disabled = true;
            btn.innerHTML = 'DATA SAVING...';
            status.classList.remove('hidden');
            status.className = 'mt-6 p-4 rounded-2xl text-center bg-blue-50 text-blue-700 border-blue-200 animate-pulse font-bold';
            status.innerHTML = 'Connecting to Google Cloud...';

            const formData = {
                team: loggedInMobile, // Login number sheet mein jayega
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
                status.className = 'mt-6 p-4 rounded-2xl text-center bg-green-600 text-white shadow-xl font-black border-green-800';
                status.innerHTML = '✅ SHABAASH! DATA SAVE HO GAYA';
                document.getElementById('entryForm').reset();
                btn.disabled = false;
                btn.innerHTML = 'AGLI ENTRY KAREIN';
                setTimeout(() => status.classList.add('hidden'), 5000);
            })
            .catch(error => {
                status.className = 'mt-6 p-4 rounded-2xl text-center bg-red-600 text-white font-bold';
                status.innerHTML = '❌ NETWORK ERROR: RE-TRY KAREIN';
                btn.disabled = false;
                btn.innerHTML = 'RETRY';
            });
        });
    </script>
</body>
</html>
