//
//  SuggestVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/26.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import MJRefresh
class JokeTableView: UITableView{

    internal var tableDelegate:JKTableDelegate = JKTableDelegate()
    
    
    internal var modelArray:[JokeModel] = Array<JokeModel>()
    internal var cid:String = "joke"
    private var url:String = ""
    private var pageIndex :Int = 1
    internal var page:Int = 1

    
    override init(frame: CGRect, style: UITableViewStyle)
    {
        super.init(frame: frame, style: style)
        self.dataSource = tableDelegate
        self.delegate = tableDelegate
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(headerRefreash))
        self.mj_footer = MJRefreshBackStateFooter.init(refreshingTarget: self, refreshingAction: #selector(footerRefresh))
        
        self.mj_header .beginRefreshing()
        
    }
    func headerRefreash() -> Void {
        page = 1
        self.loadData()
        
    }
    func  footerRefresh() -> Void {
        page = page + 1
        self .loadData()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData() -> Void
    {
        weak var wself = self
        JKDataLoad .getNeiHanData(cid, page: page, finishBlock: { (obj) in
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
            
            wself?.mj_footer .endRefreshing()
            wself?.mj_header .endRefreshing()
            }) {
                //获取数据失败的处理代码
                wself?.mj_footer .endRefreshing()
                wself?.mj_header .endRefreshing()
        }
    }
    
    
}
