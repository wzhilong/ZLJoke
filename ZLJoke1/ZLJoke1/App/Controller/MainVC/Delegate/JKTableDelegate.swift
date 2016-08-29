//
//  JKTableDelegate.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/26.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JKTableDelegate: NSObject ,UITableViewDelegate,UITableViewDataSource
{
    internal var dataArray:[AnyObject]?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        tableView .registerNib(UINib.init(nibName: "JokeTextCell", bundle: nil), forCellReuseIdentifier: "JokeTextCell")
        
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArray != nil {
            return dataArray!.count
        }
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCellWithIdentifier("JokeTextCell")
        let cell = cel as!JokeTextCell
        
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let cel = tableView.dequeueReusableCellWithIdentifier("JokeTextCell")
        let cell = cel as!JokeTextCell
        return cell .cellHeight()
    }

}
