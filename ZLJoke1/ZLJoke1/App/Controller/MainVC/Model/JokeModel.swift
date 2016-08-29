//
//  JokeModel.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/29.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JokeModel: NSObject {
    internal var _id:String?
    internal var title:String?
    
    internal var pic:String?
    internal var pic_w:Float = 0
    internal var pic_h:Float = 0
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == "id" {
            _id = value as? String
        }
    }
}
