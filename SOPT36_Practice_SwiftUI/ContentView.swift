//
//  ContentView.swift
//  SOPT36_Practice_SwiftUI
//
//  Created by OneTen on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    let row = [GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 16) {
                ForEach(0..<20) {_ in
                    VStack {
                        Rectangle()
                            .fill(.orange)
                            .frame(width: 100)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
