//
//  YangDefaultPageHelper.swift
//  FLAnimatedImage
//
//  Created by yanghuang on 2017/9/11.
//

class Helper: NSObject {}

let nonetwork = "无法连接到网络"
let nodata = "没有！什么都没有~"
let failed = "操作失败，请重新尝试"
let losted = "页面丢失，迷路中~"

let _fullLoadingTag = 9999999
let _imageScale = 494.0 / 658.0
let bgColor: UIColor = UIColor.white
let defaultPageBundle = Bundle(for: Helper.classForCoder())

public func ViewH(_ view: UIView) -> CGFloat {
    return view.frame.size.height
}

public func ViewW(_ view: UIView) -> CGFloat {
    return view.frame.size.width
}
