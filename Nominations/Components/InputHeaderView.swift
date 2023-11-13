//
//  InputHeaderView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct InputHeaderView: View {
    var title: String
    var subTitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .style(.boldHeadlineSmall)
                .multilineTextAlignment(.leading)
            Text(subTitle)
                .style(.body)
        }
    }
}

#Preview("InputHeaderView") {
    InputHeaderView(title: FormConstants.nominateThisCubeTitle, subTitle: FormConstants.nominateThisCubeSubtitle)
}

struct RadioHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text(FormConstants.radioHeaderText1)
                    .foregroundStyle(.black)
                + Text(FormConstants.radioHeaderText2).foregroundStyle(.cubePink)
                + Text(FormConstants.radioHeaderText3).foregroundStyle(.black)
            }
            .style(.boldHeadlineSmallest)
            Text(FormConstants.radioSubtitle)
                .style(.body)
        }
    }
}

#Preview("RadioHeaderView") {
    RadioHeaderView()
}
