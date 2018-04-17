//
//  ViewController.swift
//  YangDefaultPages
//
//  Created by xilankong on 09/15/2017.
//  Copyright (c) 2017 xilankong. All rights reserved.
//

import UIKit
import YangDefaultPages

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = ["VC加载中", "VC无数据页面", "VC失败页面",  "VC带按钮刷新缺省页", "Table加载中","Table缺省页面"]
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(200)
            $0.left.right.bottom.equalTo(self.view)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.showLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.hideLoading()
            }
        case 1:
            self.showNoDataPage()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.hideDefaultPage()
            }
        case 2:
            self.showFailedPage()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.hideDefaultPage()
            }
        case 3:
            self.showNoNetworkPage { (view) in
                self.hideDefaultPage()
            }
        case 4:
            self.tableView.showFullLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.tableView.hideFullLoading()
            }
        case 5:
            self.tableView.showNoDataPage()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.tableView.hideDefaultPage()
            }
        default:
            print("")
        }
    }
}

