//
//  ContentView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nominationVM = NominationViewModel(service: NominationService())
    
    @State var showingNominationForm = false
    @State var showingEditNominationForm = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    HeaderBarView()
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            NominationsHeaderView()
                            
                            if nominationVM.nominations.isEmpty {
                                EmptyNominationsView()
                            } else {
                                ForEach(nominationVM.nominations) { nomination in
                                    if let nominee = nominationVM.nominees.first(where: { $0.id == nomination.nomineeID }) {
                                        NominationItemView(name: nominee.fullName, reasoning: nomination.reason)
                                            .onTapGesture {
                                                nominationVM.getNomination(nominationID: nomination.id) { success in
                                                    if success {
                                                        self.showingEditNominationForm = true
                                                    }
                                                }
                                            }
                                    }
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
                        .environmentObject(nominationVM)
                }
                .navigationDestination(isPresented: $showingEditNominationForm) {
                    EditNominationView()
                        .environmentObject(nominationVM)
                }
            }
            .navigationBarBackButtonHidden()
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                nominationVM.getNominations()
            }
        }
    }
}

#Preview("ContentView") {
    ContentView()
}
