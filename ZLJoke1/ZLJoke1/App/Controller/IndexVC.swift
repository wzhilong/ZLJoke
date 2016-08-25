//
//  IndexVC.swift
//  ZLJoke
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class IndexVC: UIViewController {

    internal var tabBarVC:UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarVC = self.createVC()
    }
    
    override func viewDidAppear(animated: Bool) {
        self .presentViewController(self.tabBarVC!, animated: true) {
            NSLog("xxxx" )
        }
    }
    /**
     添加视图
     */
    func createVC() -> UITabBarController {
        
        
        
        let mainVC = JokeMainVC()
        mainVC.title = "首页"
        mainVC.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "sk2"), selectedImage: UIImage.init(named: "sk1"))
        
        let myVC = JokeMyVC()
        myVC.title = "my"
        myVC.tabBarItem = UITabBarItem.init(title: "我", image: UIImage.init(named: "sk1"), selectedImage: UIImage.init(named: "sk2"))
        
        
        self.tabBarVC = UITabBarController()
        self.tabBarVC?.view.backgroundColor = UIColor.whiteColor()
        self.tabBarVC!.viewControllers = [mainVC,myVC]
        
        
        return tabBarVC!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
