//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/21.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    // MARK: Stored Properties

    @Published var scrums: [DailyScrum] = []

    // MARK: Private Static Functions

    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("scrums.data")
    }
}
