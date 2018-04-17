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
    
    let imageView: UIImageView = UIImageView()
    let textLabel: UILabel = UILabel()
    let button: UIButton = UIButton(type: UIButtonType.custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(withFrame frame: CGRect, image: UIImage, text: String, buttonText: String?, complete: ((_ view: UIView)->Void)?) {
        self.init(frame: frame)
        
        self.backgroundColor = bgColor
        self.addSubview(imageView)
        self.addSubview(textLabel)
        self.addSubview(button)
        
        imageView.image = image
        let imageScale = image.size.height / image.size.width
        imageView.frame = CGRect(x: 0, y: ViewH(self) * 0.1, width: ViewW(self), height: ViewW(self) * imageScale)
        
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
        
        let size = (buttonText as NSString).size(attributes: [NSFontAttributeName: button.titleLabel?.font ?? UIFont.systemFont(ofSize: 14.0)])
        button.frame = CGRect(x: (ViewW(self) - size.width - buttonMargin) / 2.0, y: OriginY(textLabel) + ViewH(textLabel) + 20, width: size.width + buttonMargin, height: buttonHeight)
        
        button.setTitle(buttonText, for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
    }

    //MARK: -  按钮事件
    func buttonAction(){
        complete?(self)
    }
    
}
