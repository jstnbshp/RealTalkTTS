# **Product Requirements Document (PRD) for RealTalk TTS**

## **1. Overview**
**RealTalk TTS** is a macOS application that enhances the native text-to-speech functionality using OpenAI's **TTS API**. It allows users to highlight text, right-click, and select **'Read with OpenAI'** from the macOS Services menu to hear natural, high-quality speech synthesis.

---
## **2. Goals & Objectives**
### **Primary Goals:**
- Provide **a superior TTS experience** compared to macOS's built-in speech synthesis.
- Seamlessly integrate into the **macOS right-click (Services) menu**.
- Ensure **low-latency** processing via OpenAI’s TTS API.
- Make the application **lightweight, intuitive, and minimalistic**.

### **Success Metrics:**
- **Reliability:** The service should execute within **2-3 seconds** after selecting text.
- **Usability:** The feature should work **system-wide** (Safari, Notes, TextEdit, etc.).
- **Speech Quality:** The output should sound **natural and fluid**.

---
## **3. Key Features**
### ✅ **Core Functionality**
- Highlight any text → **Right-click → Services → Read with OpenAI**.
- The text is sent to OpenAI’s TTS API.
- Audio is played back immediately using `AVAudioPlayer`.

### ⚙️ **Technical Features**
- Uses **macOS Services (`NSServices`)** to integrate into the right-click menu.
- Retrieves the **highlighted text from the clipboard**.
- Calls OpenAI’s API endpoint for TTS.
- Temporarily saves the audio file and plays it.

---
## **4. System Architecture**
### **Tech Stack:**
- **macOS App Development:** Swift + SwiftUI
- **API Communication:** OpenAI TTS API (HTTPS POST requests)
- **Audio Handling:** `AVFoundation` for playback
- **System Integration:** `NSServices`, `NSPasteboard`

### **External Dependencies:**
- Requires an **OpenAI API key** for accessing TTS.
- **macOS 12+** for full compatibility with modern APIs.

---
## **5. User Flow**
1. **User selects text in any macOS app.**
2. **User right-clicks → Services → Read with OpenAI.**
3. **Text is copied, sent to OpenAI API, and synthesized.**
4. **Audio plays back instantly.**

---
## **6. Edge Cases & Error Handling**
| **Scenario**  | **Expected Behavior** |
|--------------|---------------------|
| No text is selected | Show an alert: "No text selected." |
| API key is missing | Show a setup prompt to enter an API key. |
| Network error | Show an alert: "Network error. Try again later." |
| OpenAI API rate-limited | Retry request with exponential backoff. |

---
