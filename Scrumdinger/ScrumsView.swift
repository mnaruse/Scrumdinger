//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/05.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
    }
}

struct ScrumsView_Preview: PreviewProvider {
    static let scrums = DailyScrum.sampleData
    static var previews: some View {
        ScrumsView(scrums: scrums)
    }
}
