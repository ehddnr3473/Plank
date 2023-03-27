//
//  SettingsState.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/28.
//

import Foundation

/// Originator
final class SettingsState: ObservableObject {
    typealias Memento = TimeInterval
    
    @Published var time: Memento
    
    init() {
        if let time = SettingsManager.restore(saveName: "TIME") as? TimeInterval {
            self.time = time
        } else {
            self.time = 60
        }
    }
}
