//
//  UIViewController+Loading.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

import UIKit
import FLAnimatedImage

extension UIViewController {
    
    
    /// 显示控制器loading，全屏
    open func showLoading() {
        self.view.showFullLoading()
    }
    
    /// 隐藏控制器loading，全屏
    open func hideLoading() {
        self.view.hideFullLoading()
    }
    
}

