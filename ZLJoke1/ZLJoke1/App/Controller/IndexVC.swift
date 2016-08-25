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
        
        tabBarVC = addVC()
        
        self .presentViewController(tabBarVC!, animated: true) {
            
        }
        
        
        
    }
    /**
     添加视图
     */
    func addVC() -> UITabBarController {
        tabBarVC = UITabBarController.init()
        let mainVC = JokeMainVC()
        mainVC.title = "首页"
        mainVC.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(named: ""), selectedImage: UIImage.init(named: ""))
        
        tabBarVC!.addChildViewController(mainVC)
        
        return tabBarVC!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
