//
//  TimerView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: DefaultTimerViewModel
    
    var body: some View {
        VStack {
            Text("\(Int(viewModel.remainingTime))")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button("Reset") {
                    viewModel.isTimerRunning = false
                    viewModel.updateTime()
                }
                .buttonStyle(.bordered)
                
                Button(viewModel.isTimerRunning ? "Pause" : "Start") {
                    viewModel.startTimer()
                }
                .buttonStyle(.bordered)
                .tint(viewModel.isTimerRunning ? .pink : .green)
            }
            
            PlankSetListView(plankSets: $viewModel.plankSets)
                .padding()
        }
        .toolbar { SettingsLinkView() }
        .onAppear { viewModel.updateTime() }
        .onReceive(
            Timer.publish(
                every: 1,
                on: .main,
                in: .common
            ).autoconnect(),
            perform: { _ in
                viewModel.tick()
            }
        )
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewModel: DefaultTimerViewModel())
    }
}
