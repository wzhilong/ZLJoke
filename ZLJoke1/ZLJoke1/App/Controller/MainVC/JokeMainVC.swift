//
//  JokeMainVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JokeMainVC: UIViewController {
    @IBOutlet weak var topScrollV: JKScrollTitle!
    @IBOutlet weak var contentScrollV: UIScrollView!
    
    
    internal var topDel :JKMainTopScrDelegate?
    internal var contDel:JKMainConScrDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
    topScrollV.addTitleArray(["1","2","3","3","2","3","3","2","3","3"]) { (num, title) in
            NSLog("num:%d , title:%s", num,title)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
