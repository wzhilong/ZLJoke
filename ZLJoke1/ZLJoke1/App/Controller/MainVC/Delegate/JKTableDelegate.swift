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
    internal var cellImgClick:((jokeModel:JokeModel)->Void)?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        tableView .registerNib(UINib.init(nibName: "JokeTextCell", bundle: nil), forCellReuseIdentifier: "JokeTextCell")
        
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArray != nil {
            return dataArray!.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCellWithIdentifier("JokeTextCell")
        let cell = cel as!JokeTextCell
        cell.selectionStyle = .None
        if dataArray != nil && dataArray!.count > indexPath.row {
            cell.jokeModel = dataArray![indexPath.row] as! JokeModel
        }
        cell.imgClick = imgClickF(_:)
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let cel = tableView.dequeueReusableCellWithIdentifier("JokeTextCell")
        
        let cell = cel as!JokeTextCell
        if dataArray != nil && dataArray!.count > indexPath.row {
            cell.jokeModel = dataArray![indexPath.row] as! JokeModel
        }
        
        return cell .cellHeight()
    }
    func imgClickF (jokeModel:JokeModel) -> Void
    {
        if cellImgClick != nil {
            cellImgClick!(jokeModel: jokeModel)
        }
    }

}
