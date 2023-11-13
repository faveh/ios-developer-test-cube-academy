//
//  EmptyNominationsView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct EmptyNominationsView: View {
    var body: some View {
        VStack(spacing: 38) {
            Spacer()
                .frame(height: 90)
            R.image.emptyCart.image
                .resizable()
                .frame(width: 88, height: 62)
            Text(FormConstants.emptyTitle)
                .style(.boldHeadlineMedium)
                .foregroundColor(.cubeDarkGrey)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 29)
        .background(.cubeLightGrey)
    }
}

#Preview {
    EmptyNominationsView()
}
