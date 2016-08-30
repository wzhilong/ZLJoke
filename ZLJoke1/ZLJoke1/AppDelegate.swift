//
//  AppDelegate.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , PKRevealing{

    var window: UIWindow?

    internal var  revealController :PKRevealController!
    internal var leftVC :UIViewController!
    internal var rightVC :UIViewController!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let vc = IndexVC()
        vc.title = "启动"
        let nav = UINavigationController.init(rootViewController: vc)
        
        
        leftVC = UIViewController.init()
        leftVC.view.backgroundColor = UIColor.redColor()
        rightVC = UIViewController.init()
        rightVC.view.backgroundColor = UIColor.blueColor()
        
        revealController = PKRevealController.init(frontViewController: nav, leftViewController: leftVC, rightViewController: rightVC)
        
        self.window!.rootViewController = revealController
        self.revealController.delegate = self
        self.revealController.animationDuration = 0.5
        
        return true
    }
    
    func startPresentVC() -> Void {
        if !self.revealController.isPresentationModeActive
        {
            self.revealController .showViewController(rightVC)
        }else
        {
            self.revealController.resignPresentationModeEntirely(false, animated: true, completion: nil)
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

