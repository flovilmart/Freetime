//
//  UICollectionView+Utils.swift
//  Freetime
//
//  Created by Florent Vilmart on 17-07-16.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit

extension UICollectionView {
    func indexPathOfLastItem() -> IndexPath? {
        var lastSection = numberOfSections - 1
        var lastItem = numberOfItems(inSection: lastSection) - 1
        while lastSection >= 0, // there's at least 1 section
            lastItem < 0 { // there's no item in that section
            lastSection -= 1 // move up one section
            lastItem = numberOfItems(inSection: lastSection) - 1 // get number of items
        }

        guard lastSection >= 0, lastItem >= 0 else { return nil }

        return IndexPath(item: lastItem, section: lastSection)
    }

    func scrollToLastItem(at position: UICollectionViewScrollPosition = .top, animated: Bool) {
        guard let indexPath = indexPathOfLastItem() else {
            // empty collectionView
            return
        }
        scrollToItem(at: indexPath, at: position, animated: false)
    }
}
