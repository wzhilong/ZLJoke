//
//  Globle.swift
//  ZLJoke
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit


class Globle: NSObject {
    static let screenWidth  = UIScreen.mainScreen().bounds.width
    static let screenHeight = UIScreen.mainScreen().bounds.height
    
    static let APP_URLH = "http://xiaoliao.vipappsina.com/index.php/Api386/index/pad/0/sw/1/cid/joke/p/1/markId/0/date/"
    static var params:Dictionary<String,AnyObject>  = Dictionary<String,AnyObject>()
    
    
    
}
