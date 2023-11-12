//
//  RadioButtonView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct RadioButtonView: View {
    @EnvironmentObject var nominationVM: NominationViewModel

    let options = [
        ("Very Unfair", R.image.veryUnfair.image, "very_unfair"),
        ("Unfair", R.image.unfair.image, "unfair"),
        ("Not sure", R.image.notSure.image, "not_sure"),
        ("Fair", R.image.fair.image, "fair"),
        ("Very Fair", R.image.veryFair.image, "very_fair"),
    ]
    var body: some View {
        VStack(spacing: 12) {
            ForEach(options, id: \.0) { text, icon, key in
                Rectangle()
                    .fill(Color.white)
                    .stroke(nominationVM.selectedRadioOption == key ? Color.black : Color.cubeMidGrey)
                    .frame(height: ThemeSettings.shared.buttonHeight)
                    .shadow(nominationVM.selectedRadioOption == key ? .strong : .none)
                    .overlay {
                        RadioButton(text: text, icon: icon, key: key, selectedKey: $nominationVM.selectedRadioOption)
                    }
                    .onTapGesture {
                        if nominationVM.selectedRadioOption == key {
                            nominationVM.selectedRadioOption = nil
                        } else {
                            nominationVM.selectedRadioOption = key
                        }
                    }
            }
        }
    }
}

struct RadioButton: View {
    var text: String
    var icon: Image
    var key: String
    @Binding var selectedKey: String?

    var body: some View {
        HStack {
            icon
                .resizable()
                .frame(width: 24, height: 24)
            Spacer()
                .frame(width: 14)
            Text(text)
                .style(.boldHeadlineTiny)
            Spacer()
            if selectedKey == key {
                R.image.active.image
                    .resizable()
                    .frame(width: 25, height: 25)
            } else {
                R.image.inactive.image
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        
    }
}

#Preview {
    RadioButtonView()
}
