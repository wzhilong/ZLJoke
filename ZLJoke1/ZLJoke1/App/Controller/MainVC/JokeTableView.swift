//
//  SuggestVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/26.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JokeTableView: UITableView{

    internal var tableDelegate:JKTableDelegate = JKTableDelegate()
    internal var cid:String = "joke"
    internal var modelArray:[JokeModel] = Array<JokeModel>()
    
    private var url:String = ""
    private var pageIndex :Int = 1
    private var lastTimeMark:Int = 0
    
    internal var page:Int{
        set{
            self.pageIndex = newValue
            self .loadData()
        }
        get{
            return pageIndex
        }
    }
    internal var lastTime:Int
    {
        set{
            self.lastTimeMark = newValue
            self .loadData()
        }
        get{
            return lastTimeMark
        }
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.dataSource = tableDelegate
        self.delegate = tableDelegate
    }
    
    func loadData() -> Void
    {
        var dic = Dictionary<String,AnyObject>()
        dic["m"] = "Api386"
        dic["c"] = "index"
        dic["pad"] = "0"
        dic["sw"] = "1"
        dic["cid"] = cid
        dic["p"] = pageIndex
        dic["markId"] = "0"
        dic["date"] = "0"
        if lastTimeMark != 0 {
            dic["p"] = lastTimeMark
        }
        if pageIndex == 1 {
            self.modelArray .removeAll()
        }
        
        weak var wself :JokeTableView? = self
        HttpTool.POST("http://xiaoliao.vipappsina.com/index.php", params: dic, succuss:{
            (obj) in
            
            
            let dic = obj as! Dictionary<String,AnyObject>
            if dic["rows"] != nil
            {
                let arr = dic["rows"] as! Array<Dictionary<String,AnyObject>>
                for d in arr {
                    let model = JokeModel()
                    model .setValuesForKeysWithDictionary(d)
                    wself!.modelArray.append(model)
                }
                wself!.tableDelegate.dataArray = wself?.modelArray
                wself!.reloadData()
            }
        }) { (error) in
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
