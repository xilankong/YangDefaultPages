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
    
    /// 无网络缺省页
    ///
    /// - Parameter offset: Y轴偏移量
    open func showNoNetworkPage(withOffset offset: CGFloat, complete: ((_ view: UIView?)->Void)?) {
        self.view.showNoNetworkPage(withOffset: offset, complete: complete)
    }
    
    //MARK: - 无数据缺省页
    open func showNoDataPage() {
        self.view.showNoDataPage(withOffset: 0)
    }
    
    /// 无数据缺省页
    ///
    /// - Parameter offset: Y轴偏移量
    open func showNoDataPage(withOffset offset: CGFloat) {
        self.view.showNoDataPage(withOffset: offset)
    }
    
    //MARK: - 操作失败缺省页
    open func showFailedPage() {
        self.view.showFailedPage(withOffset: 0, complete: nil)
    }
    
    /// 操作失败缺省页
    ///
    /// - Parameter offset: Y轴偏移量
    open func showFailedPage(withOffset offset: CGFloat) {
        self.view.showFailedPage(withOffset: offset, complete: nil)
    }
    
    //MARK: - 丢失缺省页
    open func showlostedPage() {
        self.view.showlostedPage(withOffset: 0, complete: nil)
    }
    
    /// 丢失缺省页
    ///
    /// - Parameter offset: Y轴偏移量
    open func showlostedPage(withOffset offset: CGFloat) {
        self.view.showlostedPage(withOffset: offset, complete: nil)
    }
    
    /// 去除缺省页
    open func hideDefaultPage() {
        self.view.hideDefaultPage()
    }
}
