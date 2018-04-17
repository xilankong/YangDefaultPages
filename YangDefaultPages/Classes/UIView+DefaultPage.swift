//
//  UIView+DefaultPage.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

import UIKit
import SnapKit

let scale: CGFloat = 2.0 / 3.0

extension UIView {
    
    /// 缺省页添加
    ///
    /// - Parameters:
    ///   - image: 缺省图
    ///   - text: 缺省文案
    open func showDefaultPage(withImage image: UIImage, text: String) {
        self.showDefaultPage(withImage: image, text: text, buttonText: nil, offset: 0, complete: nil)
    }
    /// 缺省页添加
    ///
    /// - Parameters:
    ///   - image: 缺省图
    ///   - text: 缺省文案
    ///   - buttonText: 按钮文案，如果有
    ///   - complete: 按钮回调，如果有
    open func showDefaultPage(withImage image: UIImage, text: String, buttonText: String?, complete: ((_ view: UIView)->Void)?) {
        self.showDefaultPage(withImage: image, text: text, buttonText: buttonText, offset: 0, complete: complete)
    }
    
    /// 缺省页添加
    ///
    /// - Parameters:
    ///   - image: 缺省图
    ///   - text: 缺省文案
    ///   - buttonText: 按钮文案，如果有
    ///   - offset: Y轴偏移量
    ///   - complete: 按钮回调，如果有
    open func showDefaultPage(withImage image: UIImage, text: String, buttonText: String?, offset: CGFloat = 0, complete: ((_ view: UIView)->Void)?) {
        
        let oldView = self.viewWithTag(_fullDefaultTag)
        if oldView != nil {
            oldView?.removeFromSuperview()
        }

        let defaultView = YangDefaultPageView(withFrame:CGRect(x: 0, y: offset, width: ViewW(self), height: ViewH(self)), image: image, text: text, buttonText: buttonText, complete: complete)
        defaultView.tag = _fullDefaultTag
        defaultView.backgroundColor = bgColor
        self.addSubview(defaultView)
    }
    
    /// 无网络缺省页
    ///
    /// - Parameters:
    ///   - offset: Y轴偏移量
    ///   - complete: 刷新回调
    open func showNoNetworkPage(withOffset offset: CGFloat = 0, complete: ((_ view: UIView)->Void)?) {
        self.showDefaultPage(withImage: UIImage(named: "nonetwork", in: defaultPageBundle, compatibleWith: nil)!, text: nonetwork, buttonText: "刷新", offset: offset, complete: complete)
    }
    
    /// 无数据缺省页
    ///
    /// - Parameter offset: Y轴偏移量
    open func showNoDataPage(withOffset offset: CGFloat = 0) {
        self.showDefaultPage(withImage: UIImage(named: "nodata", in: defaultPageBundle, compatibleWith: nil)!, text: nodata, buttonText: nil, offset: offset, complete: nil)
    }
    
    ///  操作失败缺省页
    ///
    /// - Parameters:
    ///   - offset: Y轴偏移量
    ///   - complete: 重试回调
    open func showFailedPage(withOffset offset: CGFloat = 0, complete: ((_ view: UIView)->Void)?) {
        self.showDefaultPage(withImage: UIImage(named: "failed", in: defaultPageBundle, compatibleWith: nil)!, text: failed, buttonText: "重试", offset: offset, complete: complete)
    }
    
    /// 丢失缺省页
    ///
    /// - Parameters:
    ///   - offset: Y轴偏移量
    ///   - complete: 刷新回调
    open func showlostedPage(withOffset offset: CGFloat = 0, complete: ((_ view: UIView)->Void)?) {
        self.showDefaultPage(withImage: UIImage(named: "lost", in: defaultPageBundle, compatibleWith: nil)!, text: losted, buttonText: "刷新", offset: offset, complete: complete)
    }
    
    
    /// 去除缺省页
    open func hideDefaultPage() {
        let oldView = self.viewWithTag(_fullDefaultTag)
        if oldView != nil {
            oldView?.removeFromSuperview()
        }
    }
}
