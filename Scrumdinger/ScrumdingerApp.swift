//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/04.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums)
            }
            .onAppear {
                ScrumStore.load { result in
                    switch result {
                    case let .failure(error):
                        fatalError(error.localizedDescription)
                    case let .success(scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
