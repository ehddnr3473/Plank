//
//  TimerViewModel.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import Foundation

protocol TimerViewModelInput: AnyObject {
    func startTimer()
    func tick()
}

protocol TimerViewModelOutput: AnyObject {
    var isTimerRunning: Bool { get }
    var remainingTime: Int { get }
}

typealias TimerViewModel = TimerViewModelInput & TimerViewModelOutput

final class DefaultTimerViewModel: ObservableObject, TimerViewModel {
    // MARK: - Output
    @Published var isTimerRunning = false
    @Published var remainingTime: Int
    
    // MARK: - Init
    init(remainingTime: Int) {
        self.remainingTime = remainingTime
    }
}

// MARK: - Input
extension DefaultTimerViewModel {
    func startTimer() {
        isTimerRunning.toggle()
    }
    
    func tick() {
        if isTimerRunning && remainingTime > 0 {
            remainingTime -= 1
        }
    }
}
