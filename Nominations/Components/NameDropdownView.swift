//
//  DropdownView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NameDropdownView: View {
    @EnvironmentObject var nominationVM: NominationViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RequiredLabelView(label: FormConstants.cubeName)
            Spacer()
                .frame(height: 8)
            Menu {
                Picker(FormConstants.nominees, selection: $nominationVM.selectedOption) {
                    ForEach(nominationVM.nominees) { nominee in
                        Text(nominee.fullName)
                    }
                }
            } label: {
                Rectangle()
                    .fill(Color.cubeLightGrey)
                    .stroke(Color.cubeMidGrey, lineWidth: 2)
                    .frame(height: ThemeSettings.shared.buttonHeight)
                    .overlay {
                        HStack {
                            if let nominee = nominationVM.nominees.first(where: { $0.id == nominationVM.selectedOption }) {
                                Text(nominee.fullName)
                                    .style(.body)
                            } else {
                                Text(FormConstants.selectOption)
                                    .style(.body)
                            }
                            Spacer()
                            R.image.downChevron.image
                                .resizable()
                                .frame(width: 15, height: 10)
                        }
                        .padding(.horizontal, 13)
                    }
                
            }
        }
    }
}

#Preview {
    NameDropdownView()
}
