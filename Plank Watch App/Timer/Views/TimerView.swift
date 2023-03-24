//
//  TimerView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import SwiftUI

struct TimerView: View {
    @State var isTimerRunning = false
    @State var remainingTime = 60
    
    var body: some View {
        VStack {
            Text("\(remainingTime)")
                .font(.largeTitle)
                .padding()
            
            Button(isTimerRunning ? "Pause" : "Start") {
                startTimer()
            }
            .buttonStyle(.bordered)
            .tint(.pink)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            tick()
        })
    }
    
    func startTimer() {
        isTimerRunning.toggle()
    }
    
    func tick() {
        if isTimerRunning && remainingTime > 0 {
            remainingTime -= 1
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
