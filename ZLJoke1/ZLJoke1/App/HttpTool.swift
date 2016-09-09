//
//  HttpTool.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/29.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import Alamofire
class HttpTool: NSObject {

    static func POST(url:String,params:(Dictionary<String,AnyObject>)?,succuss:((obj:AnyObject)->Void)? ,failue:(()->Void)?) -> Void
    {
        Alamofire.request(.POST, url, parameters: params, encoding: .URLEncodedInURL, headers: nil).responseJSON { (response) in
            switch response.result{
            case .Success:
                succuss!(obj:response.result.value!)

                break
                
            case .Failure(let error):
                print(error)
                if failue != nil{
                    failue!()
                }
                break
            }
        }
    }
}
