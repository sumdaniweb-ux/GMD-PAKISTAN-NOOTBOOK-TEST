<!DOCTYPE html>
<html lang="ur" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>NEEBA NOOR - Fixed</title>
<meta http-equiv="X-Content-Type-Options" content="nosniff">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Tahoma, sans-serif; }
  body { height: 100dvh; display: flex; flex-direction: column; overflow: hidden; background: linear-gradient(135deg, #1a0f00 0%, #2d1f00 50%, #0f0a00 100%); color: #FFD700; }
  
  /* Background Effects */
  .animated-bg { position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: -2; pointer-events: none; }
  .floating-orb { position: absolute; border-radius: 50%; filter: blur(60px); opacity: 0.25; animation: float 15s infinite ease-in-out; }
  .orb-1 { width: 300px; height: 300px; background: radial-gradient(circle, #FFD700, #FF6B00); top: -80px; right: -80px; }
  .orb-2 { width: 250px; height: 250px; background: radial-gradient(circle, #FF6B00, #FF4500); bottom: -50px; left: -50px; animation-delay: -7s; }
  @keyframes float { 0%, 100% { transform: translate(0, 0) scale(1); } 33% { transform: translate(60px, -60px) scale(1.1); } 66% { transform: translate(-30px, 40px) scale(0.95); } }
  
  /* Login Screen */
  #loginScreen { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: #0a0500; display: flex; justify-content: center; align-items: center; z-index: 9999; }
  .loginBox { background: #000; border: 2px solid #FFD700; border-radius: 20px; padding: 40px; max-width: 380px; width: 90%; text-align: center; }
  .loginInput { width: 100%; padding: 12px; background: #111; border: 2px solid #FFD700; border-radius: 10px; color: #FFD700; font-size: 18px; text-align: center; margin-bottom: 15px; }
  .loginBtn { width: 100%; padding: 12px; background: #FFD700; color: #000; border: none; border-radius: 10px; font-weight: bold; cursor: pointer; }
  .hidden { display: none !important; }

  /* Header */
  header { padding: 15px 20px; display: flex; align-items: center; justify-content: space-between; flex-shrink: 0; background: rgba(0, 0, 0, 0.4); backdrop-filter: blur(10px); border-bottom: 1px solid rgba(255, 215, 0, 0.2); z-index: 10; }
  header h1 { font-size: 20px; color: #FFD700; }
  .header-btn { background: rgba(255, 215, 0, 0.1); border: 1px solid rgba(255, 215, 0, 0.3); padding: 6px 14px; border-radius: 20px; font-size: 12px; cursor: pointer; color: #FFD700; }

  /* Input Section with Modes */
  .input-section { padding: 10px 15px; background: rgba(0, 0, 0, 0.5); backdrop-filter: blur(10px); border-bottom: 1px solid rgba(255, 215, 0, 0.2); flex-shrink: 0; z-index: 5; }
  
  /* Mode Buttons Row */
  .mode-row {
      display: flex;
      justify-content: center;
      gap: 8px;
      padding-bottom: 10px;
      overflow-x: auto;
      white-space: nowrap;
  }
  .mode-btn {
      background: #333;
      border: 1px solid #FFD700;
      color: #FFD700;
      padding: 6px 12px;
      border-radius: 15px;
      font-size: 12px;
      cursor: pointer;
      transition: all 0.3s;
  }
  .mode-btn.active {
      background: #FFD700;
      color: #000;
      font-weight: bold;
  }

  .input-wrapper { display: flex; align-items: flex-end; gap: 10px; border: 2px solid rgba(255, 215, 0, 0.3); border-radius: 20px; padding: 10px 15px; background: rgba(0, 0, 0, 0.6); direction: ltr; }
  .attach-btn, .mic-btn { background: none; border: none; color: #FFD700; font-size: 22px; cursor: pointer; padding: 8px 5px; flex-shrink: 0; opacity: 0.7; }
  textarea { flex: 1; background: transparent; border: none; font-size: 16px; resize: none; outline: none; min-height: 50px; max-height: 120px; direction: rtl; color: #FFD700; line-height: 1.5; }
  .send-btn { background: none; border: none; color: #FFD700; font-size: 26px; cursor: pointer; padding: 8px 5px; flex-shrink: 0; }

  /* Chat Container */
  #chat-container { 
      width: 100%; 
      flex: 1; /* Takes remaining space */
      overflow-y: auto; 
      padding: 20px; 
      display: flex; 
      flex-direction: column; 
      gap: 15px; 
      scroll-behavior: smooth;
  }
  .message-wrapper { max-width: 80%; animation: fadeIn 0.3s ease; }
  .message-wrapper.user { align-self: flex-end; }
  .message-wrapper.bot { align-self: flex-start; }
  .message { padding: 12px 18px; border-radius: 20px; font-size: 16px; line-height: 1.6; background: rgba(255, 255, 255, 0.05); border: 1px solid rgba(255, 215, 0, 0.2); }
  .user-msg { background: rgba(255, 215, 0, 0.15); border-color: rgba(255, 215, 0, 0.4); }
  @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

  /* File Preview */
  .file-preview { padding: 8px 20px; display: none; align-items: center; gap: 10px; font-size: 13px; color: #FFD700; }
  .file-preview.show { display: flex; }

  /* Modals */
  .modal { display: none; position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.8); z-index: 1000; align-items: center; justify-content: center; padding: 20px; }
  .modal.show { display: flex; }
  .modal-content { background: #1a1a1a; color: #fff; border-radius: 20px; padding: 25px; max-width: 500px; width: 100%; max-height: 90vh; overflow-y: auto; }
  .close-modal { background: none; border: none; color: #fff; font-size: 28px; cursor: pointer; float: left; }
  .btn-save { width: 100%; padding: 12px; background: #4CAF50; color: #fff; border: none; border-radius: 10px; margin-top: 10px; cursor: pointer; }
</style>
</head>
<body>

<!-- Login Screen -->
<div id="loginScreen">
  <div class="loginBox">
    <h1 style="color:#FFD700; margin-bottom:20px;">🔐 Neeba Noor</h1>
    <input type="password" class="loginInput" id="passInput" placeholder="Password">
    <button class="loginBtn" onclick="checkPass()">Unlock</button>
  </div>
</div>

<!-- Main App -->
<div id="mainApp" class="hidden">
  <div class="animated-bg">
    <div class="floating-orb orb-1"></div>
    <div class="floating-orb orb-2"></div>
  </div>

  <header>
    <h1>Neeba Noor</h1>
    <div style="display:flex; gap:5px;">
        <button class="header-btn" onclick="alert('Settings coming soon')">⚙️</button>
    </div>
  </header>

  <div class="input-section">
      <!-- Mode Buttons (English) -->
      <div class="mode-row">
          <button class="mode-btn active" onclick="setMode('love', this)">❤️ Love</button>
          <button class="mode-btn" onclick="setMode('naughty', this)"> Naughty</button>
          <button class="mode-btn" onclick="setMode('angry', this)">😡 Angry</button>
          <button class="mode-btn" onclick="setMode('intense', this)"> Intense</button>
      </div>

      <!-- Input Wrapper -->
      <div class="input-wrapper">
          <button class="attach-btn" onclick="document.getElementById('fileInput').click()">📎</button>
          <input type="file" id="fileInput" style="display:none" onchange="handleFile(this)">
          <textarea id="userInput" rows="1" placeholder="Likhein..."></textarea>
          <button class="mic-btn">🎤</button>
          <button class="send-btn" onclick="sendMessage()">➤</button>
      </div>
  </div>

  <div id="chat-container"></div>

  <div class="file-preview" id="filePreview">
    <span id="fileInfo">File</span>
    <span onclick="removeFile()" style="cursor:pointer; color:red;">✕</span>
  </div>
</div>

<script>
// Login Logic
function checkPass() {
  var p = document.getElementById('passInput').value;
  if (p === '1611') {
    document.getElementById('loginScreen').style.display = 'none';
    document.getElementById('mainApp').classList.remove('hidden');
  } else {
    alert('Wrong Password');
  }
}

// Mode Logic
let currentMode = 'love';
function setMode(mode, btn) {
    currentMode = mode;
    document.querySelectorAll('.mode-btn').forEach(b => b.classList.remove('active'));
    if(btn) btn.classList.add('active');
    
    // Visual feedback for mode change
    const chat = document.getElementById('chat-container');
    const msg = document.createElement('div');
    msg.className = 'message-wrapper bot';
    msg.innerHTML = `<div class="message">Mode changed to: ${mode.toUpperCase()}</div>`;
    chat.appendChild(msg);
    chat.scrollTop = chat.scrollHeight;
}

// Chat Logic
var chatContainer = document.getElementById('chat-container');
var userInput = document.getElementById('userInput');

function sendMessage() {
    var text = userInput.value.trim();
    if (!text) return;
    
    // User Message
    addMessage(text, 'user');
    userInput.value = '';
    userInput.style.height = 'auto';
    
    // Bot Reply Simulation
    setTimeout(() => {
        let reply = "Main sun rahi hoon...";
        if(currentMode === 'love') reply = "Aww! Mujhe bhi pyaar hai! ❤️";
        if(currentMode === 'angry') reply = "Gussa mat dikhao! 😡";
        if(currentMode === 'naughty') reply = "Kya baat hai! 😉";
        
        addMessage(reply, 'bot');
    }, 1000);
}

function addMessage(text, type) {
    var wrapper = document.createElement('div');
    wrapper.className = 'message-wrapper ' + type;
    wrapper.innerHTML = `<div class="message ${type === 'user' ? 'user-msg' : ''}">${text}</div>`;
    chatContainer.appendChild(wrapper);
    chatContainer.scrollTop = chatContainer.scrollHeight;
}

// File Handling
function handleFile(input) {
    if (input.files && input.files[0]) {
        document.getElementById('fileInfo').textContent = input.files[0].name;
        document.getElementById('filePreview').classList.add('show');
    }
}
function removeFile() {
    document.getElementById('fileInput').value = '';
    document.getElementById('filePreview').classList.remove('show');
}

// Auto-resize Textarea
userInput.addEventListener('input', function() {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px';
});

// Enter Key to Send
userInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        sendMessage();
    }
});

// ===== KEYBOARD FIX FOR MOBILE =====
// This ensures the chat scrolls up when keyboard opens
if (window.visualViewport) {
    window.visualViewport.addEventListener('resize', () => {
        // Scroll to bottom of chat when viewport changes (keyboard opens/closes)
        chatContainer.scrollTop = chatContainer.scrollHeight;
    });
}
// ====================================

</script>
</body>
</html>