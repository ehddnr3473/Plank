//
//  TimerViewModel.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import Foundation
import UserNotifications

protocol TimerViewModelInput: AnyObject {
    func configureNotification()
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
    func configureNotification() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            guard (settings.authorizationStatus == .authorized) ||
                  (settings.authorizationStatus == .provisional) else {
                self.requestAuthorization()
                return
            }
            
            if settings.alertSetting == .enabled {
                // Schedule an alert-only notification.
            } else {
                // Schedule a notification with a badge and sound.
            }
        }
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
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .provisional]) { granted, error in
            if granted {
                // Configure sended Notification
            } else if let error = error {
                #if DEBUG
                print(String(describing: error))
                #endif
            }
        }
    }
}
