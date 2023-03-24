//
//  ContentView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{ HomeView() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
