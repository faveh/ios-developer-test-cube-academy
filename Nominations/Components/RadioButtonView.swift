//
//  RadioButtonView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct RadioButtonView: View {
    @State private var selectedKey: String? = nil

    let options = [
        ("Very Unfair", R.image.veryUnfair.image, "veryUnfair"),
        ("Unfair", R.image.unfair.image, "unfair"),
        ("Not sure", R.image.notSure.image, "notSure"),
        ("Fair", R.image.fair.image, "fair"),
        ("Very Fair", R.image.veryFair.image, "veryFair"),
    ]
    var body: some View {
        VStack {
            ForEach(options, id: \.0) { text, icon, key in
                Rectangle()
                    .fill(Color.white)
                    .stroke(selectedKey == key ? Color.black : Color.cubeMidGrey)
                    .frame(height: ThemeSettings.shared.buttonHeight)
                    .shadow(selectedKey == key ? .strong : .light)
                    .overlay {
                        RadioButton(text: text, icon: icon, key: key, selectedKey: $selectedKey)
                    }
                    .padding(.bottom, 12)
                    .onTapGesture {
                        if selectedKey == key {
                            selectedKey = nil
                        } else {
                            selectedKey = key
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
