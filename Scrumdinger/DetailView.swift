//
//  DetailView.swift
//  Scrumdinger
//
//  Created by MiharuNaruse on 2022/07/05.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    var body: some View {
        Text("Hello, world!")
    }
}

struct DetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
