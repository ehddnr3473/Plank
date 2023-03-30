//
//  TimerView.swift
//  Plank Watch App
//
//  Created by 김동욱 on 2023/03/24.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: DefaultTimerViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            timerBody
            
            HStack {
                resetButton
                startPauseButton
            }
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
    
    // MARK: - Set/Time body
    var timerBody: some View {
        HStack {
            Text("Set: \(Int(viewModel.numberOfSet))")
                .font(.headline)
                .padding()
            
            Text("\(Int(viewModel.remainingTime))")
                .font(.largeTitle)
                .padding()
        }
    }
    
    // MARK: - Button
    var resetButton: some View {
        Button("Reset") {
            viewModel.reset()
        }
        .buttonStyle(.bordered)
        .tint(viewModel.isTimerRunning ? .yellow : .red)
    }
    
    var startPauseButton: some View {
        Button(viewModel.isTimerRunning ? "Pause" : "Start") {
            viewModel.isTimerRunning.toggle()
        }
        .buttonStyle(.bordered)
        .tint(viewModel.isTimerRunning ? .pink : .green)
    }
}

// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewModel: DefaultTimerViewModel())
    }
}
