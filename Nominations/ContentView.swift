//
//  ContentView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderBarView()
                ScrollView {
                    LazyVStack(spacing: 0) {
                        NominationsHeaderView()
                        ForEach(0..<20) { index in
                            NominationItemView(name: "Nomination \(index)", reasoning: "Always goes above and beyond when it comes")
                        }
                        .listRowSeparator(.hidden)
                    }
                    .scrollIndicators(.hidden)
                    .listStyle(.plain)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(.cubeLightGrey)
            .safeAreaInset(edge: .bottom) {
                StickyButtonView(primaryName: "create new nomination", buttonType: .unStackedPrimary, primaryState: .active) {
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
