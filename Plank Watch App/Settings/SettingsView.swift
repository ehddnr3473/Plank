//
//  SettingsView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/25.
//

import SwiftUI

struct SettingsView: View {
    @State var value: Int
    
    var body: some View {
        Stepper(String(value), value: $value)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(value: 60)
    }
}
