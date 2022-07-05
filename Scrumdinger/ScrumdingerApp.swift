//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/04.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
