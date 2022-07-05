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
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrum")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityAddTraits(.isButton)
            .accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Preview: PreviewProvider {
    static let scrums = DailyScrum.sampleData
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: scrums)
        }
    }
}
