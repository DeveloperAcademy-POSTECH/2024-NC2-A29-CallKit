//
//  STTController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/19/24.
//

import Speech
import AVFoundation

@Observable
class SpeechController: NSObject, SFSpeechRecognizerDelegate {
    let speechRecognizer = SFSpeechRecognizer(locale: .init(identifier: "ko-KR"))
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    
    var isEnabled = false
    var isStarted: Bool = false
    var text: String?
    
    override init() {
        super.init()
        speechRecognizer?.delegate = self
    }
    
    public func startRecording() {
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(AVAudioSession.Category.record)
//            try audioSession.setMode(AVAudioSession.Mode.measurement)
//            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
//        } catch {}
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError()
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            
            if result != nil {
                print("변환된 음성 : ", result?.bestTranscription.formattedString)
                self.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            
            
            if isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.isEnabled = true
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, when in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
