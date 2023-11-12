//
//  NominationItemView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationItemView: View {
    var name: String
    var reasoning: String
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .stroke(Color.cubeLightGrey)
            .frame(height: 92)
            .overlay {
                VStack(alignment: .leading, spacing: 0) {
                    Text(name)
                        .foregroundStyle(.black)
                        .style(.bodyBold)
                    Text(reasoning)
                        .foregroundStyle(.cubeDarkGrey)
                        .style(.body)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
            }
    }
}

#Preview {
    NominationItemView(name: "David Jones", reasoning: "Always goes above and beyond when it comes")
}
