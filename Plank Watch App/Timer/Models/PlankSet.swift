//
//  PlankSet.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/30.
//

import Foundation

struct PlankSet {
    let numberOfSet: Int
    let time: TimeInterval
}

extension PlankSet: Identifiable {
    var id: Int { numberOfSet }
}
