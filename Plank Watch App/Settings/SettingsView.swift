//
//  SettingsView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsState: SettingsState
    var convertedTime: String { String(Int(settingsState.time)) }
    
    var body: some View {
        Stepper(convertedTime, value: $settingsState.time)
            .digitalCrownRotation(
                $settingsState.time,
                from: 0,
                through: 200,
                by: 1,
                sensitivity: .low,
                isContinuous: true,
                isHapticFeedbackEnabled: true
            )
            .onChange(of: settingsState.time) { _ in
                SettingsManager.save(
                    settingsState,
                    saveName: SettingsManager.Keys.time
                )
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingsState: SettingsState())
    }
}
