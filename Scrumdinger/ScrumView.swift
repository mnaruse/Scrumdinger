//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/05.
//

import SwiftUI

struct ScrumView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List {
            ForEach(scrums, id: \.title) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
    }
}

struct ScrumView_Preview: PreviewProvider {
    static let scrums = DailyScrum.sampleData
    static var previews: some View {
        ScrumView(scrums: scrums)
    }
}
