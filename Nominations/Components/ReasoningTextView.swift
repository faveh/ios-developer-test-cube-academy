//
//  ReasoningTextView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ReasoningTextView: View {
    @EnvironmentObject var nominationVM: NominationViewModel
    let maxCharacter = 28

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RequiredLabelView(label: "Reasoning")
            Spacer()
                .frame(height: 8)
            TextEditor(text: $nominationVM.reasonText)
                .scrollContentBackground(.hidden)
                .background(Color.cubeLightGrey)
                .frame(height: 203)
                .border(nominationVM.reasonText.count >= maxCharacter ? Color.systemError500 : Color.cubeMidGrey, width: 2)
                .foregroundStyle(.black)
                .style(.body)
                .onChange(of: nominationVM.reasonText, initial: true) { _, newReasonText in
                    if newReasonText.count > maxCharacter {
//                        nominationVM.reasonText = String(newReasonText.prefix(maxCharacter))
                        nominationVM.reasonExceedingLimit = true
                    } else {
                        nominationVM.reasonExceedingLimit = false
                    }
                }

            if nominationVM.reasonText.count >= maxCharacter {
                Text("You have exceeded the maximum character limit of \(maxCharacter).")
                    .foregroundColor(Color.systemError500)
                    .style(.errorSmall)
                    .padding(.top, 4)
            }
        }
    }
}

#Preview {
    ReasoningTextView()
}
