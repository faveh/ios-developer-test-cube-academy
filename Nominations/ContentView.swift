//
//  ContentView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var nominations: [Nomination] = Nomination.nominations
    @State var showingNominationForm = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    HeaderBarView()
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            NominationsHeaderView()
                            
                            if nominations.isEmpty {
                                EmptyNominationsView()
                            } else {
                                ForEach(nominations) { nomination in
                                    NominationItemView(name: nomination.name, reasoning: nomination.reasoning)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(.cubeLightGrey)
                .safeAreaInset(edge: .bottom) {
                    StickyButtonView(primaryName: "create new nomination", buttonType: .unStackedPrimary, primaryState: .active) {
                        self.showingNominationForm = true
                    }
                }
                .navigationDestination(isPresented: $showingNominationForm) {
                    NominationFormView()
                }
            }
            .navigationBarBackButtonHidden()
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Nomination: Identifiable {
    let id: UUID
    let name: String
    let reasoning: String
    
    init(name: String, reasoning: String) {
        self.id = UUID()
        self.name = name
        self.reasoning = reasoning
    }
    
    static let nominations: [Nomination] = [
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player."),
        Nomination(name: "Sam Davis", reasoning: "Always goes above and beyond when it comes to helping out the team. He's always there to help out and is a great team player.")
    ]
}

#Preview("ContentView") {
    ContentView()
}


#Preview("NominationFormView") {
    NominationFormView()
}
