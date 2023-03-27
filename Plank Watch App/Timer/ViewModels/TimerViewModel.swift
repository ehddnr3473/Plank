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

final class DefaultTimerViewModel: NSObject, ObservableObject, TimerViewModel {
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
        center.delegate = self
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
        
        if remainingTime == 59 {
            sendNotification()
        }
    }
}

// MARK: - Private
private extension DefaultTimerViewModel {
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                
            } else if let error = error {
                #if DEBUG
                print(String(describing: error))
                #endif
            }
        }
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.body = "Finish"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(1), repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "FINISH",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
}

extension DefaultTimerViewModel: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.sound)
    }
}
