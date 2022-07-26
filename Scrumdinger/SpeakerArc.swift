//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/22.
//

import SwiftUI

struct SpeakerArc: Shape {
    // MARK: Internal Stored Properties

    /// どの参加者かを特定するためのスピーカーのインデックス
    let speakerIndex: Int
    /// 全スピーカーの数
    let totalSpeakers: Int

    // MARK: Private Computed Properties

    /// 1スピーカーあたりの角度
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }

    /// 開始アングル
    ///
    /// 追加の 1.0 度は、円弧のセグメント間の見た目上の区切り線を表す。
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }

    /// 終了アングル
    ///
    /// 1.0 度の除算は、円弧のセグメント間の見た目上の区切り線を表す。
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }

    // MARK: Path

    func path(in rect: CGRect) -> Path {
        /// 直径
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        /// 半径
        let radius = diameter / 2.0
        /// 中心点の座標
        let center = CGPoint(x: rect.midX, y: rect.midY)

        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
