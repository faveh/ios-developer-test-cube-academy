//
//  SubmittedView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct SubmittedView: View {
    var warningSheetHeight: Double = 360
    @State var pageHeight: Double = 0
    @State var backToHome = false
    @State var showCreateNominationPage = false

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    HeaderBarView(title: FormConstants.submitted)
                    ScrollView {
                        LazyVStack(alignment: .center, spacing: 0) {
                            R.image.nominationBanner2.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(.bottom, 30)

                            Group {
                                Text(FormConstants.submitted.uppercased())
                                    .style(.boldHeadlineLarge)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 12)
                                
                                Text(FormConstants.thankYou)
                                    .style(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 34)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(.cubeLightGrey)
                .safeAreaInset(edge: .bottom) {
                    StickyButtonView(primaryName: FormConstants.createNewNomination, secondaryName: FormConstants.backToHome, buttonType: .verticalStack, primaryState: .active) {
                        self.showCreateNominationPage = true
                    } secondaryAction: {
                        self.backToHome = true
                    }
                }
                .onAppear {
                    pageHeight = proxy.size.height
                }
                .navigationBarBackButtonHidden()
                .navigationDestination(isPresented: $backToHome) {
                    ContentView()
                }
                .navigationDestination(isPresented: $showCreateNominationPage) {
                    NominationFormView()
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    SubmittedView()
}
