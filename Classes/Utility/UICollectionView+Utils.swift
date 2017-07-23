//
//  UICollectionView+Utils.swift
//  Freetime
//
//  Created by Florent Vilmart on 17-07-16.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit

extension UICollectionView {
    func scrollToBottom(animated: Bool) {
        var offset = contentOffset
        offset.y = contentSize.height + contentInset.bottom - bounds.height
        setContentOffset(offset, animated: animated)
    }
}
