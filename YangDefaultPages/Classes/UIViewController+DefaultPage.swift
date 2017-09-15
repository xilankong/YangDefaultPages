//
//  UIViewController+DefaultPage.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

import UIKit

extension UIViewController {
    
    //MARK: - 无网络缺省页
    open func showNoNetworkPage(withComplete complete: ((_ view: UIView?)->Void)?) {
        self.view.showNoNetworkPage(withOffset: 0, complete: complete)
    }
    
    //MARK: - 无数据缺省页
    open func showNoDataPage() {
        self.view.showNoDataPage(withOffset: 0)
    }
    
    
    //MARK: - 操作失败缺省页
    open func showFailedPage() {
        self.view.showFailedPage(withOffset: 0, complete: nil)
    }
    
    //MARK: - 丢失缺省页
    open func showlostedPage() {
        self.view.showlostedPage(withOffset: 0, complete: nil)
    }
    
}
