//
//  NavigationRootView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/23.
//

import SwiftUI

struct NavigationRootView: View {
    var body: some View {
        NavigationStack {
            TimerView(viewModel: DefaultTimerViewModel())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRootView()
    }
}
