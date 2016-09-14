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
    
    @IBOutlet weak var topB: UIButton!
    internal var contentScrollV: JKContentScroll = JKContentScroll.init(frame: CGRectMake(0, 64, Globle.screenWidth, Globle.screenHeight - 64 ))
    
    internal var player:AVPlayer?
    internal var playerPlayer:AVPlayerLayer?
    internal var playVedioCell:JokeTextCell?
    

    internal var tuiJianTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var imgTV:JokeTableView = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var textTV = JokeTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    internal var vedioTV = JokeVedioTableView.init(frame: CGRectMake(0, 0, 0, 0), style:.Plain)
    
    internal var currentTV:JokeTableView?
    
    
    @IBAction func buttonClick(sender: AnyObject)
    {
        let delegate = UIApplication .sharedApplication().delegate as! AppDelegate
        delegate .startPresentVC()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }
    override func viewWillDisappear(animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTV = tuiJianTV
        self.configTableView()
        self .configView()
        
        weak var wself = self
        //当不是显示视频也是 不播放视频
        topScrollV.addTitleArray(["推荐","趣图","物语","视频"]) { (num, title) in
            NSLog("num:%d , title:%s", num,title)
            wself?.contentScrollV .scrollToIndex(num)
        }
    }
    
    /**
     配置界面
     */
    func  configView () -> Void {
        topB .layer.cornerRadius = 15;
        topB.layer.masksToBounds = true
        topB.layer.borderColor = UIColor.redColor().CGColor
        topB.layer.borderWidth = 0.5
        self.view .addSubview(topB)
        
        self.view.backgroundColor = vcBgColor
    }
    
    /**
     配置里面的选项
     */
    func configTableView() -> Void
    {
        vedioTV.cid = "video"
        vedioTV.tableDelegate.cellImgClick = vedioClick(_:)
        vedioTV.tableDelegate.cellClick = vedioClick(_:)
        
        tuiJianTV.cid = "joke"
        tuiJianTV.tableDelegate.cellClick = tableCellClick(_:)
        tuiJianTV.tableDelegate.cellImgClick = cellImgClick(_:)
        
        imgTV.cid = "qutu"
        imgTV.tableDelegate.cellClick = tableCellClick(_:)
        imgTV.tableDelegate.cellImgClick = cellImgClick(_:)
        
        textTV.cid = "mm"
        textTV.tableDelegate.cellClick = tableCellClick(_:)
        textTV.tableDelegate.cellImgClick = cellImgClick(_:)
        
        contentScrollV.addJokeTableSubleView(tuiJianTV)
        contentScrollV.addJokeTableSubleView(imgTV)
        contentScrollV.addJokeTableSubleView(textTV)
        contentScrollV.addJokeTableSubleView(vedioTV)
        contentScrollV.endDecelerating = endDece
        self.view .addSubview(contentScrollV)
    }
    
    /**
     cell 的点击处理函数
     */
    func tableCellClick(cell:JokeTextCell)->Void
    {
        let detailVC = JokeDetailVC()
        detailVC.jokeModel = cell.jokeModel
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    /**
     cell 上图片的点击跳转到显示图片的模式
     */
    func cellImgClick(jokeCell:JokeTextCell) -> Void
    {
        let imgVC = JKImgShowVC()
        imgVC.dataArray = getCurrentJokeTable().tableDelegate.dataArray!
        imgVC.selectedModel = jokeCell.model
        self.presentViewController(imgVC, animated: true)
        {
        }
    }
    /**
     视频播放点击处理
     */
    func  vedioClick(jokeCell:JokeTextCell) -> Void
    {
        let vc = JKVideoVC()
        vc.jokeModel = jokeCell.jokeModel
        self.navigationController?.pushViewController(vc , animated: true)
    }
    /**
     scroll结束翻页的处理
     */
    func endDece(index:Int)->Void{
        topScrollV.titleClickAtIndex(index)
    }
    
    func getCurrentJokeTable() -> JokeTableView {
        let x = (contentScrollV.contentOffset.x / contentScrollV.frame.size.width)
        switch x {
        case 0:
                self.currentTV = self.tuiJianTV
            break;
        case 1:
                self.currentTV = imgTV
            break;
        case 2:
                self.currentTV = textTV
            break;
        case 3:
                currentTV = vedioTV as JokeTableView
            break;
        default: break
        }
        return currentTV!
    }
    /**
     跳转到头部的按钮处理
     */
    @IBAction func topBClick(sender: AnyObject) {
        self .getCurrentJokeTable().scrollRectToVisible(CGRectMake(0, 0, 10, 10), animated: true)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

}
