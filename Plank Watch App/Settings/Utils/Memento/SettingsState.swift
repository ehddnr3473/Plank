//
//  SettingsState.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/28.
//

import Foundation

/// Originator
final class SettingsState: ObservableObject {
    @Published var time: TimeInterval
    
    init() {
        if let time = SettingsManager.restore(saveName: SettingsManager.Keys.time) as? TimeInterval {
            self.time = time
        } else {
            self.time = 60
        }
    }
}
