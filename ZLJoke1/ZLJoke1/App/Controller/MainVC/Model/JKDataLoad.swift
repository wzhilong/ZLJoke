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
    

    
    static func getData(cid:String ,page:Int ,finishBlock:((AnyObject)->Void)? ,falure:(()->Void)?) -> Void {
        var dic = Dictionary<String,AnyObject>()
        dic["m"] = "Api386"
        dic["c"] = "index"
        dic["pad"] = "0"
        dic["sw"] = "1"
        dic["cid"] = cid
        dic["p"] = page
        dic["markId"] = "0"
        dic["date"] = "0"
        
        HttpTool.POST("http://xiaoliao.vipappsina.com/index.php", params: dic, succuss:
            {
                (obj) in
                if finishBlock != nil
                {
                    finishBlock!(obj)
                }
        }) { (error) in
            if falure != nil
            {
                falure!()
            }
        }
    }
    
    
}