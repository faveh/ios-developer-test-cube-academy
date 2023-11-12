//
//  DropdownView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

enum CubeName: String, CaseIterable, Identifiable {
    case Fifth, Eigth, Tenth
    var id: String { self.rawValue }
}

struct NameDropdownView: View {
    @State private var selectedOption: CubeName = .Eigth
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RequiredLabelView(label: "Cube's name")
            Spacer()
                .frame(height: 8)
            Menu {
                Picker("Options", selection: $selectedOption) {
                    ForEach(CubeName.allCases) { cubeName in
                        Text(cubeName.rawValue)
                            .tag(cubeName)
                    }
                }
            } label: {
                Rectangle()
                    .fill(Color.white)
                    .stroke(Color.cubeMidGrey, lineWidth: 2)
                    .frame(height: ThemeSettings.shared.buttonHeight)
                    .overlay {
                        HStack {
                            Text(selectedOption.rawValue)
                                .style(.body)
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
