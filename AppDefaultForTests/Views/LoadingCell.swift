//
//  FlikerLoadingCell.swift
//  imagegalleryapp
//
//  Created by Mariana V. A. Souza on 31/05/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import UIKit

class LoadingCell: UICollectionViewCell {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
}

// MARK: - Auxiliar methods
extension LoadingCell {
    func setup() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .silver
    }
}

// MARK: - Identifiable
extension LoadingCell: Identifiable {}
