//
//  AppViewModel.swift
//  AppDefaultForTests
//
//  Created by Smiles on 28/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

/// Delegate to comunicate with controller
protocol ListControllerDelegate: class {
    /// Called when the list is updated
    ///
    /// - Parameter viewModel: ListViewModel
    func imageListViewModelWasFetch(_ viewModel: AppViewModel)
    
    /// Called when some error happen
    ///
    /// - Parameters:
    ///   - viewModel: ListViewModel
    ///   - error: Error
    func imageListViewModel(_ viewModel: AppViewModel, threw error: Error)
}

class AppViewModel {
    weak var delegate: ListControllerDelegate?
    
    private var page: Int = 0
    private var service: ImageServiceProtocol
    private var fetchCompleted = false
    private var isFetching = false
    private var error = false
    private var getLargeImages: Array<ShowInView> = Array()

    init(appService: ImageServiceProtocol = Webservice()) {
        self.service = appService
    }
}

// MARK: - Private
private extension AppViewModel {
    struct Constants {
        static let pageSize: Int = 8
        static let correctLabel: String = "Large Square"
    }
    
    func refresh() {
        page = 0
        fetchCompleted = false
    }
}

extension AppViewModel {
    /// Possible cell types
    ///
    /// - image: flickr cell
    /// - loading: loading cell
    enum CellType {
        case urlImage(ShowInView)
        case loading
    }
    
    /// Number of items in section
    ///
    /// - Parameter section: section
    /// - Returns: number of itens
    func numberOfItens(in section: Int) -> Int {
        let addLoadingCell = fetchCompleted || error ? 0 : 1
        return getLargeImages.count + addLoadingCell
    }
    
    /// Cell type at index path
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: Cell type
    func cellType(at indexPath: IndexPath) -> CellType {
        if indexPath.row > getLargeImages.count - 1 {
            return .loading
        }
        
        return .urlImage(getLargeImages[indexPath.row])
    }
    
    func getSourceUrl() {
        isFetching = true
        
        error = false
        
        service.getURLImage() { [weak self] (callback) in
            guard let weakSelf = self else { return }
            do {
                let imageList = try callback()
                if imageList.getSize.isEmpty {
                    weakSelf.fetchCompleted = true
                } else {
//                    weakSelf.urlImage.append(contentsOf: imageList.getSize.map({ (imagesValues) -> ShowInView in
//                        ShowInView(imagesValues)
//                    }))
                }
//                weakSelf.getImageLargeSize(allimages: weakSelf.urlImage)
                weakSelf.delegate?.imageListViewModelWasFetch(weakSelf)
            } catch {
                weakSelf.delegate?.imageListViewModel(weakSelf, threw: error)
                weakSelf.error = true
                weakSelf.delegate?.imageListViewModelWasFetch(weakSelf)
            }
            weakSelf.isFetching = false
        }
    }
    
    func getImageLargeSize (allimages: [ShowInView]) {
        getLargeImages.removeAll()
        for item in allimages {
            if item.label == Constants.correctLabel {
                getLargeImages.append(item)
            }
        }
    }
}
