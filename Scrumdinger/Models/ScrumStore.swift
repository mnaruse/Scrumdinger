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

    // MARK: Internal Static Functions

    /// ファイルを開き、その内容をデコードするという長時間実行されるタスクを、バックグラウンドキューで実行する。これらのタスクが完了したら、メインキューに戻す。
    /// - Parameter completion: 完了ハンドラ
    static func load(completion: @escaping (Result<[DailyScrum], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            // FIFOキュー。バックグラウンドタスクは全てのタスクの中で最も優先度が低い。
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    // ユーザーがアプリを初めて起動した場合は、 `scrums.data` が存在しないため、空の配列で完了ハンドラを渡す。
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    /// デイリースクラムの配列をエンコードし、ファイルに書き込むという長時間実行されるタスクを、バックグラウンドキューで実行する。これらのタスクが完了したら、メインキューに戻す。
    /// - Parameters:
    ///   - scrums: スクラムの配列
    ///   - completion: 完了ハンドラ
    ///     - `success` : デイリースクラムの個数
    ///     - `failure` : エラー
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

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
