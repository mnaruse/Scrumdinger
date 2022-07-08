//
//  Theme.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/05.
//

import SwiftUI

/// カラーテーマ
enum Theme: String, CaseIterable, Identifiable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

    /// アクセントカラー
    ///
    /// テーマのメインカラーに比べてハイコントラストな色。
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }

    /// メインカラー
    ///
    /// アセットカタログから色を初期化する。
    var mainColor: Color {
        return Color(rawValue)
    }

    /// 名前（文字の先頭のみ大文字）
    var name: String {
        return rawValue.capitalized
    }

    var id: String {
        return name
    }
}
