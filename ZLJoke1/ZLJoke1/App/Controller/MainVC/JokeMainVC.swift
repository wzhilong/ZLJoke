//
//  JokeMainVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
class JokeMainVC: UIViewController ,UIScrollViewDelegate
{
    @IBOutlet weak var topScrollV: JKScrollTitle!
    internal var contentScrollV: JKContentScroll = JKContentScroll.init(frame: CGRectMake(0, 64, Globle.screenWidth, Globle.screenHeight - 64 - 49))
    
    
    internal var tableViewArray:[UITableView]!
    
    
    internal var tuiJianTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var imgTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var textTV = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var vedioTV = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view .addSubview(contentScrollV)
        contentScrollV.addJokeTableSubleView(tuiJianTV)
        contentScrollV.addJokeTableSubleView(imgTV)
        contentScrollV.addJokeTableSubleView(textTV)
        contentScrollV.addJokeTableSubleView(vedioTV)
        contentScrollV.endDecelerating = endDece
        weak var wself = self
        topScrollV.addTitleArray(["推荐","趣图","物语","视频"]) { (num, title) in
            NSLog("num:%d , title:%s", num,title)
            wself?.contentScrollV .scrollToIndex(num)
        }
        self .loadData()
    }
    func endDece(index:Int)->Void{
        topScrollV.titleClickAtIndex(index)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
    }
    func loadData () -> Void
    {
        tuiJianTV.page = 1;
        imgTV.cid = "qutu"
        imgTV.page = 1
        textTV.cid = "mm"
        textTV.page = 1
        vedioTV.cid = "video"
        vedioTV.page = 1
    }
    
    
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}
