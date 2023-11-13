//
//  NominationsHeaderView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Header view used on the nominations screen.
struct NominationsHeaderView: View {
    var body: some View {
        Text(HomeConstants.yourNomination)
            .textCase(.uppercase)
            .style(.boldHeadlineMedium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(23)
            .background(
                Image(.greenBlobs)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: 140)
            )
            .background(.cubeGreen2)
            .clipped()
    }
}

#Preview {
    NominationsHeaderView()
}
