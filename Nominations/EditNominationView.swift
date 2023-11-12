//
//  EditNominationView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
import BottomSheet

struct EditNominationView: View {
    @EnvironmentObject var nominationVM: NominationViewModel
    @State var warningSheetPosition: BottomSheetPosition = .hidden
    var warningSheetHeight: Double = 360
    @State var pageHeight: Double = 0
    @State var backToHome = false
    @State var showSubmittedPage = false
    
    

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    HeaderBarView(title: "Edit nomination")
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            R.image.nominationBanner.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(.bottom, 30)

                            Group {
                                InputHeaderView(title: "I’d like to nominate...", subTitle: "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic.")
                                    .padding(.bottom, 30)
                                
                                NameDropdownView()
                                    .padding(.bottom, 46)
                                    .environmentObject(nominationVM)
                                
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.cubeMidGrey)
                                    .padding(.bottom, 40)

                                InputHeaderView(title: "I’d like to nominate THIS CUB BECAUSE...", subTitle: "Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐")
                                    .padding(.bottom, 34)
                                ReasoningTextView()
                                    .padding(.bottom, 40)
                                    .environmentObject(nominationVM)


                                Divider()
                                    .frame(height: 1)
                                    .overlay(.cubeMidGrey)
                                    .padding(.bottom, 40)

                                RadioHeaderView(title: "I’d like to nominate this cube because...", subTitle: "As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?")
                                    .padding(.bottom, 34)
                                RadioButtonView()
                                    .padding(.bottom, 30)
                                    .environmentObject(nominationVM)
                                
                                ButtonView(name: "delete nomination", style: .secondary, state: .pressed) {
                                    if let nominationID = nominationVM.nomination?.id {
                                        nominationVM.deleteNomination(nominationID: nominationID) { success in
                                            if success {
                                                self.backToHome = true
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom, 50)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(.cubeLightGrey)
                .safeAreaInset(edge: .bottom) {
                    StickyButtonView(primaryName: "edit nomination",
                                     secondaryName: "back",
                                     buttonType: .horizontalStack,
                                     primaryState: nominationVM.isValidToSubmit() ? .active : .inactive
                    ) {
                        if nominationVM.isValidToSubmit(), let nominationID = nominationVM.nomination?.id {
                            nominationVM.updateNomination(nominationID: nominationID) { success in
                                if success {
                                    self.showSubmittedPage = true
                                }
                            }
                        }
                    } secondaryAction: {
                        self.nominationVM.clearForm()
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
                .navigationDestination(isPresented: $showSubmittedPage) {
                    SubmittedView()
                }
                
            }
            .bottomSheet(bottomSheetPosition: $warningSheetPosition, switchablePositions: [.dynamic]) {
                warningSheetView
            }
            .showDragIndicator(false)
            .enableBackgroundBlur()
            .customAnimation(.linear.speed(2))
            .backgroundBlurMaterial(.systemDark)
            .backgroundBlurMaterial(.dark(.thick))
            .isResizable(false)
            .customBackground {
                Color.white
                    .cornerRadius(0)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

extension EditNominationView {
    var warningSheetView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
                .frame(height: 24)
            Group {
                Text("Are you sure?".uppercased())
                    .style(.boldHeadlineSmall)
                    .padding(.bottom, 18)
                Text("If you leave this page, you will loose any progress made.")
                    .style(.body)
                    .padding(.bottom, 60)
            }
            .padding(.horizontal, 24)
            
            StickyButtonView(primaryName: "yes, leave page", secondaryName: "cancel", buttonType: .verticalStack, primaryState: .active, secondaryState: .active, isWarningPage: true) {
                self.backToHome = true
                self.warningSheetPosition = .hidden
            } secondaryAction: {
                self.warningSheetPosition = .hidden
            }
        }
        .frame(height: warningSheetHeight)
    }
}

#Preview {
    EditNominationView()
}
