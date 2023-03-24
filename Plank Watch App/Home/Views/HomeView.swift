//
//  HomeView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/23.
//

import SwiftUI

struct HomeView: View {
    let homeItems: [HomeItem] = [
        .init(title: Content.play, imageName: "play.circle"),
        .init(title: Content.settings, imageName: "gearshape.circle")
    ]
    
    var body: some View {
        NavigationView {
            List(homeItems) { item in
                switch item.title {
                case .play:
                    NavigationLink(destination: TimerView(viewModel: DefaultTimerViewModel(remainingTime: 60))) {
                        HomeListView(item: item)
                    }
                case .settings:
                    NavigationLink(destination: SettingsView(value: 60)) {
                        HomeListView(item: item)
                    }
                }
            }
            .navigationTitle("Plank")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
