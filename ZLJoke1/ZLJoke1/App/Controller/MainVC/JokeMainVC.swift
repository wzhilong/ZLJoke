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
import AVFoundation
class JokeMainVC: UIViewController ,UIScrollViewDelegate
{
    @IBOutlet weak var topScrollV: JKScrollTitle!
    
    internal var contentScrollV: JKContentScroll = JKContentScroll.init(frame: CGRectMake(0, 64, Globle.screenWidth, Globle.screenHeight - 64 ))
    
    internal var player:AVPlayer?
    internal var playerPlayer:AVPlayerLayer?
    internal var playVedioCell:JokeTextCell?
    

    internal var tuiJianTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var imgTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var textTV = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var vedioTV = JokeVedioTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    
    @IBAction func buttonClick(sender: AnyObject)
    {
        let delegate = UIApplication .sharedApplication().delegate as! AppDelegate
        delegate .startPresentVC()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        contentScrollV.addJokeTableSubleView(tuiJianTV)
        contentScrollV.addJokeTableSubleView(imgTV)
        contentScrollV.addJokeTableSubleView(textTV)
        contentScrollV.addJokeTableSubleView(vedioTV)
        contentScrollV.endDecelerating = endDece
        
        weak var wself = self
        topScrollV.addTitleArray(["推荐","趣图","物语","视频"]) { (num, title) in
            NSLog("num:%d , title:%s", num,title)
            wself?.contentScrollV .scrollToIndex(num)
            if num != 3
            {
                wself?.vedioTV.canclePlayer()
            }else
            {
                wself?.vedioTV.playerVedio()
            }
        }
        self .loadData()
    }
    
    func configTableView() -> Void {
        vedioTV.tableDelegate.cellImgClick = cellImgClick(_:)
        tuiJianTV.tableDelegate.cellClick = tableCellClick(_:)
        imgTV.tableDelegate.cellClick = tableCellClick(_:)
        textTV.tableDelegate.cellClick = tableCellClick(_:)
        vedioTV.tableDelegate.cellClick = tableCellClick(_:)
        self.view .addSubview(contentScrollV)
    }
    func tableCellClick(cell:JokeTextCell)->Void
    {
        let detailVC = JokeDetailVC()
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    func endDece(index:Int)->Void{
        topScrollV.titleClickAtIndex(index)
    }
    func cellImgClick(jokeCell:JokeTextCell) -> Void
    {
        NSLog("cellImgClick")
        if jokeCell.jokeModel.mp4_url != nil{
            
        }
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
