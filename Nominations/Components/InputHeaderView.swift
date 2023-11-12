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
            Text(subTitle)
                .style(.body)
        }
    }
}

#Preview("InputHeaderView") {
    InputHeaderView(title: "I’d like to nominate...", subTitle: "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic.")
}

struct RadioHeaderView: View {
    var title: String
    var subTitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Is how we currently run ".uppercased())
                    .foregroundStyle(.black)
                + Text("cube of the month ".uppercased()).foregroundStyle(.cubePink)
                + Text("fair?".uppercased()).foregroundStyle(.black)
            }
            .style(.boldHeadlineSmallest)
            Text(subTitle)
                .style(.body)
        }
    }
}

#Preview("RadioHeaderView") {
    RadioHeaderView(title: "I’d like to nominate...", subTitle: "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic.")
}
