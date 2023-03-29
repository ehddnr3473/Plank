//
//  SettingsLinkView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/26.
//

import SwiftUI

struct SettingsLinkView: View {
    @StateObject var settingsState = SettingsState()
    
    var body: some View {
        NavigationLink(destination: { SettingsView(settingsState: settingsState) }) {
            Label("Settings", systemImage: "gearshape.circle")
        }
        .tint(Color.blue)
    }
}

struct SettingsLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLinkView()
    }
}
