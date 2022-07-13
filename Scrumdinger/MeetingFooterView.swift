//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/13.
//

import SwiftUI

struct MeetingFooterView: View {
    // MARK: Internal Stored Properties

    let speakers: [ScrumTimer.Speaker]
    /// 次のスピーカーにスキップする時に使う。
    var skipAction: () -> Void

    // MARK: Private Computed Properties

    /// 発言中のスピーカーが何番目のスピーカーかを表す番号。
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else {
            return nil
        }
        return index + 1
    }

    /// 発言中のスピーカーが最後のスピーカーか否か。
    private var isLastSpeaker: Bool {
        speakers.dropLast().allSatisfy { $0.isCompleted }
    }

    /// 発言中のスピーカーの情報。
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else {
            return "No more speakers"
        }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }

    // MARK: Body

    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                        .font(.body.monospacedDigit())
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
