//
//  JKDataLoad.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/30.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import Foundation
class JKDataLoad {
    
    internal var cid:String = ""
    

    
    static func getNeiHanData(cid:String ,page:Int ,finishBlock:((AnyObject)->Void)? ,falure:(()->Void)?) -> Void {
        var dic = Dictionary<String,AnyObject>()
        if page == 1 {
            dic["p"] = page
            dic["markId"] = "0"
            dic["date"] = "0"
        }else
        {
            dic["lastTime"] = NSDate.init(timeIntervalSinceNow: 0) .timeIntervalSince1970 - (NSTimeInterval)(3600 * 24 * page)
        }
        dic["m"] = "Api386"
        dic["c"] = "index"
        dic["pad"] = "0"
        dic["sw"] = "1"
        dic["cid"] = cid
        
        
        HttpTool.POST("http://xiaoliao.vipappsina.com/index.php", params: dic, succuss:
            {
                (obj) in
                if finishBlock != nil
                {
                    if let dic = obj as? Dictionary<String,AnyObject>
                    {
                        NSLog("%@", dic)
                        finishBlock!(obj)
                    }
                    if let arr = obj as? Array<AnyObject>
                    {
                        var dic = Dictionary<String,AnyObject>()
                        dic["rows"] = arr;
                        finishBlock!(dic)
                    }
                }
        }) { (error) in
            if falure != nil
            {
                falure!()
            }
        }
    }
    
    
}