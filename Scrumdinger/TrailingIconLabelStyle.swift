//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/05.
//

import SwiftUI

struct TrailingIconLableStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

// MARK: - Extension LabelStyle

extension LabelStyle where Self == TrailingIconLableStyle {
    static var trailingIcon: Self { Self() }
}
