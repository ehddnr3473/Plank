//
//  HomeListView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/25.
//

import SwiftUI

struct HomeListView: View {
    let item: HomeItem
    
    var body: some View {
        HStack {
            Image(systemName: item.imageName)
            
            Text(item.title.rawValue)
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(item: HomeItem(title: Content.play, imageName: "play.circle"))
    }
}
