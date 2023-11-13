//
//  NominationFormView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
import BottomSheet

struct NominationFormView: View {
    @EnvironmentObject var nominationVM: NominationViewModel
    @State var warningSheetPosition: BottomSheetPosition = .hidden
    var warningSheetHeight: Double = FormConstants.warningSheetHeight
    @State var pageHeight: Double = 0
    @State var backToHome = false
    @State var showSubmittedPage = false
    
    

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    HeaderBarView(title: FormConstants.createNominationTitle)
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            R.image.nominationBanner.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(.bottom, 30)

                            Group {
                                InputHeaderView(title: FormConstants.nominateTitle, subTitle: FormConstants.nominateSubtitle)
                                    .padding(.bottom, 30)
                                
                                NameDropdownView()
                                    .padding(.bottom, 46)
                                    .environmentObject(nominationVM)
                                
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.cubeMidGrey)
                                    .padding(.bottom, 40)

                                InputHeaderView(title: FormConstants.nominateThisCubeTitle, subTitle: FormConstants.nominateThisCubeSubtitle)
                                    .padding(.bottom, 34)
                                ReasoningTextView()
                                    .padding(.bottom, 40)
                                    .environmentObject(nominationVM)


                                Divider()
                                    .frame(height: 1)
                                    .overlay(.cubeMidGrey)
                                    .padding(.bottom, 40)

                                RadioHeaderView()
                                    .padding(.bottom, 34)
                                RadioButtonView()
                                    .padding(.bottom, 50)
                                    .environmentObject(nominationVM)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(.cubeLightGrey)
                .safeAreaInset(edge: .bottom) {
                    StickyButtonView(primaryName: FormConstants.submitNominationButtonTitle,
                                     secondaryName: FormConstants.backButtonTitle,
                                     buttonType: .horizontalStack,
                                     primaryState: nominationVM.isSubmitting ? .loading : (nominationVM.isValidToSubmit() ? .active : .inactive)
                    ) {
                        if nominationVM.isValidToSubmit() {
                            nominationVM.nominate { success in
                                if success {
                                    self.showSubmittedPage = true
                                }
                            }
                        }
                    } secondaryAction: {
                        if self.nominationVM.isFillingForm() {
                            self.warningSheetPosition = .relative(warningSheetHeight/proxy.size.height)
                        } else {
                            self.backToHome = true
                        }
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

extension NominationFormView {
    var warningSheetView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
                .frame(height: 24)
            Group {
                Text(FormConstants.confirmTitle.uppercased())
                    .style(.boldHeadlineSmall)
                    .padding(.bottom, 18)
                Text(FormConstants.confirmSubtitle)
                    .style(.body)
                    .padding(.bottom, 60)
            }
            .padding(.horizontal, 24)
            
            StickyButtonView(primaryName: FormConstants.leavePage, secondaryName: FormConstants.cancel, buttonType: .verticalStack, primaryState: .active, secondaryState: .active, isWarningPage: true) {
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
    NominationFormView()
        .environmentObject(NominationViewModel(service: NominationService()))
}

