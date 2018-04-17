//
//  YangDefaultPageView.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

import UIKit
import SnapKit

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
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(ViewH(self) * 0.1)
            make.centerX.equalTo(self)
            make.width.equalTo(ViewW(self))
            make.height.equalTo(ViewW(self) * imageScale)
        }
        
        textLabel.text = text
        textLabel.font = UIFont.systemFont(ofSize: 15)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.textColor = titleColor
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self)
            make.centerX.equalTo(self)
        }
        guard let buttonText = buttonText, let _ = complete else { return  }
        self.complete = complete

        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.backgroundColor = buttonColor
        button.setTitleColor(titleColor, for: UIControlState.normal)
        button.setTitleColor(titleColor, for: UIControlState.selected)
        button.layer.cornerRadius = buttonHeight / 2.0
        button.layer.masksToBounds = true
        
        let size = (buttonText as NSString).size(attributes: [NSFontAttributeName: button.titleLabel?.font ?? UIFont.systemFont(ofSize: 14.0)])
        button.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(size.width + buttonMargin)
            make.height.equalTo(buttonHeight)
        }
        button.setTitle(buttonText, for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
    }

    //MARK: -  按钮事件
    func buttonAction(){
        complete?(self)
    }
    
}
