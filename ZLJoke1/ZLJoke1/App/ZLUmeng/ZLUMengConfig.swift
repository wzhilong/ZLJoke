//
//  ZLUMengConfig.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/9/9.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import Foundation


let UMAppKey = "57d26c72e0f55a408a001fff"
let UMChannelId = ""

let WXAppId = ""
let WXAppSecret = ""

let QQAppId = ""
let QQAppKey = ""

let SinaAppId = ""
let SinaSectet = ""

class ZLUMeng: NSObject {
    
    /**
     配置友盟的初始化
     */
    static func UMLaunchApp() -> Void
    {
        UMAnalyticsConfig.sharedInstance().appKey = UMAppKey
        UMAnalyticsConfig.sharedInstance().channelId = UMChannelId
        
        MobClick.setBackgroundTaskEnabled(true)
        MobClick.setCrashReportEnabled(true)
        
        MobClick.startWithConfigure(UMAnalyticsConfig.sharedInstance())
    }
    
    func UMShareAppLaunch() -> Void
    {
        UMSocialData.setAppKey(UMAppKey)
        if WXAppId != "" {
            UMSocialWechatHandler.setWXAppId(WXAppId, appSecret: WXAppSecret, url: "")
        }
        if QQAppId != "" {
            UMSocialQQHandler .setQQWithAppId(QQAppId, appKey: QQAppKey, url: "")
        }
        if SinaAppId != "" {
            UMSocialSinaSSOHandler.openNewSinaSSOWithAppKey(SinaAppId, secret: SinaSectet, redirectURL: "")
        }
        
        
    }
    static func appearPage(page:String) -> Void {
        MobClick .beginLogPageView(page)
    }
    static func disappearPage(page:String) -> Void
    {
        MobClick.endLogPageView(page)
    }
    
}