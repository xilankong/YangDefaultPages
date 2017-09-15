//
//  Loading.swift
//  Pods-YangWidgets_Example
//
//  Created by yanghuang on 2017/9/9.
//

import UIKit
import FLAnimatedImage

extension UIView {
    
    open func showFullLoading() {
        
        var oldLoading = self.viewWithTag(_fullLoadingTag)
        if oldLoading != nil {
            oldLoading?.removeFromSuperview()
        }
        
        let gifBgView = UIView(frame: CGRect(x: 0, y: 0, width: ViewW(self), height: ViewH(self)))
        gifBgView.backgroundColor = UIColor.white
        self.addSubview(gifBgView)
        
        let gifPath = defaultPageBundle.path(forResource: "loading2", ofType: "gif")
        let gifView = FLAnimatedImageView()
        gifView.contentMode = UIViewContentMode.scaleAspectFill
        gifView.clipsToBounds = true
        gifView.backgroundColor = UIColor.clear
        gifView.frame = CGRect(x: 0, y: 0, width: 300, height: 300 * _imageScale)
        gifView.center = CGPoint(x: ViewW(gifBgView) / 2.0, y: ViewH(gifBgView) / 2.0 * (2 / 3.0))
        gifBgView.addSubview(gifView)
        
        let data = NSData(contentsOfFile: gifPath ?? "")
        let gifImage = FLAnimatedImage(animatedGIFData: (data as? Data) ?? Data())
        gifView.animatedImage = gifImage
    }
    
    open func hideFullLoading() {
        var oldLoading = self.viewWithTag(_fullLoadingTag)
        if oldLoading != nil {
            oldLoading?.removeFromSuperview()
        }
    }
    
}



