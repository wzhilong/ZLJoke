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
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        
    }
    
    func loadData() -> Void
    {
        weak var wself = self
        JKDataLoad .getData(cid, page: page, finishBlock: { (obj) in
            //当时第一页是 清空原有数据
            if wself?.page == 1 {
                wself?.modelArray .removeAll()
            }
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
            }) {
                //获取数据失败的处理代码
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
