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
    // MARK: - Private
    private var time: TimeInterval
    private var numberOfSet = 1
    
    // MARK: - Output
    @Published var isTimerRunning = false
    @Published var remainingTime: TimeInterval
    @Published var plankSets = [PlankSet]()
    
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
    
    func startTimer() {
        isTimerRunning.toggle()
    }
    
    func tick() {
        if isTimerRunning && remainingTime > 0 {
            remainingTime -= 1
        } else if isTimerRunning && remainingTime == 0 {
            isTimerRunning = false
            remainingTime = time
            plankSets.append(.init(numberOfSet: numberOfSet, time: time))
            numberOfSet += 1
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
