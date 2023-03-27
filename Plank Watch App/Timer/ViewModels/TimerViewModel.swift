//
//  TimerViewModel.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import Foundation

protocol TimerViewModelInput: AnyObject {
    func updateTime()
    func startTimer()
    func tick()
}

protocol TimerViewModelOutput: AnyObject {
    var isTimerRunning: Bool { get }
    var remainingTime: TimeInterval { get }
}

typealias TimerViewModel = TimerViewModelInput & TimerViewModelOutput

final class DefaultTimerViewModel: ObservableObject, TimerViewModel {
    // MARK: - Output
    @Published var isTimerRunning = false
    @Published var remainingTime: TimeInterval
    
    // MARK: - Init
    init() {
        self.remainingTime = DefaultTimerViewModel.restoreRemainingTime()
    }
}

// MARK: - Input
extension DefaultTimerViewModel {
    func updateTime() {
        self.remainingTime = DefaultTimerViewModel.restoreRemainingTime()
    }
    
    func startTimer() {
        isTimerRunning.toggle()
    }
    
    func tick() {
        if isTimerRunning && remainingTime > 0 {
            remainingTime -= 1
        }
    }
}

// MARK: - Private
private extension DefaultTimerViewModel {
    static func restoreRemainingTime() -> TimeInterval {
        if let time = SettingsManager.restore(saveName: "TIME") as? TimeInterval {
            return time
        } else {
            return 60
        }
    }
}
