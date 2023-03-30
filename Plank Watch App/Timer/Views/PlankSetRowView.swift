//
//  PlankSetRowView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/30.
//

import SwiftUI

struct PlankSetRowView: View {
    let plankSet: PlankSet
    
    var body: some View {
        HStack {
            Text("Set \(plankSet.numberOfSet)")
            
            Spacer()
            
            Text(String(plankSet.time))
        }
    }
}

struct PlankSetRow_Previews: PreviewProvider {
    static var previews: some View {
        PlankSetRowView(plankSet: PlankSet(numberOfSet: 1, time: 40))
    }
}
