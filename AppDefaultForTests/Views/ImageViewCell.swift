//
//  ImageViewCell.swift
//  imagegalleryapp
//
//  Created by Mariana V. A. Souza on 30/05/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        layer.cornerRadius = 4
        layer.masksToBounds = false
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bannerImage.kf.cancelDownloadTask()
    }
}

// MARK: - Auxiliar methods
extension ImageViewCell {
    func setup(urlImage:ShowInView) {
        bannerImage.setImage(with: urlImage.source)
    }
}

// MARK: - Identifiable
extension ImageViewCell: Identifiable {}
