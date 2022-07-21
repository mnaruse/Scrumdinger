//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/21.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String

    init(
        id: UUID = UUID(),
        error: Error,
        guidance: String
    ) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
