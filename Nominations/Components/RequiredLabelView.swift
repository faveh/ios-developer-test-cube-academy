//
//  RequiredLabelView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct RequiredLabelView: View {
    var label: String

    var body: some View {
        HStack(alignment: .top, spacing: 2) {
            Text(FormConstants.asterik)
                .foregroundStyle(.cubePink2)
            Text(label)
        }
        .style(.boldHeadlineTiny)
    }
}

#Preview {
    RequiredLabelView(label: FormConstants.cubeName)
}
