//
//  UIViewController+Loading.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

import UIKit
import FLAnimatedImage

extension UIViewController {
    
    open func showLoading() {
        self.view.showFullLoading()
    }
    
    open func hideLoading() {
        self.view.hideFullLoading()
    }
    
}

