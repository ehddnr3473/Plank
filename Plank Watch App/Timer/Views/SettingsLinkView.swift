//
//  SettingsLinkView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/26.
//

import SwiftUI

struct SettingsLinkView: View {
    var body: some View {
        NavigationLink(destination: { SettingsView(value: 60) }) {
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
