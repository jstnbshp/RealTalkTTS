# **README for RealTalk TTS**

## **Installation**
### **1. Clone the Repository**
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/RealTalkTTS.git
cd RealTalkTTS
```

### **2. Open in Xcode**
- Open `RealTalk.xcodeproj` in Xcode.
- Ensure the **macOS Deployment Target** is set to 12.0 or later.

### **3. Set Up OpenAI API Key**
1. Go to **OpenAI Developer Portal** and get an API Key.
2. Open `TTSHelper.swift` and replace `YOUR_OPENAI_API_KEY` with your actual key:
   ```swift
   let apiKey = "YOUR_OPENAI_API_KEY"
   ```

### **4. Run the App**
- Press **Cmd + R** to build and run.

---
## **Usage**
1. **Highlight text in any macOS app** (Safari, Notes, etc.).
2. **Right-click → Services → Read with OpenAI**.
3. **The app will synthesize and play the speech.**

---
## **Troubleshooting**
### ❌ **Service Not Showing in Right-Click Menu?**
Run this in Terminal to refresh Services:
```sh
/System/Library/CoreServices/pbs -update
```

### ❌ **Text Not Being Read?**
- Ensure text is **highlighted before right-clicking**.
- Ensure **Internet is active** (API requires a connection).
- Restart the app and try again.

---
## **Contributing**
- Fork the repository.
- Create a feature branch (`git checkout -b feature-name`).
- Commit changes (`git commit -m "Added new feature"`).
- Push (`git push origin feature-name`).
- Open a Pull Request (PR)!

---
## **License**
This project is licensed under the **MIT License**. See `LICENSE` for details.

🚀 **Happy coding!**


