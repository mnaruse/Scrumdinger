//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/22.
//

import SwiftUI

struct MeetingTimerView: View {
    // MARK: Internal Stored Properties

    let speakers: [ScrumTimer.Speaker]
    let theme: Theme

    // MARK: Private Computed Properties

    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }

    // MARK: Body

    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [
            ScrumTimer.Speaker(name: "Bill", isCompleted: true),
            ScrumTimer.Speaker(name: "Cathy", isCompleted: false)
        ]
    }

    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
}
