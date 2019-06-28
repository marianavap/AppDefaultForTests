//
//  ShowInView.swift
//  imagegalleryapp
//
//  Created by Mariana V. A. Souza on 30/05/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation
import UIKit

struct ShowInView {
    private(set) var source: String = String()
    private(set) var label: String = String()
}

extension ShowInView {
    init(_ photo: Size) {
        source = photo.source
        label = photo.label
    }
}
