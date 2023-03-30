//
//  PlankSetListView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/30.
//

import SwiftUI

struct PlankSetListView: View {
    @Binding var plankSets: [PlankSet]
    
    var body: some View {
        List(plankSets) { plankSet in
            PlankSetRowView(plankSet: plankSet)
        }
    }
}

struct PlankSetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlankSetListView(plankSets: .constant([
            .init(numberOfSet: 1, time: 40),
            .init(numberOfSet: 2, time: 60)
        ]))
    }
}
