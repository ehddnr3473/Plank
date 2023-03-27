//
//  SettingsView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/25.
//

import SwiftUI

struct SettingsView: View {
    @State var value: Float
    
    var body: some View {
        Stepper(String(Int(value)), value: $value)
            .digitalCrownRotation(
                $value,
                from: 0,
                through: 200,
                by: 1,
                sensitivity: .low,
                isContinuous: true,
                isHapticFeedbackEnabled: true
            )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(value: 60)
    }
}
