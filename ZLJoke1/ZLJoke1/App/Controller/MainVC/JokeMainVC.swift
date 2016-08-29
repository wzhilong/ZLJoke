//
//  JokeMainVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import SnapKit
class JokeMainVC: UIViewController ,UIScrollViewDelegate
{
    @IBOutlet weak var topScrollV: JKScrollTitle!
    @IBOutlet weak var contentScrollV: JKContentScroll!
    
    
    internal var tableViewArray:[UITableView]!
    
    
    internal var tuiJianTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    
    internal var imgTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    
    internal var textTV = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var vedioTV = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(animated: Bool)
    {
    topScrollV.addTitleArray(["推荐","2","3","3","2","3","3","2","3","3"]) { (num, title) in
            NSLog("num:%d , title:%s", num,title)
        }
        contentScrollV.addSubview(tuiJianTV)
        contentScrollV.addSubview(imgTV)
        contentScrollV.addSubview(textTV)
        contentScrollV.addSubview(vedioTV)
    }
    func config() -> Void {
        contentScrollV.pagingEnabled = true
        contentScrollV.delegate = self
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}
