//
//  ProjectViewController.swift
//  AppDefaultForTests
//
//  Created by Smiles on 28/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation
import UIKit

class ProjectViewController: UICollectionViewController {
    
    private var appViewModel = AppViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appViewModel.getSourceUrl()
    }
    
    
}
