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
    }
    func vedioCellEndDece()->Void
    {
        NSLog("scrollViewDidEndDecelerate")
    }
    func vedioCellEndDragging()->Void
    {
        NSLog("scrollViewDidEndDragging")
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
