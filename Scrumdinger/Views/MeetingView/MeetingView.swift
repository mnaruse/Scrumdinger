//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/04.
//

import AVFoundation
import SwiftUI

struct MeetingView: View {
    // MARK: Internal Stored Properties

    @Binding var scrum: DailyScrum

    // MARK: Private Stored Properties

    @StateObject private var scrumTimer = ScrumTimer()
    @StateObject private var speechRecoginizer = SpeechRecognizer()
    @State private var isRecording = false

    // MARK: Private Computed Properties

    private var player: AVPlayer {
        AVPlayer.sharedDingPlayer
    }

    // MARK: Body

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording, theme: scrum.theme)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                // オーディオファイルが常に最初から開始されるように設定する。
                player.seek(to: .zero)
                player.play()
            }
            // 音声認識エンジンをリセットして、文字起こしを開始する。
            speechRecoginizer.reset()
            speechRecoginizer.transcribe()
            isRecording = true
            // スクラムタイマーを開始する。
            scrumTimer.startScrum()
        }
        .onDisappear {
            // スクラムタイマーを停止する。
            scrumTimer.stopScrum()
            // 文字起こしを停止する。
            speechRecoginizer.stopTranscribing()
            isRecording = false
            // スクラムの履歴を追加する。
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrum.timer.secondsElapsed / 60, transcript: speechRecoginizer.transcript)
            scrum.history.insert(newHistory, at: 0)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
