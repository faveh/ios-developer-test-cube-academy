//
//  Rswift.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
import RswiftResources


extension RswiftResources.ImageResource {
    var image: Image {
        Image(name)
    }
}

extension RswiftResources.ColorResource {
    var color: Color {
        Color(name)
    }
}

