//
//  YangDefaultPageView.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

import UIKit

class YangDefaultPageView: UIView {
    
    let buttonMargin: CGFloat = 60
    let buttonHeight: CGFloat = 35
    
    var complete: ((_ view: UIView)->Void)?
    
    let textLabel: UILabel = UILabel()
    let imageView: UIImageView = UIImageView()
    let button: UIButton = UIButton(type: UIButtonType.custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化器
    ///
    /// - Parameters:
    ///   - frame: frame
    ///   - image: 图片
    ///   - text: 文案
    ///   - buttonText: 按钮文案
    ///   - complete: 回调
    convenience init(withFrame frame: CGRect, image: UIImage, text: String, buttonText: String?, complete: ((_ view: UIView)->Void)?) {
        self.init(frame: frame)
        
        self.backgroundColor = bgColor
        self.addSubview(imageView)
        self.addSubview(textLabel)
        self.addSubview(button)
        
        imageView.image = image
        let imageScale = image.size.height / image.size.width
        
        //根据图片调整
        var imageViewWidth = image.size.width > ViewW(self) ? ViewW(self) : image.size.width
        var imageViewHeight = imageViewWidth * imageScale
        
        if imageViewHeight > (ViewH(self) / 3.0) {
            imageViewHeight = (ViewH(self) / 3.0)
            imageViewWidth = imageViewHeight / imageScale
        }
            
        imageView.frame = CGRect(x: 0, y: ViewH(self) * 0.1, width: imageViewWidth, height: imageViewHeight)
        imageView.center = CGPoint(x: ViewW(self) / 2.0, y: ViewH(self) / 3.0)
        textLabel.text = text
        textLabel.font = UIFont.systemFont(ofSize: 15)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.textColor = titleColor
        textLabel.frame = CGRect(x: 0, y: ViewH(imageView) + OriginY(imageView) + 20, width: ViewW(self), height: 30)
        
        guard let buttonText = buttonText, let _ = complete else { return  }
        self.complete = complete
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.backgroundColor = buttonColor
        button.setTitleColor(titleColor, for: UIControlState.normal)
        button.setTitleColor(titleColor, for: UIControlState.selected)
        button.layer.cornerRadius = buttonHeight / 2.0
        button.layer.masksToBounds = true
        
        let size = (buttonText as NSString).size(withAttributes: [NSAttributedStringKey.font : button.titleLabel?.font ?? UIFont.systemFont(ofSize: 14.0)])
        
        button.frame = CGRect(x: (ViewW(self) - size.width - buttonMargin) / 2.0, y: OriginY(textLabel) + ViewH(textLabel) + 20, width: size.width + buttonMargin, height: buttonHeight)
        
        button.setTitle(buttonText, for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
    }
    
    //MARK: -  按钮事件
    @objc func buttonAction(){
        complete?(self)
    }
    
}
