//
//  HomeItem.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/25.
//

import Foundation

enum Content: String {
    case play = "Play"
    case settings = "Settings"
}

struct HomeItem: Identifiable {
    let title: Content
    let imageName: String
    let id = UUID()
}
