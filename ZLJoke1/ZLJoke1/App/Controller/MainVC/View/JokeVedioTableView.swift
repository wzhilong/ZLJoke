//
//  JokeVedioTableView.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/31.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import AVFoundation

class JokeVedioTableView: JokeTableView
{
    internal var vedioPlayerCell:JokeTextCell?
    internal var avPlayer:AVPlayer?
    internal var avPlayerLayer:AVPlayerLayer?
    
    override init(frame: CGRect, style: UITableViewStyle)
    {
        super.init(frame: frame, style: style)
        self.tableDelegate.scrollBlock = vedioCellScroll
        self.tableDelegate.endDecelerate = vedioCellEndDece
        self.tableDelegate.endDragging = vedioCellEndDragging
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func vedioCellScroll()->Void
    {
        self .canclePlayer()
    }
    func vedioCellEndDece()->Void
    {
        playerVedio()
        NSLog("scrollViewDidEndDecelerate")
    }
    func vedioCellEndDragging()->Void
    {
        playerVedio()
        NSLog("scrollViewDidEndDragging")
    }
    
    func playerVedio () -> Void {
        let cellArray = self.setVisibleImgVCell()
        for cell in cellArray
        {
            let jokeCell = cell
            if jokeCell.model.mp4_url != nil {
                self.canclePlayer()
                avPlayer = AVPlayer.init(URL: NSURL.init(string: jokeCell.model.mp4_url!)!)
                avPlayerLayer = AVPlayerLayer.init(player: avPlayer)
                avPlayerLayer?.frame = jokeCell.imgV.bounds
                avPlayerLayer?.backgroundColor = UIColor.whiteColor().CGColor
                jokeCell.imgV.layer .addSublayer(avPlayerLayer!)
                avPlayer?.play()
                vedioPlayerCell = jokeCell
                break;
            }
        }
    }
    func  canclePlayer() -> Void
    {
        if nil != avPlayer  {
            avPlayer?.pause()
            avPlayerLayer?.removeFromSuperlayer()
            avPlayer = nil
            avPlayerLayer = nil
        }
    }
    func  setVisibleImgVCell() -> [JokeTextCell] {
        let cellArray = self.visibleCells
        var arr = Array<JokeTextCell>()
        for cell in cellArray
        {
            let jokeCell = cell as! JokeTextCell
            let rect = jokeCell.convertRect(jokeCell.imgV.frame, toView: self.superview)
            if (CGFloat)(rect.origin.y)  > (CGFloat)(jokeCell.imgV.frame.size.height * -1/2) {
                arr.append(jokeCell)
            }
        }
        return arr
    }
    
}
