//
//  ViewController.swift
//  SwiftNavigation
//
//  Created by amaker on 09/07/2016.
//  Copyright (c) 2016 amaker. All rights reserved.
//

import UIKit
import SwiftNavigation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftNavi = self.navigationItem.setItemWithTitle("Left", textColor: UIColor.blueColor(), size: 20, type: .left) as SwfitNaviItem
        leftNavi.addTarget(self, selector: #selector(actionNavi), event: .TouchUpInside)
        self.navigationItem.setItemWithTitle("Center", textColor: UIColor.blueColor(), size: 20, type: .center)
        self.navigationItem.setItemWithTitle("Right", textColor: UIColor.blueColor(), size: 20, type: .right)
    }
    
    func actionNavi(sender:UIButton)  {
        print("This is action...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

