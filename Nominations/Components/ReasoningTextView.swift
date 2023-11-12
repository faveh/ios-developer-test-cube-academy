//
//  ReasoningTextView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ReasoningTextView: View {
    @State private var reasonText = ""
    @State private var isExceedingLimit = false
    let maxCharacter = 280

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RequiredLabelView(label: "Reasoning")
            Spacer()
                .frame(height: 8)
            TextEditor(text: $reasonText)
                .frame(height: 203)
                .border(reasonText.count >= maxCharacter ? Color.systemError500 : Color.cubeMidGrey, width: 2)
                .foregroundStyle(.black)
                .style(.body)
                .onChange(of: reasonText, initial: true) { _, newReasonText in
                    if newReasonText.count > maxCharacter {
                        reasonText = String(newReasonText.prefix(maxCharacter))
                    }
                }

            if reasonText.count >= maxCharacter {
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
