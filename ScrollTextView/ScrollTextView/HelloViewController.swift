//
//  HelloViewController.swift
//  TestDemoSwift
//
//  Created by 薛敏 on 2018/5/22.
//  Copyright © 2018年 xuemin. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    var label: XMAutoHorizontalScrollView?
    
    var verticalView: XMAutoVerticalScrollView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label = XMAutoHorizontalScrollView.init(frame: CGRect(x: 20.0, y: 100.0, width: 300.0, height: 40.0))
        label?.text = "Hi Mom!  How are you?  I really ought to write more often."
        label?.textColor = .yellow
        label?.font = UIFont.systemFont(ofSize: 14)
        label?.backgroundColor = UIColor.purple
        
        self.view.addSubview(label!)
        
        
        verticalView = .init(frame: CGRect(x: 20.0, y: 300.0, width: 300.0, height: 60.0))
        verticalView?.textDataSource = ["今天是一个好天气","温度达到了30度以上","可是我并没有感觉很热","因为什么呢","公司开空调了","这个是不是可以有啊"]
        verticalView?.textColor = .red
        verticalView?.textFont = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(verticalView!)
        
        
        let button: UIButton = UIButton.init(frame: CGRect(x: 100, y: 500, width: 200, height: 60))
        button.addTarget(self, action: #selector(touchMe(_:)), for: .touchUpInside)
        button.titleLabel?.text = "touchMe"
        button.backgroundColor = UIColor.brown
        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        label?.scrollIt()
        verticalView?.startScroll()

    }

    override func viewWillDisappear(_ animated: Bool) {
        verticalView?.stopScroll()
    }
    
    @objc func touchMe(_ sender: Any) {
        let viewCtrl = UIViewController()
        viewCtrl.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(viewCtrl, animated: true)

    }
}
