import SwiftUI
import AVFoundation
import Foundation

class TTSHelper {
    let apiKey = "YOUR_OPENAI_API_KEY" // Replace with your API key
    let ttsURL = "https://api.openai.com/v1/audio/speech"
    
    func getSelectedText() -> String? {
        let pasteboard = NSPasteboard.general
        return pasteboard.string(forType: .string)
    }
    
    func synthesizeSpeech(from text: String, completion: @escaping (URL?) -> Void) {
        guard let url = URL(string: ttsURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: Any] = [
            "model": "tts-1",
            "input": text,
            "voice": "alloy"
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            let tempFileURL = FileManager.default.temporaryDirectory.appendingPathComponent("tts_output.mp3")
            do {
                try data.write(to: tempFileURL)
                completion(tempFileURL)
            } catch {
                print("Failed to write audio file: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func playAudio(from url: URL) {
        var player: AVAudioPlayer?
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play audio: \(error)")
        }
    }
}

@main
struct TTSApp: App {
    let ttsHelper = TTSHelper()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if let text = ttsHelper.getSelectedText() {
                        ttsHelper.synthesizeSpeech(from: text) { url in
                            if let url = url {
                                DispatchQueue.main.async {
                                    ttsHelper.playAudio(from: url)
                                }
                            }
                        }
                    } else {
                        print("No text selected.")
                    }
                }
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Right-click highlighted text and choose 'Read with OpenAI'")
            .padding()
    }
}

