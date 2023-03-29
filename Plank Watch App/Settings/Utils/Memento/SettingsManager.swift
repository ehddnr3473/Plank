//
//  SettingsManager.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/28.
//

import Foundation

/// Caretaker
enum SettingsManager {
    private static let defaults = UserDefaults.standard
    
    static func save(_ state: SettingsState, saveName: String) {
        defaults.set(state.time, forKey: saveName)
    }
    
    static func restore(saveName: String) -> Any? {
        return defaults.object(forKey: saveName)
    }
}
