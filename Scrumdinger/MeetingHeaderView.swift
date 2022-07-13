//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/13.
//

import SwiftUI

struct MeetingHeaderView: View {
    // MARK: Internal Stored Properties

    let secondsElapsed: Int
    let secondsRemaining: Int

    // MARK: Private Computed Properties

    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }

    private var progress: Double {
        guard totalSeconds > 0 else {
            return 1
        }
        return Double(secondsElapsed) / Double(totalSeconds)
    }

    private var minutesRemaining: Int {
        secondsRemaining / 60
    }

    // MARK: Body

    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("\(minutesRemaining) minutes")
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 300, secondsRemaining: 600)
            .previewLayout(.sizeThatFits)
    }
}
