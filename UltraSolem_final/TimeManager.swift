//
//  TimeManager.swift
//  UltraSolem
//
//  Created by Teck Hao Tea on 01/11/2022.
//

import SwiftUI
import Foundation

class TimeManager: ObservableObject {
    enum timerMode {
        case running
        case stopped
        case paused
    }
    @Published var mode: timerMode = .stopped
    
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
        
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
}
