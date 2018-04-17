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
let loading = "加载中~"

let _fullLoadingTag = 9999999
let _fullDefaultTag = 9999998

let _imageScale = 494.0 / 658.0
let bgColor: UIColor = UIColor.white
let titleColor: UIColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
let buttonColor: UIColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
let defaultPageBundle = Bundle(for: Helper.classForCoder())

public func ViewH(_ view: UIView) -> CGFloat {
    return view.frame.size.height
}

public func ViewW(_ view: UIView) -> CGFloat {
    return view.frame.size.width
}
