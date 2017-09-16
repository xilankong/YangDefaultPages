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
        
        let oldLoading = self.viewWithTag(_fullLoadingTag)
        if oldLoading != nil {
            oldLoading?.removeFromSuperview()
        }
        
        let gifBgView = UIView(frame: CGRect(x: 0, y: 0, width: ViewW(self), height: ViewH(self)))
        gifBgView.backgroundColor = UIColor.white
        self.addSubview(gifBgView)
        
        let gifPath = defaultPageBundle.path(forResource: "301", ofType: "gif")
        let gifView = FLAnimatedImageView()
        gifView.contentMode = UIViewContentMode.scaleAspectFill
        gifView.clipsToBounds = true
        gifView.backgroundColor = UIColor.clear
        gifView.frame = CGRect(x: 0, y: 0, width: 200, height: 200 * (300 / 400.0))
        gifView.center = CGPoint(x: ViewW(gifBgView) / 2.0, y: ViewH(gifBgView) / 2.0 * (2 / 3.0))
        gifBgView.addSubview(gifView)
        
        let data = NSData(contentsOfFile: gifPath ?? "")
        let gifImage = FLAnimatedImage(animatedGIFData: (data as Data?) ?? Data())
        gifView.animatedImage = gifImage
        
        let textLabel = UILabel()
        gifBgView.addSubview(textLabel)
        textLabel.text = loading
        textLabel.font = UIFont.systemFont(ofSize: 15)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.textColor = titleColor
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(gifView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self)
            make.centerX.equalTo(self)
        }
    }
    
    open func hideFullLoading() {
        let oldLoading = self.viewWithTag(_fullLoadingTag)
        if oldLoading != nil {
            oldLoading?.removeFromSuperview()
        }
    }
    
}



