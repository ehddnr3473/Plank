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
    var remainingTime: Int { get }
    var numberOfSet: Int { get }
}

typealias TimerViewModel = TimerViewModelInput & TimerViewModelOutput

final class DefaultTimerViewModel: ObservableObject, TimerViewModel {
    // MARK: - Private
    private var setTime: Int
    
    // MARK: - Output
    @Published var isTimerRunning = false
    @Published var remainingTime: Int
    @Published var numberOfSet = 0
    
    // MARK: - Init
    init() {
        self.setTime = Int(DefaultTimerViewModel.restoreRemainingTime())
        self.remainingTime = setTime
    }
}

// MARK: - Input
extension DefaultTimerViewModel {
    func updateTime() {
        setTime = Int(DefaultTimerViewModel.restoreRemainingTime())
        remainingTime = setTime
    }
    
    func tick() {
        if isTimerRunning && remainingTime > 0 {
            remainingTime -= 1
        } else if isTimerRunning && remainingTime == 0 {
            isTimerRunning = false
            remainingTime = setTime
            numberOfSet += 1
        }
    }
    
    func reset() {
        if !isTimerRunning {
            numberOfSet = 0
        }
        
        isTimerRunning = false
        remainingTime = setTime
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
