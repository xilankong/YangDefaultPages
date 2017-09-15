//
//  ViewController.swift
//  YangDefaultPages
//
//  Created by xilankong on 09/15/2017.
//  Copyright (c) 2017 xilankong. All rights reserved.
//

import UIKit
import YangDefaultPages

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.showFailedPage()
        self.showNoNetworkPage { [weak self] defaultView in
            self?.showLoading()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

