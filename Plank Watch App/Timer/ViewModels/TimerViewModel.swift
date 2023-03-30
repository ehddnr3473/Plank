//
//  TimerViewModel.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import Foundation

protocol TimerViewModelInput: AnyObject {
    func updateTime()
    func tick()
    func reset()
}

protocol TimerViewModelOutput: AnyObject {
    var isTimerRunning: Bool { get set }
    var remainingTime: TimeInterval { get }
    var numberOfSet: Int { get }
}

typealias TimerViewModel = TimerViewModelInput & TimerViewModelOutput

final class DefaultTimerViewModel: ObservableObject, TimerViewModel {
    // MARK: - Private
    private var time: TimeInterval
    
    // MARK: - Output
    @Published var isTimerRunning = false
    @Published var remainingTime: TimeInterval
    @Published var numberOfSet = 0
    
    // MARK: - Init
    init() {
        self.time = DefaultTimerViewModel.restoreRemainingTime()
        self.remainingTime = time
    }
}

// MARK: - Input
extension DefaultTimerViewModel {
    func updateTime() {
        self.time = DefaultTimerViewModel.restoreRemainingTime()
        self.remainingTime = time
    }
    
    func tick() {
        if isTimerRunning && remainingTime > 0 {
            remainingTime -= 1
        } else if isTimerRunning && remainingTime == 0 {
            isTimerRunning = false
            remainingTime = time
            numberOfSet += 1
        }
    }
    
    func reset() {
        if !isTimerRunning {
            numberOfSet = 0
        }
        
        isTimerRunning = false
        updateTime()
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
